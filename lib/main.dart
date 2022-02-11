import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';
import 'package:sistaz_share_web/firebase_config.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: FirebaseConfig.apiKey,
          appId: FirebaseConfig.appId,
          projectId: FirebaseConfig.projectId,
          messagingSenderId: FirebaseConfig.messagingSenderId,
        ),
      );
      runApp(const App());
    },
    (error, stackTrace) {
      return;
    },
  );
}
