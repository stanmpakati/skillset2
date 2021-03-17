import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillset/core/models/user.dart';
import 'package:skillset/ui/screens/freelancer/freelancer_view.dart';
import 'package:skillset/ui/shared/utils/theme.dart';

void main() {
  runApp(MyApp());
}

Stream<User> get user async* {
  yield User(
    userId: '32',
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
        // Provider<AuthenticationService>(
        //   create: (_) => AuthenticationService(FirebaseAuth.instance),
        // ),
        StreamProvider<User>(
          create: (_) => user,
          initialData: User(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        home: FreelancerView(),
      ),
    );
  }
}
