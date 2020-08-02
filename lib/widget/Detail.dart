import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  
int public_repos;
int total_followings;
int total_followers;

Detail({this.public_repos, this.total_followers, this.total_followings});

  @override
  Widget build(BuildContext context) {
    return  Container(
      
                      height: 160, width: double.infinity,
                              child:Card( 
                                color: Colors.grey.withOpacity(.8),
                                elevation: 3,
                               child: Center(
                                 child: Column(
                                 children: <Widget>[
                                   Text("Public Repos : $public_repos",textAlign : TextAlign.left,  style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                    Text("Total followers : $total_followers",textAlign : TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                    Text("Total followers : $total_followers" ,textAlign : TextAlign.left, style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),
                                    
                                 ],
                               ),),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);
  }
}