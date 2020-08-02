import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class Blog extends StatelessWidget {

String blog;

Blog({this.blog});


  @override
  Widget build(BuildContext context) {
    return Container(
  
                     width: double.infinity,
                              child:Card(
                                color: Colors.grey.withOpacity(.8),
                                elevation: 3,
                               child: Padding(
                                 padding: const EdgeInsets.all(26.0),
                                 child: Column(
                                   children:<Widget>[
                                     Text('Blog',  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold, ),),
                                    InkWell(
                                     child: Text((){
                                        if(blog != "") {return "Blog : $blog"; } 
                                        else{ return "No Blog Link On You Github :( "; }
                                      }(),textAlign : TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                      onTap: () => launch('$blog')
                                    ),
                                    
                                 ],),
                               ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);
  }
}