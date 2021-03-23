
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';


class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar (
       title: Text('设置'),
     ),
     body: Center (
       child: Column (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           InkWell(
             onTap:  () {
               clearCache();
             },
             child: Container (
               alignment: Alignment.center ,
               width: MediaQuery.of(context).size.width,
               height: 48,
               color: Colors.white, child: Text("清除缓存",
                     style: TextStyle(fontSize: 16, color: Colors.black))))

           ,

           SizedBox(
            height: 18,
           ),
           InkWell(
               onTap:  () {
                loginOut();
               },
               child: Container (
                   alignment: Alignment.center ,
                   width: MediaQuery.of(context).size.width,
                   height: 48,
                   color: Colors.white, child: Text("退出登陆",
                   style: TextStyle(fontSize: 16, color: Colors.black))))

           ,

         ],

       ),
     ),



    );
  }

  ///退出登录
  void loginOut() {

  }

  ///清除缓存
  void clearCache() async {

  }
}
