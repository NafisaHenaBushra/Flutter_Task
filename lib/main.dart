import 'package:flutter_task/utils/constants/imports.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* info:: hive initialization
  await Hive.initFlutter();
  var directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  
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
