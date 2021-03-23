import 'package:eyepetizer_lvhuijie_main/blocs/bloc_provider.dart';
import 'package:eyepetizer_lvhuijie_main/blocs/main_bloc.dart';
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/res/strings.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/footer_view.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/refresh_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/staggered_view.dart';

class RecommendPage extends StatefulWidget {
  static const String TAG = "RECOMMEND_PAGE";

  @override
  State createState() {
    return RecommendPageState();
  }
}

class RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  bool isLoder = false;

  LoadStatus _loadStatus = LoadStatus.init;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = BlocProvider.of<MainBloc>(context);
    if (!isLoder) {
      isLoder = true;
      bloc.onRefresh(labelId: Strings.recommend, isRefresh: true);
    }
    return StreamBuilder<List<ItemBaseListItem>>(
      stream: bloc.recommendStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<ItemBaseListItem>> snapshot) {
        return RefreshListView(
          onRefresh: ({bool isReload}) {
            return bloc.onRefresh(labelId: Strings.recommend, isRefresh: true);
          },
          itemCount: snapshot.data == null ? 0 : 2,
          scrollController: _scrollController,
          onLoadMore: () {
            setState(() {
              _loadStatus = LoadStatus.loading;
            });
            return bloc.onLoadMore(
                labelId: Strings.recommend,
                isRefresh: false,
                onLoadCompleted: (LoadStatus status) {
                  setState(() {
                    _loadStatus = status;
                  });
                });
          },
          itemBuilder: (context, index) {
            if (index == 1) {
              return FooterView(loadStatus: _loadStatus);
            } else {
              return StaggeredViewCard(list: snapshot.data);
            }
          },
        );
      },
    );
  }
}
