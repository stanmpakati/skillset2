import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

Widget indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(microseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 8.0,
    width: isActive ? 24.0 : 16.0,
    decoration: BoxDecoration(
      color: isActive ? Colors.white : Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}

// PageView(
//   physics: ClampingScrollPhysics(),
//   controller: _pageController,
//   onPageChanged: (int page) {
//     setState(() {
//       _currentPage = page;
//     });
//   },
// )

Widget getField() {
  return Container(
    child: Text('hey'),
  );
}

class OnBoard extends StatefulWidget {
  static const id = 'onboard';
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final int _numPages = 6;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 650.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      getField(),
                      getField(),
                      getField(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage == _numPages - 1
                    ? Expanded(
                        child: Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24.0),
                                  ),
                                ),
                                RoundedButton(
                                  path: () {},
                                  text: 'Next',
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
