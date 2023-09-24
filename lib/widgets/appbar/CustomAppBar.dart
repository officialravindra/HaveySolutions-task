import 'package:flutter/material.dart';
import 'package:harvery_solutions_task/utils/AppColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showLeadingIcon;
  final VoidCallback? onPressed;

  CustomAppBar({
    required this.title,
    required this.showLeadingIcon,
    this.onPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.grey,
      title: Text(title),
      leading: showLeadingIcon
          ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onPressed,
      )
          : null,
    );
  }
}
