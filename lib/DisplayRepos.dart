import 'package:flutter/material.dart';
import 'package:githubAPI/widget/Repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 


class DisplayRepos extends StatelessWidget{
  String urlRepos;
  DisplayRepos({this.urlRepos});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Repos(urlRepos : urlRepos),
      debugShowCheckedModeBanner: false,
      //theme : new ThemeData(primarySwatch : Colors.black,),
    );
  }
}

class Repos extends StatefulWidget {
  String urlRepos;
  Repos({this.urlRepos});
  @override
  _ReposState createState() => _ReposState();
}

class _ReposState extends State<Repos> {
   List<Repository> list = List();
  bool loading=false;
 

  Future<List<Repository>> getRepoInfo() async {
    var res = await http.get(widget.urlRepos);
    list = (json.decode(res.body) as List)
      .map((data) => new Repository.fromJson(data))
      .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Repos List', style: TextStyle( color: Colors.white ),), backgroundColor: Colors.grey[800],),
        body: FutureBuilder(
        future: getRepoInfo(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                if(list.length != 0 ){
               return Card(
                 margin: EdgeInsets.symmetric(vertical : 12, horizontal: 15),
                
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                 color: Colors.grey[600],
                 child: ListTile(
                    // leading: Icon(Icons.shopping_cart),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(list[index].name, style: TextStyle( color: Colors.white ),),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical : 8.0),
                      child: Text((){
                            if(list[index].description != null) {return list[index].description; } 
                            else{ return "No Description for this Repo "; }
                            }(),textAlign : TextAlign.left, style: TextStyle(fontSize: 15,), ),
                    ),    
                  ),
               );
              }}
                  );
              }
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          else{
                print("list");
                return Center(child: Text('No Repos on your Github!!', style: TextStyle(fontSize : 20, color: Colors.grey, fontWeight: FontWeight.bold), ));
              }
        },),
    );
  }
}

