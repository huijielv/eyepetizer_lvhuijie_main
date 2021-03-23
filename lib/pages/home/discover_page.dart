import 'package:eyepetizer_lvhuijie_main/blocs/bloc_provider.dart';
import 'package:eyepetizer_lvhuijie_main/blocs/main_bloc.dart';
import 'package:eyepetizer_lvhuijie_main/model/base_kai_yan_list.dart';
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/repository/home_repository.dart';
import 'package:eyepetizer_lvhuijie_main/res/strings.dart';
import 'package:eyepetizer_lvhuijie_main/utils/log_util.dart';
import 'package:eyepetizer_lvhuijie_main/utils/view_card_util.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/footer_view.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/refresh_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    首页->发现

class DiscoverPage extends StatefulWidget {
  static const String TAG = "DISCOVER_PAGE";

  @override
  _DiscoverState createState() {
    return _DiscoverState();
  }
}

class _DiscoverState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoder = false;
  LoadStatus _loadStatus = LoadStatus.init;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
//    getDailyData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    if (!isLoder) {
      isLoder = true;
      bloc.onRefresh(labelId: Strings.discover);
    }

    return StreamBuilder<List<ItemBaseListItem>>(
        stream: bloc.discoverStream,
        builder: (BuildContext context,
            AsyncSnapshot<List<ItemBaseListItem>> snapshot) {
          return RefreshListView(
              onRefresh: ({bool isReload}) {
                return bloc.onRefresh(
                    labelId: Strings.discover, isRefresh: true);
              },

              scrollController: _scrollController,
              itemCount: snapshot.data == null ? 0 : snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index == snapshot.data.length) {
                  return FooterView(loadStatus: _loadStatus);
                } else {
                  return ViewCardUtil.getViewCard(snapshot.data[index]);
                }
              });
        });
  }

  Future getDailyData() async {
    BaseKaiYanList baseListData =
        await HomeRepository.getDiscoverData(nextPageUrl: true ? "" : "");

    setState(() {
      baseListData = baseListData;
    });

    LogUtil.e(
        "123----" + baseListData.itemList[1].data.itemList[0].data.title + "");
  }
}
