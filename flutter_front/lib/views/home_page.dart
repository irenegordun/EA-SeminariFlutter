import 'package:flutter/material.dart';
import 'package:flutter_front/services/userServices.dart';

import '../models/user.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? users;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await UserServices().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
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
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: ListTile(
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
                  showDialogFunc(context, users![index].name,
                      users![index].email, users![index].id);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

showDialogFunc(context, name, email, id) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 186, 179, 230),
              ),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "USER DETAILS:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 49, 66,86),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "NAME : " + name,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 49, 66, 86),
                      ),
                    ),
                    Text(
                      "EMAIL : " + email,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 49, 66, 86),
                          ),
                    ),
                    Text(
                      " ID : " + id,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 49, 66, 86),
                          ),
                    )
                  ]),
            ),
          ),
        );
      });
}
