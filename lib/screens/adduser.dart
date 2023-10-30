import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tutorialapp/data/dao/user_dao.dart';

import '../model/user.dart';
import '../utils/dimens.dart';
import '../views/components/circle_image.dart';

class AddUser extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDao? userDao = Get.find(tag: 'user_dao');
    final User? user = Get.arguments;
    if (user != null) {
      _firstNameController.text = user.firstName ?? '';
      _lastNameController.text = user.lastName ?? '';
      _emailController.text = user.email ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(user == null ? 'Add User' : 'Update User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.space20),
        child: Column(
          children: [
            CircleImageWidget(
              width: 100,
              height: 100,
              imagePath: user?.avatar ?? '',
              isAsset: false,
            ),
            const SizedBox(height: Dimens.space10),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _lastNameController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {},
              child: const Text('Add User'),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (user == null) {
                    await userDao?.insertItem(User(_emailController.text, _firstNameController.text,
                        _lastNameController.text, 'https://reqres.in/img/faces/1-image.jpg'));
                  } else {
                    await userDao?.updateItem(User(
                      id: user.id,
                      _emailController.text,
                      _firstNameController.text,
                      _lastNameController.text,
                      'https://reqres.in/img/faces/1-image.jpg',
                    ));
                  }

                  Get.back();
                },
                child: Text(user == null ? 'Add User' : 'Update User'))
          ],
        ),
      ),
    );
  }
}
