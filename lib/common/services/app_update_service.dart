// import 'dart:io';
//
// import 'package:doctorappointment/config.dart';
//
// class AppUpdateService {
//   init() {
//     updateAlert();
//   }
//
//   updateAlert() async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     String version1 = packageInfo.version;
//     String platformType = Platform.isAndroid ? 'android' : 'ios';
//
//     await apis.call(apiMethods.appVersion(platformType), null, ApiType.get).then((resData) async {
//       if (resData.isSuccess == true) {
//         String version2 = resData.data['application_version_code'];
//         String version3 = resData.data['application_minimum_version_code'];
//         bool forceUpdate = resData.data['force_update'];
//         String description = resData.data['description'];
//
//         Version currentVersion = Version.parse(version1); //new Version(1, 0, 3);
//         Version latestVersion = Version.parse(version2);
//         Version minimumVersion = Version.parse(version3);
//         if (minimumVersion > currentVersion) {
//           appUpdateDialog(description, forceUpdate: true, onCancel: cancelAppUpdateDialog, onConfirm: confirmAppUpdate);
//         } else if (latestVersion > currentVersion) {
//           appUpdateDialog(description,
//               forceUpdate: forceUpdate, onCancel: cancelAppUpdateDialog, onConfirm: confirmAppUpdate);
//         }
//       }
//     });
//   }
//
//   cancelAppUpdateDialog() {
//     Get.back();
//   }
//
//   confirmAppUpdate() async {
//     var playStoreURL = environment['serverConfig']['playStoreURL'];
//     var appStoreURL = environment['serverConfig']['apiVersion'];
//     // if (Platform.isAndroid) {
//     //   await launch(playStoreURL);
//     // } else {
//     //   await launch(appStoreURL);
//     // }
//   }
// }
