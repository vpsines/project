enum CardType { color, image, video }

class CardData {
  final CardType type;
  final dynamic background;
  final String location;
  final String title;
  final String latitude;
  final String longitude;
  final bool isDarkTheme;

  CardData({
    required this.type,
    required this.background,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.isDarkTheme,
    required this.location,
  });
}
