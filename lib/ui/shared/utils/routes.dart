import 'package:newserverdemo/auth_wrapper.dart';
import 'package:newserverdemo/ui/screens/welcome.dart';
import 'package:newserverdemo/ui/screens/login/login.dart';
import 'package:newserverdemo/ui/screens/freelancer/freelancer_view.dart';
import 'package:newserverdemo/ui/screens/freelancer/messages/chat_screen.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/description.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/details.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/profile.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/skills.dart';
import 'package:newserverdemo/ui/screens/freelancer/signup/on_boad.dart';
import 'package:newserverdemo/ui/screens/freelancer/home/freelancer_home.dart';

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
  };
}
