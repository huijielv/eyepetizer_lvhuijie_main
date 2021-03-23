import 'dart:async';

import 'package:eyepetizer_lvhuijie_main/http/repository/detail_repository.dart';
import 'package:eyepetizer_lvhuijie_main/model/details.dart';
import 'package:eyepetizer_lvhuijie_main/model/itembaselistitem.dart';

import 'base_bloc.dart';




class DetailBloc extends BaseBloc {

  StreamController<Detail> detailStreamController =
  StreamController<Detail>.broadcast();

  StreamController<List<ItemBaseListItem>> relateVideoStreamController =
  StreamController<List<ItemBaseListItem>>.broadcast();

  StreamController<int> indexStreamController =
  StreamController<int>.broadcast();


  Stream<Detail> get detailStream => detailStreamController.stream;

  Stream<List<ItemBaseListItem>> get relateVideoStream =>
      relateVideoStreamController.stream;

  Stream<int> get indexStream => indexStreamController.stream;

  @override
  void dispose() {
    detailStreamController.close();
    relateVideoStreamController.close();
    indexStreamController.close();
  }

   Future getDetailData( int id ,{String resourceType})async {
     DetailRepository.getVideoDetail(id,resourceType: resourceType).then((value){
       detailStreamController.sink.add(value);
     });
   }

   Future getRelateVideo(int id){
     DetailRepository.getRelateVideo(id).then((value) {
       List<ItemBaseListItem> items = value.itemList
           .where((value) => value.type == "videoSmallCard")
           .toList();
       relateVideoStreamController.sink.add(items);
     });
   }


   addValue ( int index ){
     indexStreamController.sink.add(index);
   }


}
