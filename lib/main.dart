import 'package:flutter_task/utils/constants/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* status bar theme
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //* app theme
        theme: ThemeData(
          shadowColor: cWhiteColor,
          scaffoldBackgroundColor: cPurpleBGP10Color,
          fontFamily: ksPoppins,
          inputDecorationTheme: const InputDecorationTheme(),
        ),
        initialRoute: krHomeScreen,
        getPages: routes,
        initialBinding: BinderController(),
        defaultTransition: Transition.rightToLeft,
      ),
    );
  }
}
