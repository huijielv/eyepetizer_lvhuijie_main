import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ItemLayout extends StatelessWidget {
  const ItemLayout({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => Fluttertoast.showToast(msg: title),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(title,
              style: TextStyle(color: color == null ? Colors.black87 : color)),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
