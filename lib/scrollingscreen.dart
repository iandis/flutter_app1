import'package:flutter/material.dart';
import 'package:flutter_app1/detail_screen.dart';

class ScrollingScreen extends StatelessWidget {
  final List listv = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,'button'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List<Widget>.generate(
        listv.length,
        (int index)
          {
            return listv[index] != 'button' ?
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    '${listv[index]}',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ) :
              Container(
                padding: EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
            );
          },
        ),
      ),
    );
  }
}