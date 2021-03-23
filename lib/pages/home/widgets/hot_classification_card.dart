import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/title_card.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HotClassificationCard extends StatelessWidget {
  const HotClassificationCard({Key key, this.data}) : super(key: key);

  final ItemBaseListItem data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleCard(
          tag: "DISCOVER_PAGE",
          title: "热门分类",
        ),
        Container(
          height: 225,
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 6, crossAxisSpacing: 6),
              itemCount: data.data.itemList.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CoverImageWidget(
                        imageUrl: data.data.itemList[index].data.image,
                        borderRadius: 2),
                    Text(data.data.itemList[index].data.title,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                );
              }),
        )
      ],
    );
  }
}
