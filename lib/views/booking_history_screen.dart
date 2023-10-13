import 'package:doctorappointment/common/assets/index.dart';
import 'package:doctorappointment/controllers/booking_historycontroller.dart';
import 'package:doctorappointment/views/widgets/dialogbox/cancel_dialogbox.dart';
import 'package:doctorappointment/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../controllers/common/app_controller.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());
  var bookingHistoryCtrl = Get.put(BookingHistoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<BookingHistoryController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: appCtrl.appTheme.border),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        iconAssets.navigationBack,
                        height: 35,
                        width: 35,
                        fit: BoxFit.cover,
                      ),
                    ),
                    HSpace(15),
                    Text(
                      "Booking History",
                      style: AppCss.h3.textColor(appCtrl.appTheme.primaryText).size(18),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Tomorrow",
                            style: AppCss.paragraphSemiBold.textColor(appCtrl.appTheme.primaryText),
                          ),
                        ],
                      ),
                      VSpace(10),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: appCtrl.appTheme.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Dr.Smith Mathew',
                                  style: AppCss.h2.textColor(appCtrl.appTheme.primaryText).size(20),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: appCtrl.appTheme.orange,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6, right: 0, bottom: 0, left: 3),
                                      child: Text(
                                        "4.8",
                                        style: AppCss.h3.textColor(appCtrl.appTheme.secondary),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VSpace(10),
                            Text(
                              "Cardiologist",
                              style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.secondaryText).size(17),
                            ),
                            VSpace(10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: '9:00', // Start time
                                    style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.primary),
                                    children: [
                                      TextSpan(
                                        text: ' - ', // Add the dash between start and end times
                                        style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.primary),
                                      ),
                                      TextSpan(
                                        text: '11:30 AM', // End time
                                        style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CustomButton(
                                    color: appCtrl.appTheme.error,
                                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                                    width: 150,
                                    title: "Cancel Slot",
                                    style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.white),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return CancelDialogBox();
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
