import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorialapp/screens/getxstmt/first_controller.dart';
import 'package:tutorialapp/screens/getxstmt/first_page.dart';
import 'package:tutorialapp/screens/getxstmt/home_controller.dart';
import 'package:tutorialapp/screens/getxstmt/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeController homeController = Get.put(HomeController());
    // FirstController firstController = Get.put(FirstController());
    HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.home_rounded,
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<HomeController>(
              builder: (_) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[600],
                  ),
                  child: Center(
                    child: Text(
                      homeController.x.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                homeController.increaseX();
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[600],
                ),
                child: const Center(
                  child: Text(
                    "Increase X",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => FirstPage());
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[600],
                ),
                child: const Center(
                  child: Text(
                    "Go To First Page",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => SecondPage());
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyan[600],
                ),
                child: const Center(
                  child: Text(
                    "Go To Second Page",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                homeController.initPlatformState();
                Get.showSnackbar(
                  const GetSnackBar(
                    message: "key guard manager initialized",
                    icon: Icon(Icons.info),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: GetBuilder<HomeController>(builder: (builder) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyan[600],
                  ),
                  child: Center(
                    child: Text(
                      homeController.checkAuth,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
