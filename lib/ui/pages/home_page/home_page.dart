import 'package:dream_bit_cats/res/app_fonts.dart';
import 'package:dream_bit_cats/res/image_assets.dart';
import 'package:dream_bit_cats/ui/layouts/main_layout.dart';
import 'package:dream_bit_cats/ui/pages/home_page/bloc/home_page_bloc.dart';
import 'package:dream_bit_cats/ui/pages/home_page/bloc/home_page_events.dart';
import 'package:dream_bit_cats/ui/pages/home_page/bloc/home_page_state.dart';
import 'package:dream_bit_cats/ui/pages/home_page/widgets/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    context.read<HomePageBloc>().add(GetCatsListEvent());
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: 'Cats List',
      canPop: false,
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (BuildContext context, state) {
          if (state.showLoader) {
            return Center(child: CircularProgressIndicator());
          } else if (state.internetConnection == false) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  ImageAssets.sadCryingCat,
                  height: 300.0,
                  width: 300.0,
                ),
                Text(
                  'Some error has occurred, check your internet connection or try again later',
                  style: AppFonts.f18w600Black,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    context.read<HomePageBloc>().add(GetCatsListEvent());
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      child: Text(
                        'Try again',
                        style: AppFonts.f18w600Black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: state.cats.length,
              itemBuilder: (context, index) {
                return CatCard(cat: state.cats[index]);
              },
            );
          }
        },
      ),
    );
  }

  void _scrollListener() {
    if (scrollController.offset <= scrollController.position.minScrollExtent && !scrollController.position.outOfRange) {
      context.read<HomePageBloc>().add(GetCatsListEvent());
    }
  }
}
