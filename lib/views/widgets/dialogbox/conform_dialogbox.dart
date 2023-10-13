import 'package:doctorappointment/common/assets/index.dart';
import 'package:doctorappointment/views/widgets/dialogbox/thankyou_dialogbox.dart';
import 'package:doctorappointment/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class ConformDialogBox extends StatefulWidget {
  const ConformDialogBox({super.key});

  @override
  State<ConformDialogBox> createState() => _ConformDialogBoxState();
}

class _ConformDialogBoxState extends State<ConformDialogBox> {
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
                imageAssets.questionMark,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              VSpace(20),
              Text(
                "Is conform your ",
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
                      text: 'appointment ?', // End time
                      style: AppCss.paragraphSemiBold.textColor(appCtrl.appTheme.primaryText).size(20),
                    )
                  ],
                ),
              ),
              VSpace(12),
              Text(
                "Lorem ipsum is simply dummy text used in the printing and typesetting industry.",
                style: AppCss.body1.textColor(appCtrl.appTheme.secondaryText),
                textAlign: TextAlign.center,
              ),
              VSpace(20),
              CustomButton(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                width: 180,
                title: "Yes",
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
              VSpace(20),
              CustomButton(
                border: Border.all(color: appCtrl.appTheme.primary),
                color: appCtrl.appTheme.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                width: 180,
                title: "Edit slot",
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
