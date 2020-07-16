import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DisplayPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
     // theme : new ThemeData(primarySwatch : Colors.black,),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController username  = new TextEditingController();
  String url = 'https://api.github.com/users/';
  getUser( String username) async{
    String gitProfile = url + username;
    var res = await http.get(gitProfile);
    var resBody = json.decode(res.body);
    Navigator.push(context,  MaterialPageRoute(builder: (context) => DisplayPage(info: resBody,)));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80, ),
          child: Column(children: <Widget>[
            SizedBox(height:80,),
            Container(
              width: 130,
              height: 130,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage('https://icon-library.net/images/github-icon-png/github-icon-png-29.jpg'),
              ),
            ),
            SizedBox(height: 40,),
            Text("Github", 
            style : TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 45,
            )),
            SizedBox(height:40,),
            Container(
              padding: EdgeInsets.all(10),
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(.5),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white,),
                decoration: InputDecoration(
                  hintText: "Github Username",
                  hintStyle: TextStyle(color: Colors.grey,),
                  border: InputBorder.none,
                ),
                controller : username,
              ), 
            ),
             SizedBox(height: 20,),
             MaterialButton(
               height: 50.0,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10),
                ),
                onPressed: () => getUser(username.text),
                child: Center(child: Text("Search About User" , style:TextStyle(color: Colors.black,),),
              ),
             ),
          ],),
        ),
      ),
      
    );
  }
}
