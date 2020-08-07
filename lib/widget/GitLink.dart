import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class GitLink extends StatelessWidget {

String gitLink;

GitLink({this.gitLink});

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
                                     Text('GitHub Link',  style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold, ),),
                                    InkWell(
                                     child: Text('Click to Direct it to Chrome :)', style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                      onTap: () => launch('$gitLink')
                                    ),
                                    
                                 ],),
                               ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);
  }
}