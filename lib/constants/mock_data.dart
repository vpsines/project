import 'package:flutter/material.dart';
import 'package:project/constants/images.dart';
import 'package:project/constants/videos.dart';
import 'package:project/models/card_data.dart';

final carouselData = [
  CardData(
    type: CardType.color,
    background: Colors.white,
    title: 'Nestled in nature',
    isDarkTheme: false,
    latitude: '29\'22\'47\' N',
    longitude: '79\'27\'48\' E',
    location: 'Uttarakhand',
  ),
  CardData(
    type: CardType.image,
    assetUrl: Images.image1,
    background: Colors.red,
    title: 'Nestled in nature',
    isDarkTheme: true,
    latitude: '29\'22\'47\' N',
    longitude: '79\'27\'48\' E',
    location: 'Uttarakhand',
  ),
  CardData(
    type: CardType.video,
    background: Colors.blue,
    assetUrl: Videos.video1,
    title: 'Nestled in nature',
    isDarkTheme: true,
    latitude: '29\'22\'47\' N',
    longitude: '79\'27\'48\' E',
    location: 'Uttarakhand',
  ),
  CardData(
    type: CardType.color,
    background: Colors.yellow,
    title: 'Nestled in nature',
    isDarkTheme: true,
    latitude: '29\'22\'47\' N',
    longitude: '79\'27\'48\' E',
    location: 'Kerala',
  ),
];
