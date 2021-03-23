import 'package:eyepetizer_lvhuijie_main/config/prfs_key.dart';
import 'package:eyepetizer_lvhuijie_main/http/repository/login_repository.dart';
import 'package:eyepetizer_lvhuijie_main/utils/prfs_util.dart';
import 'package:eyepetizer_lvhuijie_main/utils/routes.dart';
import 'package:eyepetizer_lvhuijie_main/utils/string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                obscureText: false,
                cursorColor: Colors.blueAccent,
                controller: phoneController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 11,
                decoration: InputDecoration(
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                obscureText: true,
                cursorColor: Colors.blueAccent,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "请输入密码",
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 230,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  login(phoneController.text, passwordController.text);
                },
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                textColor: Colors.white,
                disabledTextColor: Colors.white54,
                color: Colors.blueAccent,
                shape: StadiumBorder(),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, PAGE_REGISTER);
                },
                child: Text("没有账号，先去注册",
                    style: TextStyle(color: Colors.grey, fontSize: 15)))
          ],
        ),
      ),
    );
  }

  void login(String phone, String password) {
    if (StringUtil.isEmpty(phone)) {
      Fluttertoast.showToast(msg: "手机号不能为空");
    } else if (StringUtil.isEmpty(password)) {
      Fluttertoast.showToast(msg: "密码不能为空");
    } else {
      LoginRepository.login(phone, password).then((value) {
        PrefsUtil.putObject(PrefsKey.USER_DATA, value);
        Navigator.pop(context, PAGE_LOGIN);
      });
    }
  }
}
