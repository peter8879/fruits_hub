import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

import '../../../../../core/helper_function/get_user.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var userEntity = getUser();
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: const Color(0xFF949D9E)),
      ),
      subtitle: Text(
        userEntity.name,
        style: AppTextStyles.bold16,
      ),
      trailing: const NotificationWidget(),


    );
  }
}


