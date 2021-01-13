import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/model/tourismplace.dart';
import 'package:flutter_app1/model/userinfo.dart';
import 'package:flutter_app1/mainscreen.dart';
// Font: Monserrat
var mont100 = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w100,
);
var mont200 = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w200,
);
var mont300 = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w300,
);
var montreg = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Montserrat',
);
var mont500 = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
);
var mont600 = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);
var mont700 = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
);

class DetailScreen extends StatelessWidget{
  final User user;
  DetailScreen({@required this.user});
  @override
  Widget build(BuildContext context) {
    TourismPlace place = tourismPlaceList[0];
    String avaAsset = user.gender==0 ? 'images/avatar_m.png' : 'images/avatar_f.png' ;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child:Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius:90,
                      backgroundColor: user.gender == 0 ? Colors.cyanAccent : Colors.pink[200],
                      child: CircleAvatar(
                        radius: 88,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: CircleAvatar(
                            radius: 75,
                            backgroundImage: AssetImage(avaAsset),
                        ) ,
                      ),
                    ),
                  ),
                ),
                /*SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FavoriteButton(),
                    ],
                  ),
                ),*/
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 12.0),
              child: Text(
                user.name,
                textAlign: TextAlign.center,
                style: mont700,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:3.0),
              child: Text(
                user.profession,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:20, right:20,top:30.0, bottom: 30),
              child: Text(
                user.bio,
                textAlign: TextAlign.center,
                style: mont300,
              ),
            ),
            Divider(
              height: 30,
              thickness: 1,
              color: Colors.white12,
            ),
            IntrinsicHeight(
              child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Expanded(
                    flex:1,
                    child: Container(
                      padding: EdgeInsets.only(top:6,bottom: 9,),
                        child:Column(
                      children: [
                        Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: mont700,
                        ),
                        Text(
                          "Posts",
                          textAlign: TextAlign.center,
                          style: mont300,
                        ),
                      ],
                    )
                  ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.white12,
                  ),
                  Expanded(
                      flex:1,
                      child: Container(
                        padding: EdgeInsets.only(top:6,bottom: 9,),
                          child:Column(
                        children: [
                          Text(
                            user.flwr.toString(),
                            textAlign: TextAlign.center,
                            style: mont700,
                          ),
                          Text(
                            "Followers",
                            textAlign: TextAlign.center,
                            style: mont300,
                          ),
                        ],
                      )
                  ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.white12,
                  ),
                  Expanded(
                      flex:1,
                      child: Container(
                          padding: EdgeInsets.only(top:6,bottom: 9,),
                          child:Column(
                        children: [
                          Text(
                            user.flwg.toString(),
                            textAlign: TextAlign.center,
                            style: mont700,
                          ),
                          Text(
                            "Following",
                            textAlign: TextAlign.center,
                            style: mont300,
                          ),
                        ],
                      )
                  ),
                  ),
                ],
            ),
            ),
            Divider(
              height: 30,
              thickness: 1,
              color: Colors.white12,
            ),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(left:20, right:20,bottom:20, top:20),
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),*/
              /*height: 300,
              child:ListView(
                scrollDirection: Axis.vertical,*/
                children: place.imageUrls.map((url) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white12,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //padding: EdgeInsets.all(10),/*only(top:10,left:20,right: 20,bottom:10),*/
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            // ),
          ],
        ),
      )
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}


class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}