import 'package:dream_bit_cats/models/cat_info_model/cat_info_model.dart';
import 'package:dream_bit_cats/res/app_const.dart';
import 'package:dream_bit_cats/res/app_fonts.dart';
import 'package:dream_bit_cats/res/image_assets.dart';
import 'package:dream_bit_cats/ui/pages/single_cat_page/single_cat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatCard extends StatelessWidget {
  final CatInfoModel cat;

  const CatCard({
    required this.cat,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.lightBlue,
          width: 2.0,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleCatPage(cat: cat))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cat.name,
                    style: AppFonts.f20w700White,
                  ),
                ),
                Text(
                  cat.origin,
                  style: AppFonts.f16w600Black,
                ),
                FadeInImage.assetNetwork(
                  placeholder: ImageAssets.dummyCat,
                  image: cat.image?.url ?? AppConst.emptyString,
                  imageErrorBuilder: (_, __, ___) {
                    return Image.asset(ImageAssets.dummyCat);
                  },
                ),
              ],
            ),
          ),
          if (cat.wikipediaUrl != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Read more here: ',
                      style: AppFonts.f18w700White,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launch(cat.wikipediaUrl!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cat.wikipediaUrl!,
                      style: AppFonts.f18w700WhiteUnderLine,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
