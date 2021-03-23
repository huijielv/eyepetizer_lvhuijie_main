
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/pages/detail/widgets/view_small_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelatedVideos extends StatefulWidget {
  const RelatedVideos({Key key, this.data}) : super(key: key);

  final List<ItemBaseListItem> data;

  @override
  _RelatedVideosState createState() {
    return _RelatedVideosState();
  }


}

class _RelatedVideosState extends State<RelatedVideos> {
  bool isShowAll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     return Container(
       child: Column(
         children: [

           Divider(
             height: 0.1,
             color: Colors.grey,
           ),
           ListView.builder(itemBuilder: (context ,index){
             return VideoSmallCard( width: 180,height: 100,data: getItemData(index),);
           },
           shrinkWrap: true,

             physics: NeverScrollableScrollPhysics(),
             itemCount: getItemCount(),

           ),

           Visibility(child: InkWell (
              onTap: () {
                lookMore();
              }
              ,
             child: Padding (
                 padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                 child: Text(
                   "查看更多",
                   textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.white),
                 )
             ),
           ),

           visible: isShowMoreText(),
           ),

           SizedBox(height: 5),
           Divider(
             height: 0.1,
             color: Colors.grey,
           ),


         ],
       ),
     ) ;
  }


  bool isShowMoreText(){

    if ( widget.data==null|| widget.data.length<5){
      return false ;
    }else {
      return !isShowAll;
    }
  }



  int getItemCount() {
    int itemCount;
    if (widget.data == null) {
      itemCount = 0;
    } else if (widget.data.length <= 5) {
      itemCount = widget.data.length;
    } else {
      itemCount = isShowAll ? widget.data.length : 5;
    }
    return itemCount;
  }

  lookMore(){
    setState(() {

      isShowAll =true;
    });
  }

  getItemData(int index) {
    return widget.data[index];
  }

}