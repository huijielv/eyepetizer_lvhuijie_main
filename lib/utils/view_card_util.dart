import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/column_card.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/coverdcard.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/horizontal_scroll_card.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/hot_classification_card.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/normalcard.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/theme_card.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/title_card.dart';
import 'package:eyepetizer_lvhuijie_main/pages/home/widgets/video_small_card.dart';
import 'package:flutter/cupertino.dart';



class ViewCardUtil {
  static Widget getViewCard(ItemBaseListItem item, {tag, itemList}) {
    switch (item.type) {
      case "textCard":
        return TitleCard(tag: 'DISCOVER_PAGE', title: item.data.text);

      case "followCard":
        return NormalCard(data: item.data);

      case "pictureFollowCard":
        return CoverCard(data: item.data);

      case "horizontalScrollCard":
        return HorizontalScrollCard(data: item);

      case "specialSquareCardCollection":
        return HotClassificationCard(data: item);

      case "briefCard":
        return ThemeCard(data: item);

      case "videoSmallCard":
        return VideoSmallCard(width: 180, height: 110, data: item);


      case "columnCardList":
        return ColumnCard(data: item);

      default:
        return Text(item.type);
    }
  }
}
