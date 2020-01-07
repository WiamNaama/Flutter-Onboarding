import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

final images = [
  'lib/Screens/assets/images/M.jpeg',
  'lib/Screens/assets/images/C.jpeg',
  'lib/Screens/assets/images/A.jpeg',
  'lib/Screens/assets/images/S-1.jpeg',
];

final T = [
  "We're Here For You",
  "This Is Your Trip",
  "Have Fun With Us",
  "Good Luck"
];

final D = [
  "THE WORLD IS A BOOK AND THOSE WHO DO NOT TRAVEL READ ONLY A PAGE ~ SAINT AUGUSTINE",
  "LIFE IS EITHER A DARING ADVENTURE OR NOTHING AT ALL ~ HELEN KELLER",
  "TAKE ONLY MEMORIES, LEAVE ONLY FOOTPRINTS ~ CHIEF SEATTLE",
  "TRAVELING ALLOWS YOU TO BECOME SO MANY DIFFERENT VERSIONS OF YOURSELF",
];

class Onboarding_1 extends StatefulWidget {
  @override
  _Onboarding_1State createState() => _Onboarding_1State();
}

class _Onboarding_1State extends State<Onboarding_1> {
  Color _myColor = Color.fromRGBO(70, 65, 89, 1);

  double _MarginLandR;
  double _PageTop;
  double _PageB;
  double _PageHeight;

  PageController _pageController;

  ValueNotifier _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _pageIndexNotifier.value,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _MarginLandR = MediaQuery.of(context).size.width * 0.08;

    _PageTop = MediaQuery.of(context).size.width * 0.07;
    _PageB = MediaQuery.of(context).size.height * 0.06;
    _PageHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      body: Container(
        color: _myColor,
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _pageIndexNotifier.value = index;
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: _PageHeight,
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        left: _MarginLandR,
                        right: _MarginLandR,
                        top: _PageTop,
                        bottom: _PageB),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Text(
                              T[index],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            D[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                PageViewIndicator(
                  indicatorPadding: EdgeInsets.all(3),
                  pageIndexNotifier: _pageIndexNotifier,
                  length: 4,
                  normalBuilder: (animationController, index) => Circle(
                    size: 8.0,
                    color: Colors.white,
                  ),
                  highlightedBuilder: (animationController, index) =>
                      ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animationController,
                      curve: Curves.ease,
                    ),
                    child: Circle(
                      size: 12.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                FlatButton(
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(microseconds: 400),
                        curve: Curves.ease);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
