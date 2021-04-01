import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/screens/freelancer/home/home_freelancers.dart';
import 'package:newserverdemo/ui/screens/freelancer/home/jobs_for_me.dart';
import 'package:newserverdemo/ui/screens/freelancer/home/widgets/tab_bar.dart';

class FreelancerHome extends StatefulWidget {
  static final String id = "FreelancerHome";
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
          title: Text('Home'),
        ),
        body: Column(
          children: [
            tabBar(context),
            Expanded(
              child: TabBarView(
                children: [JobsForMe(), HomeFreelancerView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
