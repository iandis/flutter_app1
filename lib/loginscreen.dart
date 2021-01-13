import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/model/userinfo.dart';

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
                padding: EdgeInsets.only(left:10,right:10,bottom:10),
                child:TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama",
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
              Padding(
                  padding: EdgeInsets.only(left:10,right: 10,bottom:10),
                  child:TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bio",
                    ),
                    onChanged: (String value){
                      setState(() {
                        user.bio=value;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                  ),
              ),
              Container(
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
              ),
              Padding(
                  padding: EdgeInsets.only(left:10,right:10),
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text("Start"),
                    onPressed: validateString(user.name) && validateString(user.bio) && user.gender!=null ? (){} : null,
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}