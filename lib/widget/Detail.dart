import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
                      height: 200, width: double.infinity,
                              child:Card(
                                color: Colors.grey.withOpacity(.8),
                                elevation: 3,
                               child: Center(child: Text("Organization", style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold, ), ),),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),),);
  }
}