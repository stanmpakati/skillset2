import 'package:flutter/material.dart';
import 'package:newserverdemo/ui/shared/utils/routes.dart';
import 'package:provider/provider.dart';

import 'package:newserverdemo/core/models/user.dart';
import 'package:newserverdemo/core/services/post_service.dart';
import 'package:newserverdemo/core/services/user_service.dart';
import 'package:newserverdemo/core/services/auth_service.dart';
import 'package:newserverdemo/ui/screens/freelancer/profile/profile.dart';
import 'ui/shared/utils/light_theme.dart';
import 'ui/shared/utils/dark_theme.dart';

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
        initialRoute: Profile.id,
        routes: RouteGenerator().routes,
      ),
    );
  }
}
