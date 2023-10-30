import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tutorialapp/data/dao/user_dao.dart';
import 'package:tutorialapp/model/user.dart';
import 'package:tutorialapp/screens/adduser.dart';
import 'package:tutorialapp/screens/country_list.dart';
import 'package:tutorialapp/views/components/circle_image.dart';
import 'package:tutorialapp/views/components/dialog_okcancel.dart';

import '../repository/country_repository.dart';
import '../utils/dimens.dart';

class UserList extends StatelessWidget {
  final UserDao? userDao = Get.find(tag: 'user_dao');

  UserList({super.key});

  void addUser() {
    Get.to(() => AddUser());
    // await userDao?.addUser(User('zyp@gmail.com', 'Zay Yar', 'Phyo',
    //     'https://reqres.in/img/faces/1-image.jpg'));
  }

  void deleteUser(User? user) async {
    if (user != null) await userDao?.deleteItem(user);
  }

  void updateUser(User? user) {
    if (user != null) {
      Get.to(() => AddUser(), transition: Transition.native, arguments: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              print('Selected menu item: $value');
              Get.to(() => const CountryListPage());
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'country',
                child: Text('Country List'),
              ),
            ],
          ),
        ],
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btnAdd',
            onPressed: () {
              addUser();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'btnDelete',
            onPressed: () async {
              bool result = showOkCancelDialog(context).show();
              if (result) {
                await userDao?.deleteAll();
              }
            },
            child: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder(
        stream: userDao?.getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, position) {
                  User? user = snapshot.data?[position];
                  return noteListItem(user);
                });
          } else if (snapshot.hasError) {
            return Center(child: Text('Error :: $snapshot'));
          } else {
            return Center(
                child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary));
          }
        });
  }

  Widget noteListItem(User? user) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.space20)),
      child: GestureDetector(
        onTap: () {
          updateUser(user);
        },
        child: Container(
          padding: EdgeInsets.all(Dimens.space5),
          child: Row(
            children: [
              CircleImageWidget(
                width: 50,
                height: 50,
                imagePath: user?.avatar ?? '',
                isAsset: false,
              ),
              const SizedBox(width: Dimens.space10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name : ${user?.firstName} ${user?.lastName}',
                      style: TextStyle(fontSize: 14),
                      softWrap: true,
                    ),
                    const SizedBox(height: Dimens.space5),
                    Text('Email : ${user?.email}')
                  ],
                ),
              ),
              const SizedBox(width: Dimens.space10),
              IconButton(
                  onPressed: () {
                    deleteUser(user);
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
