import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:zresume/apis/auth.dart';
import 'package:zresume/global/constants/constants.dart';
import 'package:zresume/global/routes/routes.dart';

import 'package:zresume/global/theme/theme.dart';
import 'package:zresume/global/widgets/loading.dart';

import 'package:zresume/pages/home/view/home_view.dart';
import 'package:zresume/pages/unknown/unknown_route.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure the binding is initialized
  setPathUrlStrategy();
  await initFirebase();
//  await Firebase.initializeApp(
  //  options: firebaseConfig,
  //);

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Zresume",
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget!,
        background: Container(
          color: Colors.grey.shade50,
        ),

        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      theme: lightThemeDta,
      initialRoute: '/',
      unknownRoute: GetPage(name: '/error', page: () => const UnknownRoute()),
      getPages: getPages,
    );
  }
}

class AuthGate extends ConsumerWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(authStateChangeProvider).when(data: (snapshot) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (snapshot != null) {
          Get.offAndToNamed('/home');
        }
      });

      if (snapshot == null) {
        return const HomeAuthView();
      }

      // Render your application if authenticated
      return progressWidget(context);
    }, loading: () {
      return Container();
    }, error: (e, s) {
      throw (e);
    });
  }
}
