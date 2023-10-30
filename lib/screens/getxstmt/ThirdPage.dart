import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorialapp/screens/getxstmt/first_controller.dart';
import 'package:tutorialapp/screens/getxstmt/home_page.dart';

import 'home_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    var colorArr = [
      Colors.amber,
      Colors.blue,
      Colors.cyan,
      Colors.red,
      Colors.green,
      Colors.indigo,
      Colors.lime,
      Colors.orange,
      Colors.brown
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Third Page",
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // homeController.decreaseX();
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple[600],
                ),
                child: Center(
                  child: Text(
                    "X value = ${Get.find<HomeController>().x.toString()}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorArr[Get.find<HomeController>().y.value],
                ),
                child: Center(
                  child: Text(
                    "Y value = ${Get.find<HomeController>().y.value.toString()}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<HomeController>().increaseY();
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple[600],
                ),
                child: const Center(
                  child: Text(
                    "Increase Y",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  Get.find<HomeController>().totalXY();
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple[600],
                  ),
                  child: Center(
                    child: Text(
                      "Total X + Y = ${Get.find<HomeController>().z.value}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<FirstController>().setValue(Get.find<HomeController>().z.value);
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple[600],
                ),
                child: const Center(
                  child: Text(
                    "Save Total",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
