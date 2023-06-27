import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/home.dart';
import 'package:weatherapp/search.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int select_index = 0;

  void onItemTapped(int index) {
    setState(() {
      select_index = index;
      if (select_index == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()));
      } else if(select_index == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Searchpage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
      ],
      currentIndex: select_index,
      onTap: onItemTapped,
    );
  }
}
