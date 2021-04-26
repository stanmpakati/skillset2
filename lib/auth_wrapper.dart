import 'package:flutter/material.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/screens/freelancer/freelancer_view.dart';
import 'package:newserverdemo/ui/screens/freelancer/signup/on_boad.dart';
import 'package:newserverdemo/ui/screens/login/login.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  static final String id = "AuthWrapper";
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _atSign =
        Provider.of<AuthService>(context, listen: false).atsign;
    return Consumer<AuthService>(
      builder: (BuildContext contex, AuthService authService, Widget child) {
        if (authService.atsign == null) {
          return LoginAtSign();
        }

        return Consumer<UserService>(
          builder:
              (BuildContext contex, UserService userService, Widget child) {
            if (userService.freelancer == null) {
              userService.getUser();
              return OnBoard();
            }
            return FreelancerView();
          },
        );
      },
    );
  }
}
