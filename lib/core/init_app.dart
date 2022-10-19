import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import '../service_locator.dart';
import 'app_observer.dart';
import 'network/dio_client.dart';

class InitializeApp {
  static Future run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setup();
    DioClient.instanceDio();
    BlocOverrides.runZoned(() => SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        ).then((value) => runApp(const App())),
      blocObserver: AppObserver(),
    );
  }
}
