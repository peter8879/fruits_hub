import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFEEF8ED),
      radius: 20,
      child:  SvgPicture.asset(Assets.imagesNotification),
    );
  }
}