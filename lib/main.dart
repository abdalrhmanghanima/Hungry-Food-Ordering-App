import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/features/auth/cubit/auth_cubit.dart';
import 'package:hungry_app/features/home/cubit/home_cubit.dart';
import 'package:hungry_app/features/product/cubit/product_options_cubit.dart';
import 'package:hungry_app/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<ProductOptionsCubit>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hungry App',
      theme: ThemeData(
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashView(),
    );
  }
}
