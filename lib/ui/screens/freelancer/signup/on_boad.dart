import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/description.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/details.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/skills.dart';
import 'package:newserverdemo/ui/shared/widgets/rounded_button.dart';

class OnBoard extends StatefulWidget {
  static const id = 'onboard';
  @override
  _OnBoardState createState() => _OnBoardState();
}

final pdFormKey = GlobalKey<FormState>();
final descriptionFormKey = GlobalKey<FormState>();

class _OnBoardState extends State<OnBoard> {
  final int _numPages = 6;
  final PageController _pageController = PageController(initialPage: 0);
  Map<String, dynamic> newUser = {
    'userId': null,
    'atSign': null,
    'profilePicture': null,
    'firstName': null,
    'lastName': null,
    'email': null,
    'city': null,
    'country': null,
    'bio': null,
    'stars': null,
    'title': null,
    'skills': null,
    'education': [],
    'workHistory': [],
    'priceList': [],
  };

  int _currentPage = 0;

  void callBack(Map<String, dynamic> map) {
    newUser.addAll(map);
    print(newUser);
  }

  // void skillsCallBack(List<String> passedChips) {
  //   newUser['skills'] = passedChips;
  //   print(passedChips);
  // }

  void _next() {
    if (_currentPage == 0) {
      if (pdFormKey.currentState.validate()) {
        pdFormKey.currentState.save();

        // next page
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    } else if (_currentPage == 1) {
      if (descriptionFormKey.currentState.validate()) {
        descriptionFormKey.currentState.save();
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    } else if (_currentPage == 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
      UserService().builduser(newUser);
    }
    // _currentPage != 5 ?
  }

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
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
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
                        PersonalDetails(function: callBack),
                        FreelancerDescription(function: callBack),
                        FreelancerSkills(function: callBack),
                        // getField(),
                        // getField(),
                        // getField(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -40,
              right: 12,
              child: Container(
                width: 80,
                child: RoundedButton(
                  text: 'next',
                  path: _next,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(microseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 8.0,
    width: isActive ? 26.0 : 16.0,
    decoration: BoxDecoration(
      color: isActive ? Colors.blue : Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}
