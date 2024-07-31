import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning/configration/themedata.dart';
import 'package:online_learning/presention/bloc/pagination_cupit.dart';
import 'package:online_learning/presention/widgets/widget_import.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.locator<PaginationCupit>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeDataProvider.lightTheme(context),
        home: const MainWidget(),
      ),
    );
  }
}
