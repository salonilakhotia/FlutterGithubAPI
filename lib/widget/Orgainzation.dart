import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class Organization extends StatelessWidget {

int public_repos;
int total_followings;
int total_followers;
String blog;

Organization({this.public_repos, this.total_followers, this.total_followings, this.blog});


  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 100, width: double.infinity,
                              child:Card(
                                color: Colors.grey.withOpacity(.8),
                                elevation: 3,
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Column(
                                   children:<Widget>[
                                    InkWell(
                                     child: Text((){
                                        if(blog != "") {return "Blog : $blog"; } 
                                        else{ return "No Email Id "; }
                                      }(),textAlign : TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                      onTap: () => launch('$blog')
                                    ),
                                    Text("Public Repos : $public_repos",textAlign : TextAlign.left,  style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                    Text("Total followers : $total_followers",textAlign : TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                    Text("Total followers : $total_followers" ,textAlign : TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                    
                                 ],),
                               ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);
  }
}