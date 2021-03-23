import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/utils/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'stagegered_item_card.dart';

class StaggeredViewCard extends StatelessWidget {
  const StaggeredViewCard({Key key, this.list}) : super(key: key);

  final List<ItemBaseListItem> list;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return StaggeredItemCard(data: list[index]);

        },
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 3));
  }
}
