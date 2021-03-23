import 'dart:async';

import 'package:eyepetizer_lvhuijie_main/blocs/base_bloc.dart';
import 'package:eyepetizer_lvhuijie_main/config/prfs_key.dart';
import 'package:eyepetizer_lvhuijie_main/model/login.dart';
import 'package:eyepetizer_lvhuijie_main/model/member.dart';
import 'package:eyepetizer_lvhuijie_main/utils/prfs_util.dart';
import 'package:package_info/package_info.dart';

class MineBloc extends BaseBloc {
  StreamController<Member> mineStreamController =
      StreamController<Member>.broadcast();

  StreamController<PackageInfo> packageInfoStreamController =
      StreamController<PackageInfo>.broadcast();

  Stream<Member> get userDataStream => mineStreamController.stream;

  Stream<PackageInfo> get packageInfoStream =>
      packageInfoStreamController.stream;

  @override
  void dispose() {
    mineStreamController.close();
    packageInfoStreamController.close();
  }

  getUserData() {
    PrefsUtil.getObj<Login>(PrefsKey.USER_DATA, (v) => Login.fromJson(v))
        .then((value) {
      mineStreamController.sink.add(value == null ? null : value.member);
    });
  }

  getVersion() {
    PackageInfo.fromPlatform().then((value) {
      packageInfoStreamController.sink.add(value);
    });
  }
}
