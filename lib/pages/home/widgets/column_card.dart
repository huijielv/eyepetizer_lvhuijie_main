

import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/title_card.dart';
import 'package:flutter/cupertino.dart';

import 'column_item_card.dart';
class ColumnCard extends StatelessWidget {
  const ColumnCard({Key key, this.data}) : super(key: key);

  final ItemBaseListItem data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TitleCard(
          tag: "DISCOVER_PAGE",
          title: "专题策划",
        ),
        Container(
          height: 200,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics (),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 2.0
              ),
              itemCount: data.data.itemList.length,
              itemBuilder: (context ,index){
                return ColumnItemCard (data: data.data.itemList[index].data);
              }),
        )
      ],
    );
  }

}