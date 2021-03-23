import 'package:eyepetizer_lvhuijie_main/model/data.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 描述 :    专题策划ItemCard
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/11/27
///
class ColumnItemCard extends StatelessWidget {
  const ColumnItemCard({Key key, this.data}) : super(key: key);

  final Data data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CoverImageWidget(imageUrl: data.image, borderRadius: 2),
        Positioned(
            child: Text(data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)))
      ],
    );
  }
}
