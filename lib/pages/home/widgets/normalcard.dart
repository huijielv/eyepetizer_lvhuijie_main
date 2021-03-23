import 'package:eyepetizer_lvhuijie_main/model/itembaselistdata.dart';
import 'package:eyepetizer_lvhuijie_main/utils/routes.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coverdcard.dart';

class NormalCard extends StatelessWidget {
  const NormalCard({Key key, this.data}) : super(key: key);
  final ItemBaseListData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PAGE_DETAIL, arguments: data.header.id);
      },
      child: Container(
          child: Column(
        children: [

          CoverCard(
           data: data,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
            color: Colors.white,
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: CoverImageWidget(
                          imageUrl: data.header.icon, borderRadius: 100)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.content.data.title,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              decoration: TextDecoration.none)),
                      Text(
                        data.header.description,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                  flex: 1,
                ),
                Icon(Icons.share_rounded)
              ],
            ),
          )
        ],
      )),
    );
  }
}
