
import 'package:eyepetizer_lvhuijie_main/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'daily_page.dart';
import 'discover_page.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}


class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin ,AutomaticKeepAliveClientMixin {
  final List<Tab> _tabs = <Tab>[
    Tab(text: '发现'),
    Tab(text: "日报"),
  ];
  TabController tabController;
  @override
  void initState() {

    super.initState();

    tabController = TabController(vsync: this, length: _tabs.length);


  }

  @override

  bool get wantKeepAlive =>  true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TabBar (
        tabs: _tabs,
        controller: tabController,
        labelColor: Colors.blueAccent,
        unselectedLabelColor: Colors.grey,
          // indicatorColor: Colors.blueAccent,
          // indicatorSize: TabBarIndicatorSize.label

      ),
      body: TabBarView (
        controller: tabController,
        children: [


          DiscoverPage(), DailyPage()

        ],
      ),
      drawer:Drawer (
        child: ListView (
          padding: EdgeInsets.zero,

          children: [
            DrawerHeader(child: Center (
              child: SizedBox (
                width: 100,
                height: 100,
                child: CircleAvatar (
                backgroundImage:  new AssetImage('assets/images/ic_avatar.png'),
                ),
              ),

            ),

        decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
            ),



            ListTile(
                leading: Icon(Icons.settings),
                title: Text('设置'),
                onTap: () {
                  Navigator.pushNamed(context, PAGE_SETTING);
                })
          ],
        ) ,
      )

    );
  }


}

