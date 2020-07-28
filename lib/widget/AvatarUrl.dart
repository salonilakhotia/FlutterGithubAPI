import 'package:flutter/material.dart';

class AvatarUrl extends StatelessWidget {

  final String avatar_url;
  AvatarUrl({this.avatar_url});
  @override
  Widget build(BuildContext context) {
    return   CircleAvatar( backgroundColor: Colors.black,radius: 180,
                        child:  CircleAvatar( backgroundColor: Colors.grey[900],radius: 150,
                            child:  CircleAvatar( backgroundColor: Colors.grey[850],radius: 120,
                              child:  CircleAvatar( backgroundColor: Colors.grey[800],radius: 90,
                                  child:  CircleAvatar( backgroundColor: Colors.grey[700],radius: 60,
                                    child:  CircleAvatar( backgroundColor: Colors.grey[600],radius: 120,
                                        child:  CircleAvatar( backgroundColor: Colors.grey,radius: 90, backgroundImage: NetworkImage(avatar_url),
                                          ),),),),),),);
  }
}