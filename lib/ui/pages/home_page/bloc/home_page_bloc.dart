import 'dart:async';

import 'package:dream_bit_cats/models/cat_info_model/cat_info_model.dart';
import 'package:dream_bit_cats/res/app_const.dart';
import 'package:dream_bit_cats/res/http_route.dart';
import 'package:dream_bit_cats/services/network_service/models/base_http_response.dart';
import 'package:dream_bit_cats/services/network_service/models/get_breeds_params.dart';
import 'package:dream_bit_cats/services/network_service/models/no_internet_exception.dart';
import 'package:dream_bit_cats/services/network_service/models/server_error_exception.dart';
import 'package:dream_bit_cats/services/network_service/network_service.dart';
import 'package:dream_bit_cats/ui/pages/home_page/bloc/home_page_events.dart';
import 'package:dream_bit_cats/ui/pages/home_page/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc()
      : super(HomePageState(
          cats: [],
          showLoader: false,
          internetConnection: true,
        )) {
    on<GetCatsListEvent>((event, emit) async {
      emit(state.copyWith(showLoader: true));
      try {
        final bool internetConnectionAvailable = await NetworkService.instance.checkInternetConnection();
        if (internetConnectionAvailable == false) {
          throw NoInternetException();
        }
        BaseHttpResponse response = await NetworkService.instance
            .request(
              type: HttpType.httpGet,
              route: HttpRoute.breeds,
              parameter: GetBreeds(),
            )
            .timeout(
              AppConst.tryConnection,
              onTimeout: () => throw TimeoutException('Can\'t connect in ${AppConst.tryConnection.inSeconds} seconds.'),
            );

        if (response.response == null) {
          throw ServerErrorException();
        }

        List<dynamic> tempList = response.response;
        List<CatInfoModel> cats = [];
        for (int index = 0; index < tempList.length; index++) {
          cats.add(CatInfoModel.fromJson(tempList[index]));
        }
        emit(state.copyWith(cats: cats, showLoader: false, internetConnection: true));
        return;
      } catch (_) {
        emit(state.copyWith(showLoader: false, internetConnection: false));
        return;
      }
    });
  }
}
