import 'package:flutter/material.dart';
import 'package:project/models/card_data.dart';

class CarouselCard extends StatelessWidget {

  final CardData cardData;

  const CarouselCard({super.key,required this.cardData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}
