import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/customs/customrouter.dart';
import 'package:flutter_app1/model/userinfo.dart';
import 'package:flutter_app1/tourismplacelists.dart';
var mont300 = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w300,
);
var montreg = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Montserrat',
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
    String avaAsset = user.gender==0 ? 'images/avatar_m.png' : 'images/avatar_f.png' ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            width: 75,
            child: TextButton(
              child: Icon(Icons.logout, size: 20, color: Colors.white),
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onPressed: () async {
                await Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
              },
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius:70,
                    backgroundColor: user.gender == 0 ? Colors.cyanAccent : Colors.pink[200],
                    child: CircleAvatar(
                      radius: 69,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: CircleAvatar(
                        radius: 58,
                        backgroundImage: AssetImage(avaAsset),
                      ),
                    ),
                  ),
                ),
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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: mont300
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:20, right:20,top:30.0, bottom: 30),
              child: Text(
                user.bio,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: montreg,
              ),
            ),
            Divider(
              height: 30,
              thickness: 1,
              color: Colors.white12,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15)
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          TourismPlaces.lists.length.toString(),
                          textAlign: TextAlign.center,
                          style: mont700,
                        ),
                        Text(
                          "Posts",
                          textAlign: TextAlign.center,
                          style: mont300,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15)
                      ),
                    ),
                    child: Column(
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
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15)
                      ),
                    ),
                    child: Column(
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
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
                children: TourismPlaces.lists.map((place) {
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).pushNamed(
                        AppRoutes.postDetailScreen, 
                        arguments: [
                            user.name,
                            place
                          ]
                        );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: place.name,
                          child: CachedNetworkImage(
                            imageUrl: place.imageUrls[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      )
    );
  }
}