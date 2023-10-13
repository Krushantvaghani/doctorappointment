import 'package:doctorappointment/common/assets/index.dart';
import 'package:doctorappointment/config.dart';
import 'package:doctorappointment/controllers/common/app_controller.dart';
import 'package:doctorappointment/controllers/home_controller.dart';
import 'package:doctorappointment/models/time_slot_class.dart';
import 'package:doctorappointment/views/widgets/dialogbox/conform_dialogbox.dart';
import 'package:flutter/material.dart';

class TimeSlot extends StatefulWidget {
  TimeSlot({Key? key}) : super(key: key);

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());
  var homeCtrl = Get.put(HomeController());

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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Available Slot",
                    style: AppCss.h2.textColor(appCtrl.appTheme.primaryText).size(20),
                  ),
                  Image.asset(
                    iconAssets.arrowUp,
                    height: 20,
                    width: 20,
                  ),
                ],
              ),
              VSpace(10),
              Container(
                height: 200,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                  ),
                  padding: EdgeInsets.all(8.0),
                  itemCount: homeCtrl.timeSlots.length,
                  itemBuilder: (BuildContext context, int index) {
                    TimeSlotData slot = homeCtrl.timeSlots[index];
                    return GestureDetector(
                      onTap: () {
                        slot.isSelected = !slot.isSelected;
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return ConformDialogBox();
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: slot.isSelected ? appCtrl.appTheme.primary : appCtrl.appTheme.secondary.withAlpha(90),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: slot.starDate, // Start time
                            style: AppCss.paragraphMedium.textColor(
                              slot.isSelected ? appCtrl.appTheme.white : appCtrl.appTheme.primaryText,
                            ),
                            children: [
                              TextSpan(
                                text: ' - ', // Add the dash between start and end times
                                style: AppCss.paragraphMedium.textColor(
                                  slot.isSelected ? appCtrl.appTheme.white : appCtrl.appTheme.primaryText,
                                ),
                              ),
                              TextSpan(
                                text: slot.endDate, // End time
                                style: AppCss.paragraphMedium.textColor(
                                  slot.isSelected ? appCtrl.appTheme.white : appCtrl.appTheme.primaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
