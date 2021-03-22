import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/screens/freelancer/add/add_job.dart';
import 'package:newserverdemo/ui/screens/freelancer/home/freelancer_home.dart';
import 'package:newserverdemo/ui/screens/freelancer/messages/messages_notifications.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/profile.dart';
import 'package:newserverdemo/ui/screens/freelancer/proposals/proposal_notifications.dart';

class FreelancerView extends StatefulWidget {
  static final String id = "FreelancerView";

  @override
  _FreelancerViewState createState() => _FreelancerViewState();
}

class _FreelancerViewState extends State<FreelancerView> {
  int _currentIndex = 4;
  PageController _pageController = PageController();

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.cases), label: 'Proposals'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Job'),
    BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Messages'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  List<Widget> _pages = [
    FreelancerHome(),
    ProposalNotifications(),
    AddJob(),
    MessageNotifications(),
    Profile(),
  ];

  void _changePage(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: _changePage,
        currentIndex: _currentIndex,
        items: _bottomNavBarItems,
      ),
    );
  }
}
