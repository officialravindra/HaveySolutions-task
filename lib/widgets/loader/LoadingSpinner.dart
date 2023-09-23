import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../../utils/AppColors.dart';

/*-------------------------------------------------------------------------------------------------------*/
// This widget will show custom loader used in app..
/*-------------------------------------------------------------------------------------------------------*/
class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SpinKitThreeBounce(
          size: 35,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: index.isEven ? AppColors.white : AppColors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
