import 'package:dio/dio.dart';
import 'package:eyepetizer_lvhuijie_main/model/base_kai_yan_list.dart';
import 'package:eyepetizer_lvhuijie_main/model/details.dart';


import '../api.dart';
import '../http_manager.dart';


class DetailRepository {


  static Future<Detail> getVideoDetail ( int id , {String resourceType}) async {
    Map<String, dynamic> result =await HttpManager.getInstance().request(Api.VIDEO_DETAIL+id.toString(),
    data: {'resourceType':resourceType},
        options: Options(method: "GET")
    );
    Detail detail = Detail.fromJson(result);
    return detail;


  }

  /// 获取相关视频数据
  static Future<BaseKaiYanList> getRelateVideo(int id) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.RELATE_VIDEO,
        data: {'id': id},
        options: Options(method: "GET"));

    BaseKaiYanList baseKaiYanList = BaseKaiYanList.fromJson(result);

    return baseKaiYanList;
  }

}
