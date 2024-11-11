import 'package:get_it/get_it.dart';

import '../view_models/tab_bar_view_model.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => TabBarViewModel());
}
