import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:refrigerator_recipe_app/utils/shared_preferences.dart';
import 'package:uuid/uuid.dart';

Future<String> getDeviceUniqueId() async {
  var deviceIdentifier = 'unknown';
  final deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    var androidInfo = await deviceInfo.androidInfo;
    deviceIdentifier = androidInfo.model;
  } else if (Platform.isIOS) {
    var iosInfo = await deviceInfo.iosInfo;
    deviceIdentifier = iosInfo.utsname.machine!;
  } else if (Platform.isLinux) {
    var linuxInfo = await deviceInfo.linuxInfo;
    deviceIdentifier = linuxInfo.machineId!;
  } else if (kIsWeb) {
    var webInfo = await deviceInfo.webBrowserInfo;
    deviceIdentifier = webInfo.userAgent.toString();
  }

  return deviceIdentifier;
}

String testuniqueId = '';
//디버그 모드 테스트용 디바이스 ID
String getUniqueId() {
  var uuid = Uuid();
  return uuid.v4();
}

void deviceID() {
  testuniqueId = getUniqueId();
  saveData('androidDeviceID', testuniqueId);
  print(testuniqueId); // 출력 예시: d866b2be-e61c-4c47-b01e-eb62f2e9d07e
}
