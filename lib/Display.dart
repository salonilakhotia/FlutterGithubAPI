import 'package:flutter/material.dart';
import 'package:githubAPI/widget/AvatarUrl.dart';
import 'package:githubAPI/widget/Detail.dart';
import 'package:githubAPI/widget/Orgainzation.dart';
import 'package:http/http.dart' as http;
import 'Repos.dart';
import 'dart:convert';
import 'Followers.dart';

class Display extends StatefulWidget {
  final String username;
  Display({this.username});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  String url = 'https://api.github.com/users/';
  List<Followers> list = List();
  bool loading = false;
  String name = "";
  String avatar_url = "";
  int public_repos = 0;
  String bio ="";
  String login = ""; 
  String blog = "";
  int followers  = 0;
  int followings = 0;
  

  getUser(String username) async {
    String gitProfile = url + username;
    var res = await http.get(gitProfile);
    var resBody = json.decode(res.body);
    name = resBody['name'];
    login = resBody['login'];
    avatar_url = resBody['avatar_url'];
    public_repos = resBody['public_repos'];
    bio = resBody['bio'];
    followers = resBody['followers'];
    followings = resBody['followings'];
    blog = resBody['blog'];
    String urlfollowers = gitProfile +'/followers';
    String urlrepo = gitProfile + '/repos';
    final response = await http.get(urlfollowers);
    list = (json.decode(response.body) as List)
      .map((data) => new Followers.fromJson(data))
      .toList();
      print(list[0].login);

    setState(() {
      loading : true;
    });
  }
  
  

  @override
  void initState() {
    // TODO: implement initState
    getUser(widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //String url = widget.username +'/followers';
    
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
               Stack(
                  children: <Widget>[ 
                   AvatarUrl(avatar_url: avatar_url,),
                   Container(
                     height: 150,
                     child: Center(child: Text(name,    style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold, ), ),)),
                       Container(
                     height: 210,
                     child: Center(child: Text(login,    style: TextStyle(color: Colors.white,fontSize: 20,  ), ),)),
                    Container(
                      padding: EdgeInsets.only(top: 280),
                      height: 380, width: double.infinity,
                              child:Card(
                                color: Colors.grey.withOpacity(.8),
                                elevation: 3,
                               child: Padding(
                                 padding : EdgeInsets.all(8),
                                 child: Text(
                                 (() {
                                      if(bio != null){
                                        return bio;}
                                      else { return "You don't have any details in your bio :(";}
                                      })(),  textAlign: TextAlign.center,  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, ), ),),
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0),),),),    
                  ],
              ),
              SizedBox(height: 8,),
              Organization(public_repos: public_repos, total_followers : followers , total_followings : followings, blog : blog ), 
              SizedBox(height: 8,),    
              //Detail(),
              Text(list[0].login, style: TextStyle(color: Colors.white,)),   
              ]),
          )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed:   (){  Navigator.push(context,  MaterialPageRoute(builder: (context) => Repos()));}
            ),
            IconButton(
              icon: Icon(Icons.hotel, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}


  //     return  Scaffold(
  //       appBar: AppBar( 
  //       backgroundColor: Colors.black,
  //       title : Text('Hey')),
  //       body:  SingleChildScrollView(
  //           child:  Column(
             
  //            children: <Widget>[
  //               CircleAvatar(
  //                 radius: 70,
  //                 backgroundColor: Colors.transparent,
  //                 backgroundImage: NetworkImage(avatar_url),
  //             ),
  //              Text(name),
  //              Text('$public_repos'),
  //              Text(bio),
  //             // RaisedButton(onPressed: fetchData ,child: Text('follower'),),
  //              Text('${list[0].login}'),
  //              Text('${list[1].login}'),
  //             // Text('${list[2].login}'),
  //             // Text('${list.length}'),
  //             // loading == false ? CircularProgressIndicator() :
  //              SizedBox(
  //               height: 800,
  //               child: ListView.builder(
  //               itemCount: list.length,
  //               itemBuilder: (BuildContext context, int index){
  //                 return ListTile(contentPadding: EdgeInsets.all(5),
  //                   title: new Text(list[index].login),
  //          );
  //         },
  //       ),)
  //      ],
  //     ),
  //    ),
  //   );
  //  }
  // }
