
/*-------------------------------------------------------------------------------------------------------*/
// This screen show custom dialog in app..
/*-------------------------------------------------------------------------------------------------------*/
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/AppColors.dart';
import '../../utils/AppStrings.dart';

class CustomSimpleAlertDialougeBox extends StatefulWidget {
  final String descriptions;

  CustomSimpleAlertDialougeBox(
      {
        this.descriptions = '',

      });

  @override
  _CustomSimpleAlertDialougeBox createState() => _CustomSimpleAlertDialougeBox();
}

class _CustomSimpleAlertDialougeBox extends State<CustomSimpleAlertDialougeBox> {
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
                      color:AppColors.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Text(AppStrings.app_name,
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,

                    ),
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
                        Navigator.of(context).pop();

                      },
                      child: Text(
                        "Ok",
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
