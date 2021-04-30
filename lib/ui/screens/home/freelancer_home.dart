import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/screens/home/widgets/tab_bar.dart';

import 'home_freelancers.dart';
import 'jobs_for_me.dart';

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
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            )
          ],
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
