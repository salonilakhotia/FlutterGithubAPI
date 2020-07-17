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
  // @override
  // void initState() {
  //   // super.initState();
  //   print("init ${widget.profile}");
  //   fetchData();
  // }
  // Followers follower;

  // fetchData() async {
  //   print("eftch");
  //   String url = widget.profile +'/followers';
  //   var res = await http.get(url);
  //   var decodedValue = json.decode(res.body);
  //   follower = Followers.fromJson(decodedValue);
  //   print(follower);
  // }
  List<Followers> list = List();

  fetchData() async{
    String url = widget.profile +'/followers';
    final res = await http.get(url);
    list = (json.decode(res.body) as List)
      .map((data) => new Followers.fromJson(data))
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.profile +'/followers';
      return Scaffold(
        appBar: AppBar( 
        backgroundColor: Colors.black,
        title : Text('${widget.info['name']}')),
        body:  SingleChildScrollView(
            child: Column(
             children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(widget.info['avatar_url']),
              ),
              Text('${widget.info['public_repos']}'),
              Text('${widget.info['bio']}'),
              RaisedButton(onPressed: fetchData ,child: Text('follower'),),

              Center(child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(contentPadding: EdgeInsets.all(5),
                    title: new Text(list[index].login),
                  );
                },
              ),)
              // Center(
              //   child: new FutureBuilder(
              //     future : DefaultAssetBundle.of(context)
              //     .loadString(url), 
              //     builder: (context, snapshot){
              //       var data = json.decode(snapshot.data.toString());
              //       return new Container(
              //         height: 600,
              //         child: ListView.builder(
              //           itemCount: 4,
              //           itemBuilder: (BuildContext context, int index){
              //             return listview(index,data);
              //           }
              //         )
              //       );
              //     },
              //   ),
              // ),
        ],
    ),
      ),
      );
  }
  
  listview(index , data) {
    //  search = search.toLowerCase();
    
    //  if(data[index]['name'].toLowerCase().contains(search) ){
       return Card(
          child: new Column(
            children: <Widget>[
              Text("Name : " + data[index]['login']),
              // Text("City : " + data[index]['city']),
              // Text("Persuing : " + data[index]['persuing']),
              // Text("Gender : " + data[index]['gender']),
                 ],
               )
          );
     }
  }
