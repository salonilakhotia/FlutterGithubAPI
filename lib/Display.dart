import 'package:flutter/material.dart';
import 'package:githubAPI/widget/AvatarUrl.dart';
import 'package:githubAPI/widget/Detail.dart';
import 'package:githubAPI/widget/Blog.dart';
import 'package:githubAPI/widget/GitLink.dart';
import 'DisplayFollowings.dart';
import 'DisplayFollowers.dart';
import 'package:http/http.dart' as http;
import 'DisplayRepos.dart';
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
  String gitLink = "";
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
    gitLink = resBody['html_url'];
    public_repos = resBody['public_repos'];
    bio = resBody['bio'];
    followers = resBody['followers'];
    followings = resBody['followings'];
    blog = resBody['blog'];
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
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
            child: Container(
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
                       child: Center(child: Text(login,  style: TextStyle(color: Colors.white,fontSize: 20,  ), ),)),
                    ],
                ),
                 Container(
                       // padding: EdgeInsets.only(top: 280),
                        width: double.infinity,
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
                  SizedBox(height: 8,),
                  Blog(blog : blog ), 
                  SizedBox(height: 8,),   
                  GitLink(gitLink : gitLink ),
                ]),
            )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        
        color: Colors.grey[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.view_day, color: Colors.white),
              onPressed:   (){  
                String urlRepo = 'https://api.github.com/users/' + widget.username +'/repos';
                Navigator.push(context,  MaterialPageRoute(builder: (context) => Repos(urlRepos : urlRepo)));}
            ),
            IconButton(
              icon: Icon(Icons.group, color: Colors.white),
              onPressed: () {
                String urlFollower = 'https://api.github.com/users/' + widget.username +'/followers';
                Navigator.push(context,  MaterialPageRoute(builder: (context) => DisplayFollowers(urlFollowers: urlFollower)));},
            ),
            IconButton(
              icon: Icon(Icons.people, color: Colors.white),
              onPressed: () {
                 String urlFollowing = 'https://api.github.com/users/' + widget.username +'/following';
                Navigator.push(context,  MaterialPageRoute(builder: (context) => DisplayFollowings(urlFollowings: urlFollowing)));},
            )
          ],
        ),
      ),
    );
  }
}
