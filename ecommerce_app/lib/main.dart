import 'package:ecommerce_app/bloc/category/category_bloc.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/ui/pages/category_page.dart';
import 'package:ecommerce_app/ui/pages/home_page.dart';
import 'package:ecommerce_app/ui/pages/login_page.dart';
import 'package:ecommerce_app/ui/pages/nav_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/authentication/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontFamily: 'SB',
            fontSize: 14.0,
          ),
          displayMedium: TextStyle(
            color: CustomColors.grey,
            fontFamily: 'SB',
            fontSize: 12.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
    );
  }
}
