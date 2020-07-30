import 'package:flutter/material.dart';
import 'Followers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'package:url_launcher/url_launcher.dart';


class DisFollowers extends StatefulWidget {
  String urlFollowers;
  DisFollowers({this.urlFollowers});
  @override
  _DisFollowersState createState() => _DisFollowersState();
}

class _DisFollowersState extends State<DisFollowers> {
    List<Followers> list = List();
   bool loading=false;
 

  Future getFollowerInfo() async {
    var res = await http.get(widget.urlFollowers);
    var resBody = json.decode(res.body);
    list = (json.decode(resBody.body) as List)
      .map((data) => new Followers.fromJson(data))
      .toList();
    print(list[0].login);
    print(list[0].avatar_url);
    print(list[0].git_url);
    setState(() {
      loading: true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFollowerInfo(),
      builder: (context, snapshot){
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
             return ListTile(
                leading: CircleAvatar(radius: 10, backgroundImage: NetworkImage(list[index].avatar_url),),
                title: Text(list[index].login),
                subtitle: InkWell(
                   child: Text('Github Link' , 
                   style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                   onTap: () => launch('$list[index].git_url')
                ),    
              );
            }
                );
            }
        else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },);
  }
}