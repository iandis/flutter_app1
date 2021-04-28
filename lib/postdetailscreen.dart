

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/model/tourismplace.dart';

class PostDetailScreen extends StatelessWidget{
  final TourismPlace tourismPlace;
  final String userName;
  const PostDetailScreen({
    @required this.userName,
    @required this.tourismPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(tourismPlace.name),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Hero(
                tag: tourismPlace.name,
                child: CachedNetworkImage(
                  imageUrl: tourismPlace.imageUrls[0],
                  fit: BoxFit.cover,
                  
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.all(10),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    letterSpacing: 0.6,
                    fontFamily: 'Montserrat',
                  ),
                  children: [
                    TextSpan(
                      text: userName + ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: "\"" + tourismPlace.description + "\"",
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}