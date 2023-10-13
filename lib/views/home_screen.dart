import 'package:doctorappointment/common/assets/index.dart';
import 'package:doctorappointment/config.dart';
import 'package:doctorappointment/controllers/home_controller.dart';
import 'package:doctorappointment/views/widgets/dialogbox/date_time_dialogbox.dart';
import 'package:doctorappointment/views/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());
  var homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<HomeController>(builder: (_) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      iconAssets.burger,
                      height: 35,
                      width: 35,
                      fit: BoxFit.cover,
                    ),
                    InkWell(
                      onTap: () {
                        homeCtrl.navigationBookingHistory();
                      },
                      child: Image.asset(
                        iconAssets.appointment,
                        height: 35,
                        width: 35,
                        fit: BoxFit.cover,
                      ),
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
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return DateTimeDialogBox();
                                },
                              );
                            },
                            child: Image.asset(
                              iconAssets.appointment,
                              height: 35,
                              width: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                          HSpace(15),
                          Text(
                            "2, October, 2023",
                            style: AppCss.h2.textColor(appCtrl.appTheme.primaryText),
                          ),
                        ],
                      ),
                      VSpace(25),
                      Expanded(
                        child: ListView.builder(
                          itemCount: homeCtrl.doctorList.length,
                          itemBuilder: (context, index) {
                            final doctor = homeCtrl.doctorList[index];
                            return DoctorCard(doctor: doctor);
                          },
                        ),
                      ),
                      // TimeSlot(),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
