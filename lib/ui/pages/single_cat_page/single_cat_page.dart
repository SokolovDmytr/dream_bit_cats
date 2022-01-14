import 'package:dream_bit_cats/models/cat_info_model/cat_info_model.dart';
import 'package:dream_bit_cats/res/app_const.dart';
import 'package:dream_bit_cats/res/app_fonts.dart';
import 'package:dream_bit_cats/res/image_assets.dart';
import 'package:dream_bit_cats/ui/layouts/main_layout.dart';
import 'package:dream_bit_cats/ui/pages/single_cat_page/widgets/one_stat_option.dart';
import 'package:dream_bit_cats/ui/pages/single_cat_page/widgets/stats_bar.dart';
import 'package:flutter/material.dart';

class SingleCatPage extends StatelessWidget {
  final CatInfoModel cat;

  const SingleCatPage({
    required this.cat,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: cat.name,
      canPop: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage.assetNetwork(
              placeholder: ImageAssets.dummyCat,
              image: cat.image?.url ?? AppConst.emptyString,
              imageErrorBuilder: (_, __, ___) {
                return Image.asset(ImageAssets.dummyCat);
              },
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Life span: ${cat.lifeSpan}',
                style: AppFonts.f18w600Black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OneStatOption(stat: 'Natural', inputNumber: cat.natural),
                OneStatOption(stat: 'Experimental', inputNumber: cat.experimental),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OneStatOption(stat: 'Hairless', inputNumber: cat.hairless),
                OneStatOption(stat: 'Rare', inputNumber: cat.rare),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OneStatOption(stat: 'Short legs', inputNumber: cat.shortLegs),
                OneStatOption(stat: 'Hypoallergenic', inputNumber: cat.hypoallergenic),
              ],
            ),
            StatsBar(stat: 'Health issues', filledColors: cat.healthIssues),
            StatsBar(stat: 'Adaptability', filledColors: cat.adaptability),
            StatsBar(stat: 'Energy level', filledColors: cat.energyLevel),
            StatsBar(stat: 'Intelligence', filledColors: cat.intelligence),
            StatsBar(stat: 'Social needs', filledColors: cat.socialNeeds),
            StatsBar(stat: 'Child friendly', filledColors: cat.childFriendly),
            StatsBar(stat: 'Dog friendly', filledColors: cat.dogFriendly),
            StatsBar(stat: 'Stranger friendly', filledColors: cat.strangerFriendly),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Description: ',
                style: AppFonts.f18w600Black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Text(
                cat.description,
                style: AppFonts.f16w600Black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
