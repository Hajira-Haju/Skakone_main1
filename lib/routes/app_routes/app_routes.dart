import 'package:get/get.dart';
import 'package:skakone/presentation/drawer_screen/binding/drawer_binding.dart';
import 'package:skakone/presentation/drawer_screen/drawer_screen.dart';
import 'package:skakone/presentation/home_screen/binding/home_binding.dart';
import 'package:skakone/presentation/home_screen/home_screen.dart';
import 'package:skakone/presentation/home_screen/widgets/home_widget.dart';
import 'package:skakone/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:skakone/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:skakone/presentation/splash_screen/binding/splash_binding.dart';
import 'package:skakone/presentation/splash_screen/splash_screen.dart';
import 'package:skakone/routes/page_list/page_list.dart';

class AppRoutes {
  static var pages = [
    GetPage(
      name: PageList.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: PageList.signInScreen,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: PageList.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PageList.drawerScreen,
      page: () => DrawerScreen(),
      binding: DrawerBinding(),
    ),
  ];
}
