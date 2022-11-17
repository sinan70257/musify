import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musik/widgets/NotificationList.dart';
import 'package:musik/widgets/SettingsList.dart';

class SettingList2 extends StatelessWidget {
  const SettingList2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SettingsList(title: "About me", logo: Icons.person),
          SettingsList(title: "Share", logo: Icons.share),
          NotificationList(title: "Notifications", logo: Icons.notifications),
          SettingsList(title: "License", logo: Icons.key),
          SettingsList(title: "Privacy Policy", logo: Icons.privacy_tip),
        ],
      ),
    );
  }
}
