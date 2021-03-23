import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AttentionPage extends StatefulWidget {
  @override
  State createState() {
    return AttentionPageState();
  }
}

class AttentionPageState extends State<AttentionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text("test2",
                style: TextStyle(fontSize: 60, color: Colors.pink))));
  }
}
