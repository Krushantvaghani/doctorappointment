import 'package:flutter/material.dart';
import 'package:doctorappointment/config.dart';

class ChangeTheme extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return AppComponent(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page 2"),
          actions: [
            TextButton(
              onPressed: () {
                ThemeService().switchTheme();
              },
              child: Text(
                "Change",
                style: AppCss.h2.textColor(appCtrl.appTheme.darkGray),
                //style: AppCss.h2.textColor(context.theme.secondaryHeaderColor),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              "Hii from page 2",
              style: AppCss.h2.textColor(appCtrl.appTheme.primaryText),
            ),
          ],
        ).paddingAll(Insets.i24),
      ),
    );
  }
}
