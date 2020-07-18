import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Followers.dart';

class DisplayPage extends StatefulWidget {
   var info;
  final String profile;
  DisplayPage({this.info, this.profile});

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  List<Followers> list = List();
  bool loading = false;
  fetchData() async{
    String url = widget.profile +'/followers';
    final res = await http.get(url);
    list = (json.decode(res.body) as List)
      .map((data) => new Followers.fromJson(data))
      .toList();
      
      print(list[3].login);
      print(list[1].login);
      print(list[2].login);


    setState(() {
       loading = true;
    });
   
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.profile +'/followers';

      return Scaffold(
        appBar: AppBar( 
        backgroundColor: Colors.black,
        title : Text('${widget.info['name']}')),
        body:  SingleChildScrollView(
            child:  Column(
             children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(widget.info['avatar_url']),
              ),
              Text('${widget.info['public_repos']}'),
              Text('${widget.info['bio']}'),
              RaisedButton(onPressed: fetchData ,child: Text('follower'),),
              Text('${list[0].login}'),
              Text('${list[1].login}'),
              Text('${list[2].login}'),
              Text('${list.length}'),
              // loading == false ? CircularProgressIndicator() :
               SizedBox(
                height: 800,
                child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(contentPadding: EdgeInsets.all(5),
                    title: new Text(list[index].login),
                  );
                },
              ),)
        ],
    ),
      ),
      );
  }
  }
