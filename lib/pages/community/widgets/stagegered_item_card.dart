import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/utils/log_util.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggeredItemCard extends StatelessWidget {
  const StaggeredItemCard({Key key, this.data}) : super(key: key);
  final ItemBaseListItem data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: (data != null && data.data != null && data.data.content != null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: data.data.content.data == null
                        ? Container(
                            alignment: Alignment.center,
                            child: Text("数据异常"),
                          )
                        : CoverImageWidget(
                            borderRadius: 2,
                            imageUrl: data.data.content.data.cover.feed,
                          )),
                SizedBox(
                  height: 5,
                ),
                Text(data.data.content.data.description,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black45, fontSize: 10)),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CoverImageWidget(
                        width: 20,
                        height: 20,
                        borderRadius: 100,
                        imageUrl: data.data.content.data.owner.avatar,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(data.data.content.data.owner.nickname,
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    Spacer(),
                    Text(
                      data.data.content.data.consumption.collectionCount
                          .toString(),
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    Icon(Icons.store, size: 15)
                  ],
                )
              ],
            )
          : Container(
        alignment: Alignment.center,
        child: Text("数据异常"),
      ),
    );
  }
}
