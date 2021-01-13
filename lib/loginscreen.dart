import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/model/userinfo.dart';
import 'package:flutter_app1/detailscreen.dart';
import 'dart:math' as math;

var t1 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
);
var treg = TextStyle(
  fontFamily: 'Montserrat',
);
/*class Login extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
              primaryColor: Color(0xff191e3b),
              backgroundColor: Color(0xff191e3b),
              brightness: Brightness.dark,
              errorColor: Color(0xffB00020),
              accentColor: Color(0xff40C4FF),
      ),
      home: LoginScreen(),
    );
  }
}*/
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
        /*alignment: Alignment.center,*/
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
                    maxLengthEnforced: true,
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
                    /*textInputAction: TextInputAction.next,*/
                    /*onEditingComplete: () => node.nextFocus(),*/
                  ),
              ),
              /*Container(
                padding: EdgeInsets.only(left:10,right: 10,bottom:10),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Theme.of(context).accentColor.withOpacity(0.8),
                    buttonTheme: ButtonTheme.of(context).copyWith(
                      alignedDropdown: true,
                    ),
                  ),
                    child:DropdownButton<int>(
                      items:<DropdownMenuItem<int>>[
                        DropdownMenuItem<int>(
                          value: 0,
                          child: Text('Male'),
                        ),
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('Female'),
                        ),
                      ],
                      value:  gender,
                      hint: Text("Gender"),
                      onChanged: (int value){
                        setState(() {
                          gender=value;
                          user.gender=value;
                          }
                        );
                      },
                  ),
                ),
              ),*/
              Padding(
                  padding: EdgeInsets.only(left:10,right:10),
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text("Start"),
                    onPressed: validateString(user.name) && validateString(user.bio) && validateString(user.profession) && user.gender!=null ? (){
                      user.flwr=0;
                      user.flwg=0;
                      Navigator.push(context,CupertinoPageRoute(builder: (context){return DetailScreen(user:user);} ));
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