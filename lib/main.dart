import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:skillset/core/models/user.dart';
import 'package:skillset/core/services/auth_service.dart';
import 'package:skillset/ui/screens/freelancer/freelancer_view.dart';
import 'package:skillset/ui/screens/freelancer/home/freelancer_home.dart';
import 'package:skillset/ui/screens/home_temp.dart';
import 'package:skillset/ui/shared/utils/theme.dart';
import 'ui/screens/login/login.dart';
import 'ui/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

Stream<User> get user async* {
  yield User(
    userId: '32',
    atSign: 'periwinkle',
    firstName: 'Stan',
    lastName: 'Mpakati',
    city: 'Harare',
    country: 'Zimbabwe',
    stars: 3.8,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider<User>(
          create: (_) => user,
          initialData: User(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        initialRoute: AuthenticationWrapper.id,
        routes: {
          LoginAtSign.id: (context) => LoginAtSign(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          FreelancerHome.id: (context) => FreelancerHome(),
          AuthenticationWrapper.id: (context) => AuthenticationWrapper(),
        },
      ),
    );
  }
}

String authWrapper(BuildContext context) {
  final User user = context.watch<User>();
  if (user.atSign == null) {
    print(user.atSign);
    return LoginAtSign.id;
  }
  print('not null ${user.atSign}');
  return FreelancerHome.id;
}

class AuthenticationWrapper extends StatelessWidget {
  static final String id = "AuthWrapper";
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    if (user.atSign == null) {
      print(user.atSign);
      return LoginAtSign();
    }
    print('not null ${user.atSign}');
    return FreelancerHome();
  }
}
