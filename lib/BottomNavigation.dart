import 'package:flutter/material.dart';
import 'Display.dart';

class BottomNavigation extends StatelessWidget {
   final String user;
  BottomNavigation({this.user});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home : new BottomNav(username : user),
    );
  }
}

class BottomNav extends StatefulWidget {
  final String username;
  BottomNav({this.username});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
 
 int selectedIndex = 0;
  final widgetOptions = [
    new Display(username : widget.username),
    Text('Add new beer'),
    Text('Favourites'),
  ];
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Beer App'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.local_drink), title: Text('Beers')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text('New Beer')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favourites')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
