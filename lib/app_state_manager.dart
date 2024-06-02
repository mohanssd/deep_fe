import 'package:provider/provider.dart';
import 'apps/home_model.dart';

class AppStateManager {
  final appStatesProviders = [
    ChangeNotifierProvider(create: (context) => HomeModel())
  ];
}
