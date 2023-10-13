import 'package:doctorappointment/common/theme/index.dart';
import 'package:doctorappointment/config.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color primaryText;
  Color secondaryText;
  Color primary;
  Color secondary;
  Color primaryDark;
  Color primaryLight;
  Color black;
  Color darkGray;
  // Color lightGray;
  Color border;
  Color borderGray;
  Color white;
  Color success;
  Color orange;
  Color error;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.primaryText,
    required this.secondaryText,
    required this.primary,
    required this.secondary,
    required this.primaryDark,
    required this.primaryLight,
    required this.black,
    required this.darkGray,
    // required this.lightGray,
    required this.border,
    required this.borderGray,
    required this.white,
    required this.success,
    required this.orange,
    required this.error,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          primaryText: const Color(0xFF202020),
          secondaryText: const Color(0xFF6D6D6D),
          primary: const Color(0xFF6063E9),
          secondary: const Color(0xFFD9D9D9),
          primaryDark: const Color(0xFF337ab7),
          primaryLight: const Color(0xFFE5F5FF),
          black: const Color(0xFF001928),
          darkGray: const Color(0xFF777777),
          // lightGray: const Color(0xFFf7f7f7),
          border: const Color(0xFFD8DADC),
          borderGray: const Color(0xFFE6E8EA),
          white: const Color(0xFFFFFFFF),
          success: const Color(0xFF27AE60),
          orange: const Color(0xFFffac33),
          error: const Color(0xFFD32F2F),
        );

      case ThemeType.dark:
        return AppTheme(
            isDark: true,
            primaryText: Colors.white,
            secondaryText: Colors.white,
            primary: const Color(0xFF6EBAE7),
            secondary: const Color(0xFFFFFFFF),
            primaryDark: const Color(0xFF337ab7),
            primaryLight: const Color(0xFF2B3D49),
            black: const Color(0xFFFFFFFF),
            darkGray: const Color(0xFF999999),
            // lightGray: const Color(0xFF212528),
            border: const Color(0xFF3A3A3A),
            borderGray: const Color(0xFF353C41),
            white: const Color(0xFF1A1E21),
            success: const Color(0xFF02A66B),
            orange: const Color(0xFFffac33),
            error: const Color(0xFFFF3333));
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: primary,
        background: white,
        surface: white,
        onBackground: black,
        onSurface: black,
        onError: black,
        onPrimary: black,
        onSecondary: black,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkboxTheme: CheckboxThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Insets.i5))),
      textTheme: TextTheme(
        headline1: TextStyle(color: appCtrl.appTheme.black),
        headline2: TextStyle(color: appCtrl.appTheme.black),
        headline3: TextStyle(color: appCtrl.appTheme.black),
        headline4: TextStyle(color: appCtrl.appTheme.black),
        headline5: TextStyle(color: appCtrl.appTheme.black),
        headline6: TextStyle(color: appCtrl.appTheme.black),
        bodyText1: TextStyle(color: appCtrl.appTheme.black),
        bodyText2: TextStyle(color: appCtrl.appTheme.black),
        subtitle1: TextStyle(color: appCtrl.appTheme.black),
        subtitle2: TextStyle(color: appCtrl.appTheme.black),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: border,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      appBarTheme: AppBarTheme(backgroundColor: white, elevation: 0, titleTextStyle: AppCss.h1.textColor(black)),
      scaffoldBackgroundColor: white,
      backgroundColor: white,
      highlightColor: Colors.transparent,
      toggleableActiveColor: primary,
    );
  }

  Color shift(Color c, double d) => shiftHsl(c, d * (isDark ? -1 : 1));
}
