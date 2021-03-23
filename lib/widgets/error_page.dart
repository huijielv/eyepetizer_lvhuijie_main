import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({Key key, this.status}) : super(key: key);

  final Status status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.loading:
        return Container(
          child: Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.grey, strokeWidth: 2.0),
          ),
        );
      case Status.empty:
        return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("空空如也~", style: TextStyle(fontSize: 15, color: Colors.grey)),
                  SizedBox(height: 10),
                  Icon(Icons.hourglass_empty)
                ],
              ),
            ));
      case Status.fail:
        return Container(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("网络异常~", style: TextStyle(fontSize: 15, color: Colors.grey)),
                    SizedBox(height: 10),
                    Icon(Icons.network_check_rounded)
                  ],
                )));
      default:
        return Container();
    }
  }

//   return Container(
//     alignment: Alignment.center,
//     child: Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Visibility(
//                   visible: false,
//                   child: Text("网络异常",
//                       style: TextStyle(fontSize: 15, color: Colors.grey))),
//               SizedBox(height: 10),
//               Visibility(
//                   visible: false,
//                   child: RaisedButton(
//                     child: Text("点击重试",
//                         style: TextStyle(
//                             fontSize: 15, color: Colors.pinkAccent)),
//                   ))
//             ],
//           ),
//           CircularProgressIndicator(
//               backgroundColor: Colors.grey, strokeWidth: 2.0),
//         ],
//       ),
//     ),
//   );
}


enum Status { loading, success, empty, fail }