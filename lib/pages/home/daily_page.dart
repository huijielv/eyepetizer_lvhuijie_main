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

/// 描述 :    首页->日报
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/11
///
class DailyPage extends StatefulWidget {
  static const String TAG = "DISCOVER_PAGE";

  @override
  _DailyPageState createState() {
    return _DailyPageState();
  }
}

class _DailyPageState extends State<DailyPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoader = false;
  LoadStatus _loadStatus = LoadStatus.init;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
//    getDailyData();
  }

  @override
  void dispose() {}

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    if (!isLoader) {
      isLoader = true;
      bloc.onRefresh(labelId: Strings.daily, isRefresh: true);
    }

    return StreamBuilder<List<ItemBaseListItem>>(
      stream: bloc.dailyStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<ItemBaseListItem>> snapshot) {
        return RefreshListView(
          scrollController: _scrollController,
          itemCount: snapshot.data == null ? 0 : snapshot.data.length + 1,
          itemBuilder: (context, index) {
            if (index == snapshot.data.length) {
              return FooterView(loadStatus: _loadStatus);
            } else {
            return ViewCardUtil.getViewCard(snapshot.data[index]);
            }
          },
          onRefresh: ({bool isReload}) {
            return bloc.onRefresh(labelId: Strings.daily, isRefresh: true);
          },
          onLoadMore: ({bool isReload}) {
            setState(() {
              _loadStatus = LoadStatus.loading;
            });

            return bloc.onLoadMore(
                labelId: Strings.daily,
                isRefresh: false,
                onLoadCompleted: (LoadStatus status) {
                  setState(() {
                    _loadStatus = status;
                  });
                });
          },
        );
      },
    );
  }
}
