import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_deep/apps/layout.dart';
import 'package:project_deep/apps/regression_landing.dart';
import 'apps/home.dart';

class AppRouteManager {
  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => Layout(
        body: Home(),
        title: 'Home',
      ),
    ),
    GoRoute(
      path: '/regression',
      name: 'Regression',
      builder: (context, state) => Layout(
        body: RegressionLanding(),
        title: 'Regression',
      ),
    ),
  ]);

  get getRouter => _router;
}
