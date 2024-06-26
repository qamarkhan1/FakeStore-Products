import 'package:fakestore/model/colors.dart';
import 'package:fakestore/model/l10n/l10n.dart';
import 'package:fakestore/model/routes.dart';
import 'package:fakestore/services/sharedprefs_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'model/products/products.dart';

List<Product> favouritesItems = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.initSharedPref();
  favouritesItems = await SharedPrefService().loadList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tezda Job Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.transparent,
          cursorColor: FSColors.purple,
          selectionHandleColor: FSColors.purple,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(
            color: FSColors.purple,
          ),
          iconTheme: IconThemeData(
            color: FSColors.purple,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Montserrat',
            color: FSColors.purple,
            fontSize: 16,
            fontStyle: FontStyle.normal,
          ),
          displayLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 30,
            color: FSColors.purple,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: FSColors.purple,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
            color: FSColors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        hintColor: FSColors.purple,
        shadowColor: FSColors.purple,
        focusColor: FSColors.purple,
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: FSColors.purple,
          labelStyle: TextStyle(
            color: FSColors.purple,
          ),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          iconColor: FSColors.purple,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: FSColors.purple,
            shadowColor: FSColors.purple,
            side: const BorderSide(
              color: FSColors.purple,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: FSColors.purple,
        ),
        iconTheme: const IconThemeData(
          color: FSColors.purple,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: FSColors.purple,
        ),
      ),
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: const [
        // Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      initialRoute: '/',
      getPages: routes,
    );
  }
}
