
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yes_bank_app/store/cliente_store.dart';
import 'dart:async';
import 'screens/home/home_screen.dart';


Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZoned<Future<void>>(() async {
    // await Firebase.initializeApp();
    runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => YesBankApp(),
      ),
    );
  });
}

class YesBankApp extends StatelessWidget {
  final materialTheme = ThemeData(
      primaryColor: Colors.pink[600],
      hintColor: Colors.pink[600],
      colorScheme: ColorScheme.light(
        primary: Colors.pink[600]!, // primaryColor
        secondary: Colors.pink[600]!, // accentColor
      ),);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ClienteStore>(
          create: (_) => ClienteStore(),
        ),
      ],
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Beauty Clinic',
        theme: materialTheme,
        home: HomeScreen(),
        initialRoute: 'home',
        routes: {
          // 'login': (context) => Login(),
          'home': (context) => HomeScreen(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale('pt')],
      ),
    );
  }
}
