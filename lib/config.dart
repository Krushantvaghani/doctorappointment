import 'package:doctorappointment/controllers/common/app_controller.dart';
import 'package:get/get.dart';

export 'package:doctorappointment/app_extensions.dart';
export 'package:doctorappointment/common/config.dart';
export 'package:doctorappointment/common/constants.dart';
export 'package:doctorappointment/common/theme/index.dart';
export 'package:doctorappointment/common/language/index.dart';
export 'package:doctorappointment/controllers/common/app_controller.dart';
export 'package:doctorappointment/env.dart';
export 'package:doctorappointment/common/networking/index.dart';
export 'package:doctorappointment/common/routes/index.dart';
export 'package:doctorappointment/common/utilities/index.dart';
export 'package:doctorappointment/widgets/common/app_component.dart';
export 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

var appCtrl = Get.isRegistered<AppController>() ? Get.find<AppController>() : Get.put(AppController());
