import 'package:flutter/material.dart';

import '../widgets/drawer.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
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
      body: Column(
        children: <Widget>[ 
         Card(
              color: Colors.deepPurple[100],
              child: const ListTile(
                title: Text('hello'),
              ),
         ),
        Expanded(child: 
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
        ],
      ),
    );
  }
}
