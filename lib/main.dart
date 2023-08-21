import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projects_galaxy/helper/cache_helper.dart';

import 'app/app.dart';
import 'bloc/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initLocalStorage();
  Bloc.observer = const SimpleBlocObserver();
  runApp(MyApp());
}
