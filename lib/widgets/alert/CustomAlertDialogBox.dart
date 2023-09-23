
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/AppStrings.dart';

/*-------------------------------------------------------------------------------------------------------*/
// This screen show custom dialog in app..
/*-------------------------------------------------------------------------------------------------------*/
class CustomAlertDialougeBox extends StatefulWidget {
  final String title, descriptions, positiveBtnText, negativeBtnText;
  final Function onPositiveBtnPress;

  CustomAlertDialougeBox(
      {this.title = AppStrings.app_name,
        this.descriptions = '',
        this.positiveBtnText = '',
        this.negativeBtnText = '',
        required this.onPositiveBtnPress});

  @override
  _CustomAlertDialougeBox createState() => _CustomAlertDialougeBox();
}

class _CustomAlertDialougeBox extends State<CustomAlertDialougeBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),

      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),

    );
  }

  contentBox(context) {

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,

            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 55,

                  decoration: new BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Text(widget.title,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Celias'))),
              SizedBox(
                height: 15,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15,top: 30),
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: new BoxDecoration(),
                  child: Text(
                    widget.descriptions,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 22,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: new BoxDecoration(),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        if (widget.onPositiveBtnPress != null) {
                          widget.onPositiveBtnPress();
                        }
                      },
                      child: Text(
                        widget.positiveBtnText,
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Celias'),
                      )),
                  // TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text(
                  //       widget.negativeBtnText,
                  //       style: TextStyle(
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.w600,
                  //           color: AppColors.grey,
                  //           fontFamily: 'Celias'),
                  //     )),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
