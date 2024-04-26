import 'package:clean_folder_str/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'typography/text_styles.dart';

class MyAppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: MyAppColors.primarycolordark,
      brightness: Brightness.dark,
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: MyAppColors.primarycolor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: MyAppColors.primarycolor,
      ).copyWith(
        background: MyAppColors.backgroundColor,
      ),
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: _textTheme,
      appBarTheme: _lightAppBarTheme,
      iconTheme: const IconThemeData(
        color: MyAppColors.primarycolor,
      ),
      // icon
      textButtonTheme: _lightTextButtonTheme,
      listTileTheme: _lightListTileTheme,
      tabBarTheme: _lightTabBarTheme,
      floatingActionButtonTheme: _lightFloatingActionButtonTheme,
      bottomAppBarTheme: _lightBottomAppBarTheme,
      elevatedButtonTheme: _lightElevatedButtonTheme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        prefixIconColor: MyAppColors.primarycolor,
        suffixIconColor: MyAppColors.primarycolor,
        fillColor: MyAppColors.backgroundColor,
        filled: false,
        // suffixIcon: (suffixIcon != null) ? suffixIcon : null,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: MyAppColors.primarycolor,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: MyAppColors.primarycolor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: MyAppColors.primarycolor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        errorStyle: const TextStyle(fontSize: 12, color: Colors.redAccent),
        hintStyle: _textTheme.bodySmall?.copyWith(
          color: MyAppColors.textcolor,
        ),
        labelStyle: _textTheme.bodySmall?.copyWith(
          color: MyAppColors.textcolor,
        ),
      ),
    );
  }

  static AppBarTheme get _lightAppBarTheme {
    return const AppBarTheme().copyWith(
      // surfaceTintColor: Colors.transparent,
      backgroundColor: MyAppColors.primarycolor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: const TextStyle(
        color: MyAppColors.textcolordark,
        fontWeight: FontWeight.w800,
        fontSize: 22,
      ),
      actionsIconTheme: const IconThemeData(
        color: MyAppColors.textcolor,
      ),

      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyAppColors.primarycolordark,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: MyAppTextStyle.headline1,
      displayMedium: MyAppTextStyle.headline2,
      displaySmall: MyAppTextStyle.headline3,
      headlineMedium: MyAppTextStyle.headline4,
      headlineSmall: MyAppTextStyle.headline5,
      titleLarge: MyAppTextStyle.headline6,
      titleMedium: MyAppTextStyle.subtitle1,
      titleSmall: MyAppTextStyle.subtitle2,
      bodyLarge: MyAppTextStyle.bodyText1,
      bodyMedium: MyAppTextStyle.bodyText2,
      bodySmall: MyAppTextStyle.caption,
      labelSmall: MyAppTextStyle.overline,
      labelLarge: MyAppTextStyle.button,
    );
  }

  static TextButtonThemeData get _lightTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge,
      ),
    );
  }

  static ListTileThemeData get _lightListTileTheme {
    return ListTileThemeData(
      tileColor: MyAppColors.whiteColor,
      titleTextStyle: _textTheme.titleMedium?.copyWith(
        color: MyAppColors.textcolor,
      ),
      subtitleTextStyle: _textTheme.bodySmall?.copyWith(
        color: MyAppColors.secondaryTextcolor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static TabBarTheme get _lightTabBarTheme {
    return TabBarTheme(
      labelStyle: _textTheme.bodySmall?.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: _textTheme.bodySmall?.copyWith(fontSize: 11),
      labelColor: MyAppColors.primarycolor,
      indicatorColor: MyAppColors.primarycolor,
    );
  }

  static FloatingActionButtonThemeData get _lightFloatingActionButtonTheme {
    return const FloatingActionButtonThemeData(
      backgroundColor: MyAppColors.primarycolor,
      foregroundColor: MyAppColors.backgroundColor,
    );
  }

  static BottomAppBarTheme get _lightBottomAppBarTheme {
    return const BottomAppBarTheme(
      color: MyAppColors.whiteColor,
      elevation: 50,
    );
  }

  static ElevatedButtonThemeData get _lightElevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: MyAppColors.primarycolor,
        foregroundColor: MyAppColors.backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: _textTheme.labelLarge?.copyWith(
          color: MyAppColors.backgroundColor,
        ),
        splashFactory: InkRipple.splashFactory,
      ),
    );
  }
}


  // static AppBarTheme get _darkAppBarTheme {
  //   return AppBarTheme(
  //     surfaceTintColor: Colors.transparent,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     scrolledUnderElevation: 0,
  //     titleTextStyle: TextStyle(
  //       color: MyAppColors.textcolordark,
  //       fontWeight: FontWeight.w800,
  //       fontSize: 22,
  //     ),
  //     actionsIconTheme: IconThemeData(
  //       color: MyAppColors.textcolordark,
  //     ),
  //   );
  // }

