import 'package:flutter/material.dart';
import 'package:flutter_onboarding_2/Utilites/constants.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  ValueNotifier _pageViewNotifier = ValueNotifier<int>(0);

  PageController _pageController;
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _pageViewNotifier.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    double _pageviewhight = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView.builder(
                onPageChanged: (index) {
                  _pageViewNotifier.value = index;
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: _pageviewhight,
                        child: Image.asset(
                          AppImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(AppTitle[index], style: KTextStyle),
                      SizedBox(
                        height: 18,
                      ),
                       Text(
                     
                          AppBodyText[index],
                          textAlign: TextAlign.center,
                          style: KTextStyle.copyWith(
                            
                            fontSize: 15,
                           
                          
                        ),
                      ),
                    ],
                  );
                },
                itemCount: AppImages.length,
                pageSnapping: true,
                controller: _pageController,
              ),
            ),
            Container(
              child: Center(
                child: PageViewIndicator(
                  pageIndexNotifier: _pageViewNotifier,
                  length: 4,
                  normalBuilder: (animationController, index) =>
                      ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animationController,
                      curve: Curves.ease,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black87,
                    ),
                  ),
                  highlightedBuilder: (animationController, index) =>
                      ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animationController,
                      curve: Curves.ease,
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
