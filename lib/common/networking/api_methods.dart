import 'package:doctorappointment/env.dart';

var apiVersion = environment['serverConfig']['apiVersion'];

class ApiMethods {
  // Check app version
  String appVersion(type) => "$apiVersion/application-information/$type";

  final String login = "v3/login";
  final String offers = "v3/offers";
  final String magicLink = "v3/login/magiclink/from/app";
  final String magicLinkVerify = "v3/login/magiclink";
}
