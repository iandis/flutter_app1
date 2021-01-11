import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app1/model/tourismplace.dart';
import 'package:flutter_app1/utils/utils.dart';
// Font: Monserrat
// var rubikreg = TextStyle(
//   fontSize: 16.0,
//   fontFamily: 'Rubik',
// );
// var rubik300 = TextStyle(
//   fontSize: 16.0,
//   fontFamily: 'Rubik',
//   fontWeight: FontWeight.w300,
// );
// var rubik500 = TextStyle(
//   fontSize: 30.0,
//   fontFamily: 'Rubik',
//   fontWeight: FontWeight.w500,
// );
// var rubik600 = TextStyle(
//   fontSize: 30.0,
//   fontFamily: 'Rubik',
//   fontWeight: FontWeight.w600,
// );
// var rubik700 = TextStyle(
//   fontSize: 30.0,
//   fontFamily: 'Rubik',
//   fontWeight: FontWeight.w700,
// );
// Font: Monserrat
var montreg = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Montserrat',
);
var mont200 = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w200,
);
var mont300 = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w300,
);
var mont500 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
);
var mont600 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);
var mont700 = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
);

// Font: Exo
// var exoreg = TextStyle(
//   fontSize: 16.0,
//   fontFamily: 'Exo',
//   /*fontWeight: FontWeight.w300,*/
// );
// var exo200 = TextStyle(
//   fontSize: 16.0,
//   fontFamily: 'Exo',
//   fontWeight: FontWeight.w200,
// );
// var exo300 = TextStyle(
//   fontSize: 16.0,
//   fontFamily: 'Exo',
//   fontWeight: FontWeight.w300,
// );
// var exo500 = TextStyle(
//   fontSize: 16.0,
//   fontFamily: 'Exo',
//   fontWeight: FontWeight.w500,
// );
// var exo600 = TextStyle(
//   fontSize: 30.0,
//   fontFamily: 'Exo',
//   fontWeight: FontWeight.w600,
// );
// var exo700 = TextStyle(
//   fontSize: 30.0,
//   fontFamily: 'Exo',
//   fontWeight: FontWeight.w700,
// );
// class DetailScreen extends StatelessWidget {
//   final TourismPlace place;
//   DetailScreen({@required this.place});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: ScreenLoading(place:place),
//     );
//   }
// }
class DetailScreen extends StatelessWidget{
  final TourismPlace place;
  DetailScreen({@required this.place});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child:Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius:90,
                      backgroundColor: place.col,
                      child: CircleAvatar(
                        radius: 88,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: CircleAvatar(
                            radius: 75,
                            backgroundImage: AssetImage(place.imageAsset)
                        ) ,
                      ),
                    ),
                  ),
                ),
                SafeArea(
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
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: mont700,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: mont200,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: mont200,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: mont200,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: mont200,
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
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