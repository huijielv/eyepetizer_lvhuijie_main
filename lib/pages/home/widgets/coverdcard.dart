import 'package:eyepetizer_lvhuijie_main/model/itembaselistdata.dart';
import 'package:eyepetizer_lvhuijie_main/utils/date_util.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoverCard extends StatelessWidget {
  const CoverCard({Key key, this.data}) : super(key: key);

  final ItemBaseListData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: CoverImageWidget(
            imageUrl: data.content.data.cover.feed,
            borderRadius: 5,
          ),
        ),
        Positioned(
            child: Visibility(
          visible: data.content.type == "video",
          child: Container(
            width: 40.0,
            height: 20.0,
            margin: EdgeInsets.fromLTRB(0, 0, 16, 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: new BorderRadius.circular(2.0)),
            child: Text (
              DateUtil.getDuration(data.content.type == "video"
                  ? data.content.data.duration
                  : 0),
              style: TextStyle (fontSize: 12,color: Colors.white,decoration: TextDecoration.none
              ,),
              textAlign: TextAlign.center,
            ),
          ),
        ))
      ],
    );
  }
}
