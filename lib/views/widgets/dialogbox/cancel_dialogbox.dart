import 'package:doctorappointment/views/widgets/dialogbox/thankyou_dialogbox.dart';
import 'package:doctorappointment/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../common/assets/index.dart';
import '../../../config.dart';

class CancelDialogBox extends StatefulWidget {
  const CancelDialogBox({super.key});

  @override
  State<CancelDialogBox> createState() => _CancelDialogBoxState();
}

class _CancelDialogBoxState extends State<CancelDialogBox> {
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
                imageAssets.closeImages,
                height: 80,
                fit: BoxFit.cover,
              ),
              VSpace(30),
              Text(
                "Do you want to cancel your",
                style: AppCss.paragraphSemiBold.textColor(appCtrl.appTheme.primaryText).size(20),
              ),
              VSpace(5),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '9:30 - 10:00 am ',
                  style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.primary),
                  children: [
                    TextSpan(
                      text: 'appointment ?', // Add the dash between start and end times
                      style: AppCss.paragraphSemiBold.textColor(appCtrl.appTheme.primaryText).size(20),
                    ),
                  ],
                ),
              ),
              VSpace(16),
              Text(
                "Lorem ipsum is simply dummy text used in the printing and typesetting industry.",
                style: AppCss.body1.textColor(appCtrl.appTheme.secondaryText),
                textAlign: TextAlign.center,
              ),
              VSpace(20),
              CustomButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                width: 180,
                title: "Yes Cancel",
                style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.white),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return ThankYouDialogBox();
                    },
                  );
                },
              ),
              VSpace(16),
              CustomButton(
                border: Border.all(color: appCtrl.appTheme.primary),
                color: appCtrl.appTheme.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                width: 180,
                title: "No",
                style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.primary),
                onTap: () {
                  Navigator.pop(Get.context!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
