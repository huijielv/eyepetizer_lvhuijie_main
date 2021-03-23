
import 'package:eyepetizer_lvhuijie_main/model/details.dart';
import 'package:eyepetizer_lvhuijie_main/widgets/conver_image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({Key key, this.data}) : super(key: key);

  final Detail data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(10, 0, 10,12),
      child: Row (
        children: [
        InkWell(
          onTap: (){

          },
          child: CoverImageWidget(
            imageUrl: data.author.icon,
            width: 45,
            height: 45,
            borderRadius: 100,
            placeholder: Image.asset('assets/images/ic_avatar.png'),
            errorWidget: Image.asset('assets/images/ic_avatar.png'),
          ),
        ),
        Expanded(child: Container (

          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          alignment: Alignment.centerLeft,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.author.name,
               softWrap: true,
               overflow: TextOverflow.ellipsis,
               style: TextStyle(
                 fontSize: 13,
                 color: Colors.white,
               decoration: TextDecoration.none


               ),
              ),
              SizedBox(
                height: 3,
              ),

              Text(data.author.description,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    decoration: TextDecoration.none,
                    color: Colors.grey),
              )


            ],
          ),
        )),

        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 1),
            borderRadius: BorderRadius.circular(2.0)
          ),
          child: Text (
            '关注',
            textAlign: TextAlign.center,

            style: TextStyle(fontSize: 10,color: Colors.white,
                decoration: TextDecoration.none),

          ),
        )

        ],
      ),

    );
  }

}