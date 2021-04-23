import 'package:flutter/material.dart';
import 'package:newserverdemo/core/services/post_service.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/ui/screens/freelancer/freelancer_view.dart';
import 'package:newserverdemo/ui/screens/freelancer/job/job.dart';
import 'package:newserverdemo/ui/screens/freelancer/messages/chat_screen.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/description.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/details.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/profile.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/skills.dart';
import 'package:newserverdemo/ui/screens/freelancer/signup/on_boad.dart';
import 'package:provider/provider.dart';
import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/ui/screens/freelancer/home/freelancer_home.dart';
import 'package:newserverdemo/ui/shared/utils/theme.dart';
import 'core/models/posting.dart';
import 'ui/screens/login/login.dart';
import 'ui/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

Stream<Freelancer> get user async* {
  yield mockFreelancer;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider<PostService>(
          create: (_) => PostService(),
        ),
        ChangeNotifierProvider<UserService>(
          create: (_) => UserService(),
        ),
        StreamProvider<Freelancer>(
          create: (_) => user,
          initialData: mockFreelancer,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: darkTheme,
        initialRoute: AuthenticationWrapper.id,
        routes: {
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
        },
      ),
    );
  }
}

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
