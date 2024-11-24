// Flutter imports:
import 'package:app_demo/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:app_demo/domain/core/constants/hive.constants.dart';
import 'package:app_demo/domain/core/constants/string.constants.dart';
import 'package:app_demo/domain/core/services/navigation/app_router.dart';
import 'package:app_demo/infrastructure/core/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY'].toString(),
      authDomain: dotenv.env['AUTH_DOMAIN'].toString(),
      projectId: dotenv.env['PROJECT_ID'].toString(),
      storageBucket: dotenv.env['STORAGE_BUCKET'].toString(),
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID'].toString(),
      appId: dotenv.env['APP_ID'].toString(),
    ),
  );
  await Hive.openBox(HiveConstants.hiveBox);
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final rootRouter = AppRouter();

    return MaterialApp.router(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: rootRouter.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.deepPurple.shade100,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        useMaterial3: true,
      ),
     // builder: (context, child) => child!,
     builder:(context, child) => const HomeScreen(),
    );
  }
}
