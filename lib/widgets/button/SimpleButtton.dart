import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/AppDimensions.dart';
import '../loader/LoadingSpinner.dart';

/*-------------------------------------------------------------------------------------------------------*/
// This widget will show simple button used in app..
/*-------------------------------------------------------------------------------------------------------*/
class SimpleButton extends StatelessWidget {
  final String label;
  final Function() onPressed;



  SimpleButton({
    required this.label,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onPressed,
      child: Container(
          width: MediaQuery.of(context).size.width - (2 * AppDimensions.screenPadding),
          height: AppDimensions.buttonHeight,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: AppDimensions.buttonFontSize,
              ),
            ),
          ),
      ),
    );
  }
}

