import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/search.dart';

class MainpageUI extends StatefulWidget {
  const MainpageUI({super.key});

  @override
  State<MainpageUI> createState() => _MainpageUIState();
}

class _MainpageUIState extends State<MainpageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Searchpage()));
            }, child: Text('해수욕장 검색'))
          ],
        ),
      )
    );
  }
}
