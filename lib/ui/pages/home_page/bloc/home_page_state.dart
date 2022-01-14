import 'package:dream_bit_cats/models/cat_info_model/cat_info_model.dart';

class HomePageState {
  final List<CatInfoModel> cats;
  final bool showLoader;
  final bool internetConnection;

  const HomePageState({
    required this.cats,
    required this.showLoader,
    required this.internetConnection,
  });

  HomePageState copyWith({
    List<CatInfoModel>? cats,
    bool? showLoader,
    bool? internetConnection,
  }) {
    return HomePageState(
      cats: cats ?? this.cats,
      showLoader: showLoader ?? this.showLoader,
      internetConnection: internetConnection ?? this.internetConnection,
    );
  }
}
