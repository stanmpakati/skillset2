import 'package:flutter/material.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/shared/widgets/freelancer_widget.dart';
import 'package:provider/provider.dart';

class HomeFreelancerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserService>(
      builder: (context, userService, child) {
        userService.getFreelancers();
        List<Freelancer> freelancers = userService.freelancers;
        if (freelancers?.isEmpty ?? true) {
          return Center(
            child: Text(
              'No Freelancers',
              style: Theme.of(context).primaryTextTheme.headline2,
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          itemCount: freelancers.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: FreelanceBig(freelancer: freelancers[index]),
          ),
        );
      },
    );
  }
}
