import 'dart:js';

import 'package:newserverdemo/auth_wrapper.dart';
import 'package:newserverdemo/ui/screens/freelancer_view.dart';
import 'package:newserverdemo/ui/screens/home/freelancer_home.dart';
import 'package:newserverdemo/ui/screens/login/on_boad.dart';
import 'package:newserverdemo/ui/screens/messages/chat_screen.dart';
import 'package:newserverdemo/ui/screens/profile/description.dart';
import 'package:newserverdemo/ui/screens/profile/details.dart';
import 'package:newserverdemo/ui/screens/profile/profile.dart';
import 'package:newserverdemo/ui/screens/profile/skills.dart';
import 'package:newserverdemo/ui/screens/settings.dart';
import 'package:newserverdemo/ui/screens/welcome.dart';
import 'package:newserverdemo/ui/screens/login/login.dart';

class RouteGenerator {
  final routes = {
    LoginAtSign.id: (context) => LoginAtSign(),
    WelcomeScreen.id: (context) => WelcomeScreen(),
    FreelancerHome.id: (context) => FreelancerHome(),
    AuthenticationWrapper.id: (context) => AuthenticationWrapper(),
    FreelancerView.id: (context) => FreelancerView(),
    PersonalDetails.id: (context) => PersonalDetails(),
    FreelancerDescription.id: (context) => FreelancerDescription(),
    FreelancerSkills.id: (context) => FreelancerSkills(),
    Profile.id: (context) => Profile(),
    OnBoard.id: (context) => OnBoard(),
    Chat.id: (context) => Chat(),
    '/settings': (context) => SettingsPage(),
  };
}
