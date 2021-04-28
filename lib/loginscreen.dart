import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/model/userinfo.dart';
import 'dart:math' as math;

import 'customs/customrouter.dart';

var t1 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
);
var treg = TextStyle(
  fontFamily: 'Montserrat',
);

class Login extends StatefulWidget{
  @override
  LoginScreen createState()=>LoginScreen();

}
class LoginScreen extends State<Login>{
  User user = new User();
  int gender;
  bool validateString(String input) {
    if(input==null) return false;
    if(input.length==0) return false;
    String output = input.replaceAll(" ", "");
    if(output == "") {
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
  final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body:Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                        "Welcome",
                        style: t1,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(left:10,right:10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Name",
                  ),
                  onChanged: (String value){
                    setState(() {
                      user.name=value;
                    });
                  },
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                ),
              ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        activeColor: Colors.cyanAccent,
                        groupValue: gender,
                        value:0,
                        onChanged: (int value){
                          setState(() {
                            gender=value;
                            user.gender=value;
                          });
                        }
                      ),
                      Text("Male"),
                      Radio(
                          activeColor: Colors.cyanAccent,
                          groupValue: gender,
                          value:1,
                          onChanged: (int value){
                            setState(() {
                              gender=value;
                              user.gender=value;
                            });
                          }
                      ),
                      Text("Female"),
                    ],
                ),
              Padding(
                padding: EdgeInsets.only(left:10,right:10,bottom:10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Profession",
                  ),
                  onChanged: (String value){
                    setState(() {
                      user.profession=value;
                    });
                  },
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left:10,right: 10,bottom:10),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    maxLength: 150,
                    inputFormatters: [
                      MaxLinesTextInputFormatter(5),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bio",
                    ),
                    onChanged: (String value){
                      setState(() {
                        user.bio=value;
                      });
                    },
                  ),
              ),
              
              Padding(
                  padding: EdgeInsets.only(left:10,right:10),
                  child: ElevatedButton(
                    child: Text("Start"),
                    onPressed: 
                      validateString(user.name) && 
                      validateString(user.bio) && 
                      validateString(user.profession) && 
                      user.gender!=null ? () async {
                      user.flwr=1000;
                      user.flwg=20;
                      await Navigator.of(context).pushReplacementNamed(
                        AppRoutes.detailScreen, 
                        arguments: user
                      );
                    } : null,
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class MaxLinesTextInputFormatter extends TextInputFormatter {
  MaxLinesTextInputFormatter(this.maxLines)
      : assert(maxLines == null || maxLines == -1 || maxLines > 0);

  final int maxLines;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, // unused.
      TextEditingValue newValue,
      ) {
    if (maxLines != null && maxLines > 0) {
      final regEx = RegExp("^.*((\n?.*){0,${maxLines - 1}})");
      String newString = regEx.stringMatch(newValue.text) ?? "";

      final maxLength = newString.length;
      if (newValue.text.runes.length > maxLength) {
        final TextSelection newSelection = newValue.selection.copyWith(
          baseOffset: math.min(newValue.selection.start, maxLength),
          extentOffset: math.min(newValue.selection.end, maxLength),
        );
        final RuneIterator iterator = RuneIterator(newValue.text);
        if (iterator.moveNext())
          for (int count = 0; count < maxLength; ++count)
            if (!iterator.moveNext()) break;
        final String truncated = newValue.text.substring(0, iterator.rawIndex);
        return TextEditingValue(
          text: truncated,
          selection: newSelection,
          composing: TextRange.empty,
        );
      }
      return newValue;
    }
    return newValue;
  }
}