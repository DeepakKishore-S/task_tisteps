enum AppRouteEnum {
  usersPage,
  userDetailsPage,
}

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.usersPage:
        return "/users_page";

      case AppRouteEnum.userDetailsPage:
        return "/user_details_page";

      default:
        return "/users_page";
    }
  }
}
