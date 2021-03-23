import 'package:dio/dio.dart';
import 'package:eyepetizer_lvhuijie_main/http/api.dart';
import 'package:eyepetizer_lvhuijie_main/http/code.dart';
import 'package:eyepetizer_lvhuijie_main/http/http_manager.dart';
import 'package:eyepetizer_lvhuijie_main/model/base_kai_yan_list.dart';
import 'package:eyepetizer_lvhuijie_main/utils/log_util.dart';

/// 描述 :
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class HomeRepository {
  /// 获取发现数据
  static Future<BaseKaiYanList> getDiscoverData({String nextPageUrl}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.DISCOVER,
        targetUrl: nextPageUrl,
        options: Options(method: "GET"));

    BaseKaiYanList dailyEntity;

    if (result['code'] == Code.NETWORK_ERROR) {
    } else {
      dailyEntity = BaseKaiYanList.fromJson(result);
    }
    return dailyEntity;
  }

  /// 获取日报数据
  static Future<BaseKaiYanList> getDailyData({String nextPageUrl}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.DAILY,
        targetUrl: nextPageUrl,
        options: Options(method: "GET"));
    BaseKaiYanList dailyEntity;

    if (result['code'] == Code.NETWORK_ERROR) {
    } else {
      dailyEntity = BaseKaiYanList.fromJson(result);
    }
    return dailyEntity;
  }


  static Future<BaseKaiYanList> getCommunityRecommendData(
      {String nextPageUrl}) async {
    Map<String, dynamic> result = await HttpManager.getInstance().request(
        Api.COMMUNITY_RECOMMEND,
        targetUrl: nextPageUrl,
        options: Options(method: "GET"));
    BaseKaiYanList dailyEntity;

    if (result['code'] == Code.NETWORK_ERROR) {} else {
      dailyEntity = BaseKaiYanList.fromJson(result);
    }
    return dailyEntity;
  }


}
