import 'package:eyepetizer_lvhuijie_main/pages/login/login_page.dart';
import 'package:eyepetizer_lvhuijie_main/pages/mine/mine_page.dart';
import 'package:eyepetizer_lvhuijie_main/pages/noticication_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'blocs/bloc_provider.dart';
import 'blocs/main_bloc.dart';
import 'blocs/mine_bloc.dart';
import 'pages/community/community_page.dart';
import 'pages/home/home_page.dart';
import 'utils/color_util.dart';
import 'utils/routes.dart';

void main() {
  runApp(BlocProvider(child: MainPage(), bloc: MainBloc()));
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: '开眼视频demo',
        theme: ThemeData(
            primarySwatch: ColorUtil.createMaterialColor(Color(0xffffffff)),
            backgroundColor: Colors.white),
        routes: routes,
        onGenerateRoute: routeFactory,
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'HomePage'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> pages = <Widget>[
    HomePage(),
    CommunityPage(),
    NotificationPage(),
    BlocProvider(child: MinePage(), bloc: MineBloc())
  ];
  PageController pageScroller;

  @override
  void initState() {
    // TODO: implement initState
    pageScroller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: PageView(
          children: pages,
          controller: pageScroller,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(label: "首页", icon: Icon(Icons.account_box)),
            BottomNavigationBarItem(label: "社区", icon: Icon(Icons.trip_origin)),
            BottomNavigationBarItem(
                label: "通知", icon: Icon(Icons.notifications_none)),
            BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
          ],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setCurrentItem(index);
          },
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ));
  }

  setCurrentItem(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
        pageScroller.animateToPage(index,
            duration: Duration(milliseconds: 1), curve: Curves.easeInSine);
      });
    }
  }
}
