import 'package:flutter/material.dart';
import 'Followers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'package:url_launcher/url_launcher.dart';


class DisplayFollowers extends StatelessWidget{
  String urlFollowers;
  DisplayFollowers({this.urlFollowers});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DisFollowers(urlFollowers : urlFollowers),
      debugShowCheckedModeBanner: false,
      //theme : new ThemeData(primarySwatch : Colors.black,),
    );
  }
}

class DisFollowers extends StatefulWidget {
  String urlFollowers;
  DisFollowers({this.urlFollowers});
  @override
  _DisFollowersState createState() => _DisFollowersState();
}

class _DisFollowersState extends State<DisFollowers> {
  
   List<Followers> list = List();
   bool loading=false;
 

  Future<List<Followers>> getFollowerInfo() async {
    print("url" + widget.urlFollowers);
    var res = await http.get(widget.urlFollowers);
    list = (json.decode(res.body) as List)
      .map((data) => new Followers.fromJson(data))
      .toList();
    print("name" + list[0].login);
    print("avatar" + list[0].avatar_url);
    print("git" + list[0].git_url);
    // setState(() {
    //   loading: true;
    // });
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Followers List', style: TextStyle( color: Colors.white ),), backgroundColor: Colors.grey[800],),
        body: FutureBuilder(
        future: getFollowerInfo(),
        builder: (context, snapshot){
           if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData &&  list.length != 0) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
               return Card(
                 margin: EdgeInsets.symmetric(vertical : 8, horizontal: 15),
                //  elevation: 5,
                //  shadowColor: Colors.white,
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                 color: Colors.grey[600],
                   child: ListTile(
                    leading: CircleAvatar(radius: 25,  backgroundImage: NetworkImage(list[index].avatar_url),),
                    title: Text(list[index].login , style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, ),),
                    subtitle: InkWell(
                       child: Text('Github Link' , 
                       style: TextStyle(color: Colors.black ,fontSize: 15, ), ),
                       onTap: () => launch('$list[index].git_url')
                    ),    
                  ),
               );
              }
                  );
              }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
           else{
                print("list");
                return Center(child: Text('Not connected to anyone', style: TextStyle(fontSize : 20, color: Colors.grey, fontWeight: FontWeight.bold), ));
              }
        },),
    );
  }
}