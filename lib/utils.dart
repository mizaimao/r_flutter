// Collection of utilities.
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

String getPlatformInfo() {
  String platformInfo = "unknown";
  if (kIsWeb) {
    platformInfo = "Web";
  } else if (Platform.isAndroid) {
    platformInfo = "Android";
  } else if (Platform.isFuchsia) {
    platformInfo = "Fuchsia";
  } else if (Platform.isIOS) {
    platformInfo = "iOS";
  } else if (Platform.isLinux) {
    platformInfo = "Linux";
  } else if (Platform.isMacOS) {
    platformInfo = "macOS";
  } else if (Platform.isWindows) {
    platformInfo = "Windows";
  }
  return platformInfo;
}
