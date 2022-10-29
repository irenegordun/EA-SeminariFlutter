import 'package:flutter/material.dart';
import 'package:flutter_front/services/userServices.dart';
import 'package:flutter_front/views/deleteUser_page.dart';

import '../models/user.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? users;
  var isLoaded=false;
  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async {
    users = await UserServices().getUsers();
    if(users != null){
      setState(() {
        isLoaded=true;
      });
    }
  }

  deleteU(String name) async {
    await UserServices().deleteUsers(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Seminari 10 Fluter LLISTAT'),
        backgroundColor: Colors.deepPurple[300], 
      ),
      body: Visibility(
        visible: isLoaded,
        replacement:const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.deepPurple[100],
              child:
                ListTile(
                  title: Text(users![index].name),
                  subtitle: Text(users![index].email),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete), 
                    onPressed: () { 
                      deleteU(users![index].name.toString());
                      setState(() {
                        users!.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DeleteUser()));
                  },
                ),
            );
          },
        ),
      ),
    );
  }
}