import 'package:dream_bit_cats/res/app_const.dart';
import 'package:dream_bit_cats/services/network_service/interfaces/i_parameter.dart';

class GetBreeds extends IParameter {
  @override
  Map<String, String> getParams() {
    return AppConst.emptyMap;
  }
}
