import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme.dart';

class GetAppBar extends PreferredSizeWidget {
  const GetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Add Task',
        style: headingStyle,
      ),
      elevation: 0,
      backgroundColor:
      Get.isDarkMode ? const Color(0x00303030) : Colors.white10,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Colors.grey,
        ),
      ),
    );
  }
}
