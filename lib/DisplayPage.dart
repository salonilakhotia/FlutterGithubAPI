import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
   var info;
  DisplayPage({this.info});
  @override
  Widget build(BuildContext context) {
      return Scaffold(appBar: AppBar( 
        title : Text('${info['name']}')),
      body:  Column(
      children: <Widget>[
        CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(info['avatar_url']),
         ),
        Text('${info['public_repos']}'),
        Text('${info['bio']}'),
      ],
    ),
      );
  }
}