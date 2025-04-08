import 'package:flutter/material.dart';
import 'package:project/constants/mock_data.dart';
import 'package:project/widgets/action_button.dart';
import 'package:project/widgets/carousel_card.dart';
import 'package:project/widgets/explore_button.dart';
import 'package:project/widgets/text_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (currentIndex != 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          icon: Icon(
            Icons.arrow_upward_outlined,
            color:
                carouselData[currentIndex].isDarkTheme
                    ? Colors.white
                    : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          ActionButton(
            icon: Icons.volume_up_outlined,
            borderColor:
                carouselData[currentIndex].isDarkTheme
                    ? Colors.white
                    : Colors.black,
            size: 40,
            onPressed: () {},
          ),
          const SizedBox(width: 20),
          ActionButton(
            icon: Icons.filter_1_outlined,
            borderColor:
                carouselData[currentIndex].isDarkTheme
                    ? Colors.white
                    : Colors.black,
            size: 40,
            onPressed: () {},
          ),
          const SizedBox(width: 20),
        ],
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),

      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: carouselData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return CarouselCard(
                cardData: carouselData[currentIndex],
                isVisible: currentIndex == index,
              );
            },
          ),
          Positioned(
            bottom: size.height * 0.15,
            child: CircularTextRunner(
              text: 'EXPLORE • EXPLORE • EXPLORE ',
              size: 200,
              textStyle: TextStyle(
                color: carouselData[currentIndex].isDarkTheme
                          ? Colors.white
                          : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              buttonChild: Icon(Icons.arrow_right_alt_sharp,size: 30, color: Colors.black),
              buttonColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: size.height * 0.05,
            child: Row(
              children: [
                TextIconButton(
                  buttonText: "Like",
                  iconData: Icons.favorite_outline,
                  onPressed: () {},
                  buttonColor:
                      carouselData[currentIndex].isDarkTheme
                          ? Colors.white
                          : Colors.black,
                ),
                SizedBox(width: size.width * 0.25),
                TextIconButton(
                  buttonText: "Share",
                  buttonColor:
                      carouselData[currentIndex].isDarkTheme
                          ? Colors.white
                          : Colors.black,
                  iconData: Icons.share_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
