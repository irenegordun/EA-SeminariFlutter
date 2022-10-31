import 'package:flutter/material.dart';

import '../widgets/drawer.dart';


class DeleteUser extends StatefulWidget {
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUser();
}

class _DeleteUser extends State<DeleteUser> {
  List<String> values=[
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
    'assets/image1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Seminari 10 Fluter'),
        backgroundColor: Colors.deepPurple[300], 
      ),
      body: Container(
        child: 
        GridView.builder(
          itemCount: 12,
          itemBuilder: (context, index){
            return Card(
              elevation: 10, 
              child: Center(
                child: Image.asset(values[index]),
              ),
            );
          },
          gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        ),
      ),
    );
  }
}
