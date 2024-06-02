import 'package:flutter/material.dart';
import 'package:project_deep/app_route_manager.dart';
import 'package:provider/provider.dart';
import 'app_state_manager.dart';

AppStateManager appStateManager = AppStateManager();
AppRouteManager appRouteManager = AppRouteManager();

void main() {
  runApp(MultiProvider(
    providers: appStateManager.appStatesProviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouteManager.getRouter,
    );
  }
}
