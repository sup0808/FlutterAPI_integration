import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/User.dart';

class UserDashboard extends StatefulWidget {
  @override
  State<UserDashboard> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<UserDashboard> {
  Map? mapResponse;
  List? userList;

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  Future getUserList() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      print(" Api request success");
      setState(() {
        mapResponse = json.decode(response.body);
        userList = mapResponse!['data'];
      });
    } else {
      print(" Api request success");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userList!.length == 0
          ? Text("Data loading")
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                  children: userList!.map((item) {
                User user = User.userMapper(item);
                return ListTile(
                  leading: Image.network(user.avatar),
                  title: Text(
                    user.first_name,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    user.email,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  trailing: Icon(Icons.phone_android_rounded),
                );
              }).toList()),
            ),
    );
  }
}
