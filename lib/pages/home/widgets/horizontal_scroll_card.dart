import 'package:eyepetizer_lvhuijie_main/model/itembaselistdata.dart';
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class HorizontalScrollCard extends StatelessWidget {
  const HorizontalScrollCard({Key key, this.tag, this.data}) : super(key: key);

  final String tag;
  final ItemBaseListItem data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Swiper(
        itemCount: data.data.itemList.length,
        viewportFraction: 0.95,
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
                child: CoverImageWidget(
                  imageUrl: data.data.itemList[index].data.image,
                  borderRadius: 5,
                ),
              ),
              Visibility(
                visible: getText(index) == null,
                child: Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Container(
                    width: 40.0,
                    height: 20.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration (
                      color: Colors.black26,
                      borderRadius: new BorderRadius.circular(2.0)),
                      child: Text(getText(index),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center)
                    ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  String getText(int index) {
    if (data.data.itemList[index].data.label != null &&
        data.data.itemList[index].data.label.text != null) {
      return data.data.itemList[index].data.label.text;
    } else {
      return "";
    }
  }
}
