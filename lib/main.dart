import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_ui_draft/main/screens/DashboardScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'main/store/AppStore.dart';
import 'main/utils/AppColors.dart';
import 'main/utils/AppConstants.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  appStore.toggleDarkMode(value: getBoolAsync(DarkModePref));
  appStore.setLoggedIn(getBoolAsync(IsLoggedInSocialLogin));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          fontFamily: GoogleFonts.poppins().fontFamily,
          accentColor: appPrimaryColor,
          indicatorColor: appPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(color: scaffoldSecondaryDark),
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(backgroundColor: Colors.white),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.white),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          accentColor: appPrimaryColor,
          indicatorColor: appPrimaryColor,
          scaffoldBackgroundColor: scaffoldColorDark,
          iconTheme: IconThemeData(color: Colors.white),
          dialogBackgroundColor: scaffoldColorDark,
          dialogTheme: DialogTheme(backgroundColor: scaffoldColorDark),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: scaffoldSecondaryDark),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        home: DashboardScreen(),
        builder: scrollBehaviour(),
      ),
    );
  }
}
