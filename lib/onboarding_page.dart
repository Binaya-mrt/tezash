// Flutter imports:
import 'package:day_1/main.dart';
import 'package:day_1/onboarding_controller.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:

class OnBoard extends StatelessWidget {
  final _controller = OnboardController();

  OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              itemCount: _controller.onboard.length,
              controller: _controller.pageContoller,
              onPageChanged: _controller.selectedPageIndex.call,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _controller.onboard[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(_controller.onboard[index].image),
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: List.generate(
                _controller.onboard.length,
                (index) => Obx(() {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _controller.selectedPageIndex.value == index
                          ? themeColor
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              backgroundColor: themeColor,
              onPressed: () => _controller.forwardAction(context),
              child: Obx(() => _controller.isLastPage
                  ? const CircleAvatar(
                      backgroundColor: themeColor,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: themeColor,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    )),
            ),
          )
        ],
      ),
    );
  }
}
