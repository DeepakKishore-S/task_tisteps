import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/user_details/presentation/pages/user_detail_page.dart';
import '../../features/users/domain/entity/user_details_nav_model/user_details_nav_model.dart';
import '../../features/users/presentation/pages/user_page.dart';

class AppRouter {
  static String currentRoute = "/";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name ?? "/";
    switch (settings.name) {
      // User page
      case '/users_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const UserPage(),
        );

      // User Details page
      case '/user_details_page':
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) {
            assert(settings.arguments != null, "Data is required");
            UserDetailsNavModel? args =
                settings.arguments as UserDetailsNavModel?;
            return UserDetailScreen(
              userId: args!.userId,
              index: args.index,
            );  
          },
        );

      default:
        return CupertinoPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
