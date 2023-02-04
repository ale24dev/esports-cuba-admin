import 'package:esports_cuba_admin/resources/general_styles.dart';
import 'package:esports_cuba_admin/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              width: 20.w,
              color: GStyles.backGroundDarkColor,
              child: Text(context.loc.appTitle),
            ),
            Container(
              width: 80.w,
              color: GStyles.containerDarkColor,
            ),
          ],
        ),
      ),
    );
  }
}
