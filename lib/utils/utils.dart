import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/model/tourismplace.dart';
// Calculate dominant color from ImageProvider
Future<List<TourismPlace>> loadAllImage (List<TourismPlace> tPlace) async {
  List<TourismPlace> res = new List<TourismPlace>();
  for(TourismPlace p in tPlace) {
    p.img=Image.asset(p.imageAsset);
    PaletteGenerator paletteGenerator = await PaletteGenerator
        .fromImageProvider(AssetImage(p.imageAsset));
    p.col=paletteGenerator.dominantColor.color;
    res.add(p);
  }
  // res.map((p) async{
  //   p.img=Image.asset(p.imageAsset);
  //   PaletteGenerator paletteGenerator = await PaletteGenerator
  //     .fromImageProvider(AssetImage(p.imageAsset));
  //   p.col=paletteGenerator.dominantColor.color;
  //   res.add(p);
  // });
  return res;
  // PaletteGenerator paletteGenerator = await PaletteGenerator
  //     .fromImageProvider(imge);
  // return paletteGenerator.dominantColor.color;
}
