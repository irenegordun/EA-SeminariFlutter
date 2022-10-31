
import 'package:flutter/material.dart';
import 'package:flutter_front/views/deleteUser_page.dart';
import 'package:flutter_front/views/home_page.dart';
import 'package:flutter_front/views/account_page.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
      child: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 146, 166, 183),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                  child: Text(
                      'P A G E S',
                      style :  TextStyle(fontSize: 35),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text (
                  'List users',
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text (
                  'User Account: Login & Register',
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AccountPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text (
                  'Main',
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DeleteUser()));
                },
              )
          ],
        ),
      ))
    ));
  }
}