import 'package:doctorappointment/common/assets/index.dart';
import 'package:doctorappointment/models/doctor_class.dart';
import 'package:doctorappointment/views/widgets/time_slot.dart';
import 'package:doctorappointment/widgets/common/custom_button.dart';
import 'package:flutter/material.dart';

import '../../config.dart';

class DoctorCard extends StatelessWidget {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());
  final Doctor doctor;

  DoctorCard({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
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
                  doctor.name,
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
                        doctor.rating.toStringAsFixed(1),
                        style: AppCss.h3.textColor(appCtrl.appTheme.secondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            VSpace(10),
            Text(
              doctor.profession,
              style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.secondaryText).size(17),
            ),
            VSpace(10),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: 170,
                title: "Available Slot",
                style: AppCss.paragraphMedium.textColor(appCtrl.appTheme.white),
                icon: Image.asset(iconAssets.downArrow, width: 17, height: 17),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return TimeSlot();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
