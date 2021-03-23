import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import '../code.dart';



const NOT_TIP_KEY = "noTip";

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(Response(data: {'code': Code.NETWORK_ERROR}));
    }
    return options;
  }
}
