
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationPage extends StatefulWidget {
  @override
  State createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage>
    with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    registerListener();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Text("Notification",
                style: TextStyle(fontSize: 50, color: Colors.blueAccent))));
  }

  void registerListener() {

  }

  @override
  void dispose() {
    super.dispose();

  }
}