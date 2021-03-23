
import 'package:eyepetizer_lvhuijie_main/blocs/bloc_provider.dart';
import 'package:eyepetizer_lvhuijie_main/blocs/detail_bloc.dart';
import 'package:eyepetizer_lvhuijie_main/pages/detail/detail_page.dart';
import 'package:eyepetizer_lvhuijie_main/pages/login/login_page.dart';
import 'package:eyepetizer_lvhuijie_main/pages/login/register_page.dart';
import 'package:eyepetizer_lvhuijie_main/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';



// const pageMain = Navigator.defaultRouteName;
const PAGE_LOGIN = "/login_page";
const PAGE_REGISTER = "/register_page";
const PAGE_DETAIL = "/detail_page";
const PAGE_PICTURE_DETAIL = "/picture_detail_page";
const PAGE_PERSON_MAIN_PAGE = "/person_main_page";
const PAGE_EDIT_PERSON_DATA = "/edit_person_data_page";
const PAGE_PHOTO_VIEW = "/photo_view_page";
const PAGE_SETTING = "/setting_page";

final Map<String, WidgetBuilder> routes = {
//   pageMain: (context) => MainPage(),
   PAGE_LOGIN: (context) => LoginPage(),
   PAGE_REGISTER: (context) => RegisterPage(),
  PAGE_DETAIL: (context) =>
      BlocProvider(child: DetailPage(), bloc: DetailBloc()),
  // PAGE_PICTURE_DETAIL: (context) =>
  //     BlocProvider(child: PictureDetailPage(), bloc: DetailBloc()),
  // PAGE_PERSON_MAIN_PAGE: (context) =>
  //     BlocProvider(child: PersonMainPage(), bloc: PersonMainBloc()),
  // PAGE_EDIT_PERSON_DATA: (context) => EditPersonDataPage(),
  // PAGE_PHOTO_VIEW: (context) => PhotoViewPage(),
   PAGE_SETTING: (context) => SettingPage()
};

Route<dynamic> routeFactory(RouteSettings settings) {
  WidgetBuilder builder;
  if (builder != null)
    return MaterialPageRoute(builder: builder, settings: settings);

  assert(false, 'ERROR: can not generate Route for ${settings.name}');
  return null;
}
