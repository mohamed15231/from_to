import 'package:flutter/material.dart';
import 'package:fromto/presentation/confirm_screen/confirm_screen.dart';
import 'package:fromto/presentation/dashboard/dashboard_view/dashboard_view.dart';
import 'package:fromto/presentation/intro/introview.dart';
import 'package:fromto/presentation/login/login_view/login_view.dart';
import 'package:fromto/presentation/reset_password/reset_password_view.dart';
import 'package:fromto/presentation/resources/string_manager.dart';
import 'package:fromto/presentation/shipping_method_air/shipping_view/shipping_method_air.dart';
import 'package:fromto/presentation/signup/signup_view.dart';
import 'package:fromto/presentation/terms_conditions/terms_and_conditions.dart';

import '../shipping_page/shipping_pageview/shipping_page.dart';

class Routes {
  static const String introRoute = "/";
  static const String loginRoute = "/login";
  static const String signupRoutes = "/signUp";
  static const String resetPasswordRoutes = "/resetPassword";
  static const String confirmScreenRoutes = "/confirmMessage";
  static const String dashBoard = "/dashBoard";
  static const String shippingPage = "/shippingPage";
  static const String shippingMethodPage = "/shippingMethodPage";
  static const String termsAndConditional = "/termsAndConditional";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.introRoute:
        return MaterialPageRoute(
          builder: (_) => const IntroView(),
        );

      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreenView(),
        );

      case Routes.signupRoutes:
        return MaterialPageRoute(
          builder: (_) => const SignupView(),
        );

      case Routes.resetPasswordRoutes:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(),
        );

      case Routes.confirmScreenRoutes:
        return MaterialPageRoute(
          builder: (_) => const ConfirmScreen(),
        );

      case Routes.dashBoard:
        return MaterialPageRoute(
          builder: (_) => const DashBoard(),
        );

      case Routes.shippingPage:
        return MaterialPageRoute(
          builder: (_) => ShippingPage(),
        );

      case Routes.shippingMethodPage:
        return MaterialPageRoute(
          builder: (_) => const ShippingMethodPage(isComeFromDashBoard: false),
        );
      case Routes.termsAndConditional:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditions(),
        );

      default:
        return _unDefinedRoute();
    }
  }

  static Route _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringManager.noRoute),
        ),
        body: const Center(
          child: Text(StringManager.noRoute),
        ),
      ),
    );
  }
}
