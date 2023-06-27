import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/result.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  TextEditingController search_controller = TextEditingController();
  String search_term = "";

  @override
  void dispose() {
    search_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: search_controller,
              onChanged: (val) {
                setState(() {
                  search_term = val;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter search term',
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage()));
              print('Search Term : $search_term');
            }, child: Text('Search'))
          ],
        ),
      )
    );
  }
}
