import 'package:flutter/cupertino.dart';


class DisplayUtil {
  /// 是否是横屏
  static bool isLandScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >
        MediaQuery.of(context).size.height;
  }
}
