import 'package:flutter/material.dart';
import 'package:githubAPI/Repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class Repos extends StatefulWidget {
  String urlrepo= 'https://api.github.com/users/salonilakhotia/repos';
  // Repos({this.urlrepo});

  @override
  _ReposState createState() => _ReposState();
}

class _ReposState extends State<Repos> {
   List<Repository> list = List();
   //List list = ["hy","hey","hello"];
  bool loading=false;
 

  getRepoInfo(String url) async {
    var res = await http.get(url);
    var resBody = json.decode(res.body);
    list = (json.decode(resBody.body) as List)
      .map((data) => new Repository.fromJson(data))
      .toList();
    print(list[0].name);
    setState(() {
      loading: true;
    });
  }


  @override
  void initState() {
    print("heu in init");
    // TODO: implement initState
    getRepoInfo(widget.urlrepo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("hey"),
        Text(list[0].name),
        Container(
          height: 600,
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(list[index].name);
              // return ListTile(contentPadding: EdgeInsets.all(5),
              // title : new Text(list[index]),
              // //subtitle: new Text(list[index].description),
              // );
            }
          )
          
        ),
      ],
    );
  }
}