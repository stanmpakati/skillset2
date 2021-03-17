import 'package:flutter/material.dart';
import 'package:skillset/ui/screens/freelancer/home/jobs_for_me.dart';
import 'package:skillset/ui/screens/freelancer/home/widgets/tab_bar.dart';

class FreelancerHome extends StatefulWidget {
  @override
  _FreelancerHomeState createState() => _FreelancerHomeState();
}

class _FreelancerHomeState extends State<FreelancerHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jobs Marketplace'),
        ),
        body: Column(
          children: [
            tabBar(context),
            Expanded(
              child: TabBarView(
                children: [
                  JobsForMe(),
                  Icon(Icons.handyman),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
