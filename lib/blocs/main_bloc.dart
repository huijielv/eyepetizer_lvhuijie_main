import 'dart:async';

import 'package:eyepetizer_lvhuijie_main/blocs/base_bloc.dart';
import 'package:eyepetizer_lvhuijie_main/model/base_kai_yan_list.dart';
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/repository/home_repository.dart';
import 'package:eyepetizer_lvhuijie_main/res/strings.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/footer_view.dart';

typedef void OnLoadCompleted(LoadStatus status);

class MainBloc extends BaseBloc {
  StreamController<List<ItemBaseListItem>> discoverStreamController =
      StreamController<List<ItemBaseListItem>>.broadcast();

  StreamController<List<ItemBaseListItem>> dailyStreamController =
      StreamController<List<ItemBaseListItem>>.broadcast();

  StreamController<List<ItemBaseListItem>> recommendStreamController =
      StreamController<List<ItemBaseListItem>>.broadcast();

  Stream<List<ItemBaseListItem>> get discoverStream =>
      discoverStreamController.stream;

  Stream<List<ItemBaseListItem>> get dailyStream =>
      dailyStreamController.stream;

  Stream<List<ItemBaseListItem>> get recommendStream =>
      recommendStreamController.stream;

  @override
  void dispose() {
    discoverStreamController.close();
  }

  List<ItemBaseListItem> discoverItems = List();

  List<ItemBaseListItem> dailyItems = List();

  List<ItemBaseListItem> recommendItems = List();

  Future onRefresh({String labelId, bool isRefresh, bool isReload}) {
    return getData(labelId: labelId, isRefresh: isRefresh);
  }

  Future onLoadMore(
      {String labelId,
      bool isRefresh,
      bool isReload,
      OnLoadCompleted onLoadCompleted}) {
    return getData(
        labelId: labelId,
        isRefresh: isRefresh,
        onLoadCompleted: onLoadCompleted);
  }

  Future getData(
      {String labelId, bool isRefresh, OnLoadCompleted onLoadCompleted}) {
    switch (labelId) {
      case Strings.discover:
        return getDiscoverData(onLoadCompleted: onLoadCompleted);

      case Strings.daily:
        return getDailyData(
            isRefresh: isRefresh, onLoadCompleted: onLoadCompleted);

      case Strings.recommend:
        return getRecommendData(
            isRefresh: isRefresh, onLoadCompleted: onLoadCompleted);
    }
  }

  Future getDiscoverData({OnLoadCompleted onLoadCompleted}) async {
    BaseKaiYanList baseKaiYanList = await HomeRepository.getDiscoverData();

    if (baseKaiYanList != null &&
        baseKaiYanList.itemList != null &&
        baseKaiYanList.itemList.length > 0) {
      discoverItems.clear();
      discoverItems.addAll(baseKaiYanList.itemList);
    }
    discoverStreamController.sink.add(discoverItems);
  }

  String dailyNextPageUrl;

  Future getDailyData({bool isRefresh, OnLoadCompleted onLoadCompleted}) async {
    BaseKaiYanList baseKaiYanList = await HomeRepository.getDailyData(
        nextPageUrl: isRefresh ? "" : dailyNextPageUrl);
    dailyNextPageUrl = baseKaiYanList.nextPageUrl;

    if (baseKaiYanList.itemList != null && baseKaiYanList.itemList.length > 0) {
      if (isRefresh) {
        dailyItems.clear();
      }
      dailyItems.addAll(baseKaiYanList.itemList);
    }
    dailyStreamController.sink.add(dailyItems);

    if (onLoadCompleted != null) {
      onLoadCompleted(LoadStatus.completed);
    }
  }

  String recommendNextPageUrl;

  Future getRecommendData(
      {bool isRefresh, OnLoadCompleted onLoadCompleted}) async {
    BaseKaiYanList baseKaiYanList =
        await HomeRepository.getCommunityRecommendData(
            nextPageUrl: isRefresh ? "" : dailyNextPageUrl);
    recommendNextPageUrl = baseKaiYanList.nextPageUrl;

    if (baseKaiYanList.itemList != null && baseKaiYanList.itemList.length > 0) {
      List<ItemBaseListItem> recommendItems2 = baseKaiYanList.itemList
          .where((value) => value.type == "communityColumnsCard")
          .toList();

      if (isRefresh) {
        recommendItems.clear();
      }
      recommendItems.addAll(recommendItems2);
    }
    recommendStreamController.sink.add(recommendItems);

    if (onLoadCompleted != null) {
      onLoadCompleted(LoadStatus.completed);
    }
  }
}
