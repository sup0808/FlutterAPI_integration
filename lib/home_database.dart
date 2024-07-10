import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database/database_services.dart';

class home_database extends StatefulWidget {
  @override
  State<home_database> createState() => _home_databaseState();
}

final DatabaseServices _databaseServices = DatabaseServices.instance;

class _home_databaseState extends State<home_database> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddUserButton(),
    );
  }
}

Widget AddUserButton() {
  return FloatingActionButton(
    onPressed: () {
      print("demo click");
      _databaseServices.addUser("arvind");
      _databaseServices.getUsers();
    },
    child: Icon(Icons.add),
  );
}