// static ElevatedButtonThemeData get _evatedButtonTheme {
//     return ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: MyAppColors.primarycolor,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         textStyle: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 17,
//         ),
//         splashFactory: InkRipple.splashFactory,
//       ),
//     );
//   }






// ThemeData lightTheme = ThemeData(
//   scaffoldBackgroundColor: MyAppColors.backgroundColor,
//   primaryColor: MyAppColors.primarycolor,
//   brightness: Brightness.light,
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: MyAppColors.primarycolor,
//       textStyle: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 17,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       splashFactory: InkRipple.splashFactory,
//     ),
//   ),
//   expansionTileTheme: const ExpansionTileThemeData(
//     shape: RoundedRectangleBorder(
//       side: BorderSide(color: Colors.transparent),
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     iconColor: MyAppColors.primarycolor,
//     enabledBorder: inputBorder(Colors.transparent),
//     border: inputBorder(Colors.transparent),
//     focusedBorder: inputBorder(MyAppColors.primarycolor),
//     focusedErrorBorder: inputBorder(Colors.red),
//     errorBorder: inputBorder(Colors.red),
//     prefixIconColor: MyAppColors.primarycolor,
//     suffixIconColor: MyAppColors.primarycolor,
//     fillColor: Colors.grey.withOpacity(0.1),
//     filled: true,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: MyAppColors.primarycolor,
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     surfaceTintColor: Colors.transparent,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       color: MyAppColors.textcolor,
//       fontWeight: FontWeight.w800,
//       fontSize: 22,
//     ),
//     actionsIconTheme: IconThemeData(
//       color: MyAppColors.textcolor,
//     ),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       // Status bar color
//       statusBarColor: Colors.red,

//       statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//       statusBarBrightness: Brightness.light, // For iOS (dark icons)
//     ),
//   ),
//   radioTheme: RadioThemeData(
//     fillColor: MaterialStatePropertyAll(MyAppColors.primarycolor),
//     overlayColor: MaterialStatePropertyAll(MyAppColors.primarycolor),
//   ),
//   navigationBarTheme: const NavigationBarThemeData(
//     backgroundColor: Colors.white,
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     selectedItemColor: MyAppColors.primarycolor,
//   ),
//   cardTheme: const CardTheme(
//     color: Colors.white,
//     surfaceTintColor: Colors.transparent,
//   ),
// // searchBarTheme: const SearchBarThemeData(
// //   side: MaterialStatePropertyAll(BorderSide.none),
// //   backgroundColor: MaterialStatePropertyAll(Colors.red),
// // ),
//   useMaterial3: true,
// );

// OutlineInputBorder inputBorder(Color color) {
//   return OutlineInputBorder(
//     borderSide: BorderSide(
//       color: color,
//       width: 2,
//     ),
//     borderRadius: BorderRadius.circular(16),
//   );
// }

// ThemeData darkTheme = ThemeData(
//   scaffoldBackgroundColor: const Color(0xff202124),
//   primaryColor: MyAppColors.primarycolordark,
//   brightness: Brightness.dark,
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: MyAppColors.primarycolor,
//       textStyle: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 17,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//     ),
//   ),
//   appBarTheme: AppBarTheme(
//     surfaceTintColor: Colors.transparent,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     scrolledUnderElevation: 0,
//     titleTextStyle: TextStyle(
//       color: MyAppColors.textcolordark,
//       fontWeight: FontWeight.w800,
//       fontSize: 22,
//     ),
//     actionsIconTheme: IconThemeData(
//       color: MyAppColors.textcolordark,
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     iconColor: MyAppColors.primarycolor,
//     enabledBorder: inputBorder(Colors.transparent),
//     border: inputBorder(Colors.transparent),
//     focusedBorder: inputBorder(MyAppColors.primarycolor),
//     focusedErrorBorder: inputBorder(Colors.red),
//     errorBorder: inputBorder(Colors.red),
//     prefixIconColor: MyAppColors.primarycolor,
//     suffixIconColor: MyAppColors.primarycolor,
//     fillColor: Colors.grey.withOpacity(0.1),
//     filled: true,
//   ),
//   textButtonTheme: TextButtonThemeData(
//     style: TextButton.styleFrom(
//       foregroundColor: MyAppColors.primarycolor,
//     ),
//   ),
//   cardTheme: const CardTheme(
//     color: Color(0xff424242),
//   ),
//   useMaterial3: true,
// );
