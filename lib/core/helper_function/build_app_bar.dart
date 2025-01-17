import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';
import '../widgets/notification_widget.dart';

AppBar buildAppBar(context,{required String title, bool isHome=false,bool showNotification=true}) {
  return AppBar(
    centerTitle: true,
    title:  Text(
      title,
      style: AppTextStyles.bold19,

    ),
    leading: isHome==false?Padding(
      padding: const EdgeInsetsDirectional.only(start: 8),
      child: Container(
        decoration:const ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(
                  width: 1,
                  color:  Color(0xFFF1F1F5)
              )
          ),

        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Align(
              alignment: AlignmentDirectional(0.4,0),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ),
      ),
    ):null,
    actions:  [
      if(showNotification)
     const  Padding(
        padding: EdgeInsetsDirectional.only(end: 16),
        child: NotificationWidget(),
      )
    ],

  );
}
