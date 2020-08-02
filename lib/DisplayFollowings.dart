import 'package:flutter/material.dart';
import 'Followings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'package:url_launcher/url_launcher.dart';


class DisplayFollowings extends StatelessWidget{
  String urlFollowings;
  DisplayFollowings({this.urlFollowings});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DisFollowings(urlFollowings : urlFollowings),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DisFollowings extends StatefulWidget {
  String urlFollowings;
  DisFollowings({this.urlFollowings});
  @override
  _DisFollowingsState createState() => _DisFollowingsState();
}

class _DisFollowingsState extends State<DisFollowings> {
  
  List<Followings> list = List();
  bool loading=false;
 

  Future<List<Followings>> getFollowingInfo() async {
    print("url" + widget.urlFollowings);
    var res = await http.get(widget.urlFollowings);
    list = (json.decode(res.body) as List)
      .map((data) => new Followings.fromJson(data))
      .toList();
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Followings List', style: TextStyle( color: Colors.white ),), backgroundColor: Colors.grey[800],),
        body: FutureBuilder(
        future: getFollowingInfo(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData && list.length  != 0 ) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
               if(list.length != 0) {
                 print("in");
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
               ); }
              
              }
                  );
              }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
           else{
                print("list");
                return Center(child: Text('No one has connected with you!!', style: TextStyle(fontSize : 20, color: Colors.grey, fontWeight: FontWeight.bold), ));
              }
        },),
    );
  }
}