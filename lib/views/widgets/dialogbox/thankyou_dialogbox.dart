import 'package:doctorappointment/common/assets/index.dart';
import 'package:doctorappointment/config.dart';
import 'package:doctorappointment/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../common/theme/index.dart';

class ThankYouDialogBox extends StatefulWidget {
  const ThankYouDialogBox({super.key});

  @override
  State<ThankYouDialogBox> createState() => _ThankYouDialogBoxState();
}

class _ThankYouDialogBoxState extends State<ThankYouDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
      insetPadding: EdgeInsets.all(15),
    );
  }

  contentBox(context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                imageAssets.thankYou,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              VSpace(20),
              Text(
                "Thank You !",
                style: AppCss.paragraphSemiBold.textColor(appCtrl.appTheme.primaryText).size(20),
              ),
              VSpace(16),
              Text(
                "Your Appointment Successful",
                style: AppCss.paragraphSemiBold.textColor(appCtrl.appTheme.primaryText),
              ),
              VSpace(12),
              Text(
                "Your booked on appointment with Dr \n. smith Mothew on October 3, \n 3.30 - 10.00 Am",
                style: AppCss.body1.textColor(appCtrl.appTheme.secondaryText),
                textAlign: TextAlign.center,
              ),
              VSpace(20),
              CustomButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                width: 200,
                title: "Done",
                style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.white),
                onTap: () {
                  Navigator.pop(Get.context!);
                },
              ),
              VSpace(16),
              CustomButton(
                border: Border.all(color: appCtrl.appTheme.primary),
                color: appCtrl.appTheme.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                width: 200,
                title: "Go To Home",
                style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.primary),
                onTap: () {
                  Get.toNamed(routeName.home);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
