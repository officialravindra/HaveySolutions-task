import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'ResourceUtils.dart';

/*-------------------------------------------------------------------------------------------------------*/
//This file is created to store theme details.
/*-------------------------------------------------------------------------------------------------------*/
class MyTheme {

  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.primary
          ),
          //fontFamily: GoogleFonts.poppins().fontFamily,
          appBarTheme: AppBarTheme(
              color: AppColors.primary,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.white), toolbarTextStyle: Theme
                  .of(context)
                  .textTheme.bodyText2, titleTextStyle: Theme
                  .of(context)
                  .textTheme.headline6
          )
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(
        brightness: Brightness.dark,
      );

}