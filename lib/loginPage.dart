
  import 'dart:convert';

  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:flutterapi_integration/UserDashboard.dart';
  import 'package:flutterapi_integration/rounded_btn.dart';
  import 'package:http/http.dart' as http;
  import 'package:flutter/foundation.dart' as Foundation;

  class LoginPage extends StatefulWidget {
    @override
    State<LoginPage> createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {

    Future login(String userName, String password) async{
     http.Response response;
      //var url = Uri.parse("https://reqres.in/api/login");
     var url = Uri.https('reqres.in', 'api/login');
      response = await http.post(url,  body: {
        "email": "eve.holt@reqres.in",
        "password": "cityslicka"
      });
   print("Flutter Response.body :${response.statusCode}");
   if(response.statusCode == 200){
     Map data = json.decode(response.body);
     print("Flutter toekn:: ${data['token']}");
   }
    
  }

  @override
  void initState() {
    print("Flutter -- ");
    login("userName", "jj");
    super.initState();
  }
  
  
  
  var userNameCtl = TextEditingController();
  var passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // webgradients
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(

            gradient: LinearGradient(
              colors: [
                Color(0xffff9a9e),
                Color(0xfffad0c4),

               /* Colors.white,
                Colors.blue,
                Colors.purple*/
              ],
              begin: FractionalOffset(1.0,0.0),
              end: FractionalOffset(0.0,1.0),
              stops:[0.0,1.0]




            )
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    controller: userNameCtl,
                    decoration: InputDecoration(hintText: "Enter Username"),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  child: TextField(
                    controller: passwordCtl,
                    decoration: InputDecoration(hintText: "Enter Password"),
                  ),
                ),
                Container(
                  width: 200,
                  height: 100,
                  child: RoundedBtn(
                    btnName: "Submit",
                    color: Colors.white24,
                    textStyle: TextStyle(fontSize: 24),
                    callback: () async {
                      var userName = userNameCtl.text.toString();
                      var password = passwordCtl.text.toString();
                   /*   var sharedf = await  SharedPreferences.getInstance();
                      sharedf.setString("UserName", userName);
                      sharedf.setString("Password", password);*/

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDashboard()));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
