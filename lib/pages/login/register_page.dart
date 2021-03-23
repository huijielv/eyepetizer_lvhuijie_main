import 'package:eyepetizer_lvhuijie_main/http/repository/login_repository.dart';
import 'package:eyepetizer_lvhuijie_main/pages/login/widgets/countDown_button.dart';
import 'package:eyepetizer_lvhuijie_main/utils/string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 描述 :    注册页
///
/// @author: linda
/// email:   zhoulinda@lexue.com
/// 创建日期: 2020/12/5
///
class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();

  // GlobalKey<_CountDownState> countDownKey = GlobalKey();

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
                  cursorColor: Colors.blueAccent,
                  controller: phoneController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 11,
                  decoration: InputDecoration(
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                  style: TextStyle(),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: TextField(
                        obscureText: true,
                        cursorColor: Colors.blueAccent,
                        controller: verificationCodeController,
                        decoration: InputDecoration(
                          hintText: "请输入验证码",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      )),
                  SizedBox(width: 10),
                  CountDownButton(
                    text: "获取验证码",
                    period: 60,
                    interval: 1,
                    onCountDownStart: () {
                      getVerificationCode(phoneController.text);
                    },
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextField(
                  cursorColor: Colors.blueAccent,
                  controller: passwordController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "请输入密码",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                  style: TextStyle(),
                )),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 230,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  register(phoneController.text, passwordController.text,
                      verificationCodeController.text);
                },
                child: Text("注册",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                textColor: Colors.white,
                disabledColor: Colors.white54,
                color: Colors.blueAccent,
                shape: StadiumBorder(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getVerificationCode(String phone) {
    LoginRepository.getVerificationCode(phone).then((value) {
      if (value.error != 0) {
        Fluttertoast.showToast(msg: value.msg);
      }
    });
  }

  void register(String phone, String password, String verificationCode) {
    if (StringUtil.isEmpty(phone)) {
      Fluttertoast.showToast(msg: "手机号不能为空");
    } else if (StringUtil.isEmpty(password)) {
      Fluttertoast.showToast(msg: "密码不能为空");
    } else if (StringUtil.isEmpty(verificationCode)) {
      Fluttertoast.showToast(msg: "验证码不能为空");
    } else {
      LoginRepository.register(phone, verificationCode, password).then((value) {
        if (value.error != 0) {
        } else {
          Navigator.pop(context);
        }
      });
    }
  }
}
