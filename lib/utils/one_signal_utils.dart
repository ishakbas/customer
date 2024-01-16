import 'package:myservice_customer/main.dart';
import 'package:myservice_customer/utils/model_keys.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../screens/auth/auth_user_services.dart';
import 'constant.dart';

bool isOneSignalInitialize = false;

Future<void> initializeOneSignal() async {
  OneSignal.initialize(getStringAsync(ONESIGNAL_API_KEY));
  Future.delayed(const Duration(seconds: 5), () {
    OneSignal.User.pushSubscription.optIn();

    isOneSignalInitialize = true;

    saveOneSignalPlayerId();
  });
}

Future<void> saveOneSignalPlayerId() async {
  if (appStore.isLoggedIn) {
    await OneSignal.login(appStore.userId.validate().toString()).then((value) {
      OneSignal.User.addTagWithKey(ONESIGNAL_TAG_KEY, ONESIGNAL_TAG_VALUE);
      OneSignal.User.addTagWithKey(UserKeys.email, appStore.userEmail);

      if (OneSignal.User.pushSubscription.id.validate().isNotEmpty) {
        appStore.setPlayerId(OneSignal.User.pushSubscription.id.validate());
        updatePlayerId(playerId: OneSignal.User.pushSubscription.id.validate());
      }
    }).catchError((e) {
      log('Error saving subscription id - $e');
    });
  }
}
