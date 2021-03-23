
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/utils/date_util.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VideoSmallCard extends StatelessWidget {
  const VideoSmallCard({Key key, this.width, this.height, this.data})
      : super(key: key);

  final double width;
  final double height;
  final ItemBaseListItem data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(

      onTap: (){

      },

      child: Container (
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Row (
          children: [
            Stack(


              children: [
                Container (
                  width: width,
                  height: height,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: CoverImageWidget(
                    imageUrl: data.data.cover.feed,
                  ),
                ),
                Positioned(child: Container(
                  width: 50,
                  height: 25,
                  margin: EdgeInsets.fromLTRB(0, 0, 16, 6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: new BorderRadius.circular(2.0)
                  ),

                    child: Text(DateUtil.getDuration(data.data.duration),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                        textAlign: TextAlign.center)

                ),
                  bottom: 10,
                  right: 10,
                )
              ],




            ),

            Expanded(child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  data.data.title,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(height: 20),


                Row (
                  children: [
                    Text(
                      "#" + data.data.category,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    SizedBox(child: new Icon(Icons.share, size: 15)),

                    SizedBox(width: 10)
                  ],



                ),
                SizedBox(height: 10)
              ],

            ))
          ],
        ),

      ),

    );
  }


}