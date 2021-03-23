import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void OnCountDownStart();

class CountDownButton extends StatefulWidget {
  String text;
  int period;
  int interval;
  OnCountDownStart onCountDownStart;

  CountDownButton(
      {Key key, this.text, this.period, this.interval, this.onCountDownStart})
      : super(key: key);

  State<StatefulWidget> createState() => CountDownState(text, period, interval);
}

class CountDownState extends State<CountDownButton> {
  Timer countDownTimer;
  String text;
  int period;
  int interval;

  CountDownState(String text, int period, int interval) {
    this.text = text;
    this.period = period;
    this.interval = interval;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (widget.onCountDownStart != null) {
          widget.onCountDownStart();
        }
        startCountDown();
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 13),
      ),
      textColor: Colors.white,
      disabledTextColor: Colors.grey,
      color: Colors.blueAccent,
      disabledColor: Colors.black12,
    );
  }

  void startCountDown() {
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.period - timer.tick > 0) {
          text = '${widget.period - timer.tick}秒';
        } else {
          text = '发送验证码';
          countDownTimer.cancel();
          countDownTimer = null;
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countDownTimer.cancel();
    countDownTimer = null;
  }
}
