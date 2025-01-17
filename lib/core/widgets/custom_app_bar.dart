import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

AppBar buildAppBar({required String title,required BuildContext context}) {
  return AppBar(
      centerTitle: true,
      title:  Text(
        title,
        style: AppTextStyles.bold19,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      )

  );
}