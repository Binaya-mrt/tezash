import 'package:day_1/home_page.dart';
import 'package:day_1/login_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:

class OnboardModel {
  final image;
  final title;

  OnboardModel(
    this.image,
    this.title,
  );
}

class OnboardController extends GetxController {
  var pageContoller = PageController();
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboard.length - 1;

  forwardAction(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uuid = prefs.getString('uuid');

    if (isLastPage) {
      prefs.setBool('first_user', false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              uuid == null ? const LoginPage() : const HomePage(),
        ),
        // Get.off(DefaultPage(pageno: 0))
      );
    } else {
      pageContoller.nextPage(duration: 3000.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardModel> onboard = <OnboardModel>[
    OnboardModel(
      ('assets/images/onboard_1.jpg'),
      ('Mark Homework as completed'),
    ),
    OnboardModel(
      ('assets/images/onboard_2.jpg'),
      ('Rectify your Attendance'),
    ),
    OnboardModel(
      ('assets/images/onboard_3.jpg'),
      ('Student Exam & Report Cards'),
    ),
  ];
}
