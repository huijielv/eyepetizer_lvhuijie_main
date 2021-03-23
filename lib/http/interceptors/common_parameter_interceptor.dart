import 'package:dio/dio.dart';
import 'package:eyepetizer_lvhuijie_main/config/config.dart';



class CommonParameterInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.queryParameters.addAll({
      'udid': Config.UDID,
      'vc': Config.VC,
      'vn': Config.VN,
      'size': Config.SIZE,
      'deviceModel': Config.DEVICE_MODEL,
      'first_channel': Config.FIRST_CHANNEL,
      'last_channel': Config.LAST_CHANNEL,
      'system_version_code': Config.SYSTEM_VERSION_CODE
    });
    return super.onRequest(options);
  }
}
