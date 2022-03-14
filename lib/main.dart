import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pros_cons/application/bloc/category_bloc.dart';
import 'package:pros_cons/injection.dart';
import 'package:pros_cons/presentation/core/size_config.dart';
import 'package:pros_cons/presentation/prosCons/home_page.dart';

void main() async {
  await _appInitializer();
}

/// Initializes dependencies.
Future<void> _appInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('category');
  configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pros Cons',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => getIt<CategoryBloc>(),
          child: const Responsive(
              screenHeight: 812, screenWidth: 375, child: HomePage()),
        ));
  }
}
