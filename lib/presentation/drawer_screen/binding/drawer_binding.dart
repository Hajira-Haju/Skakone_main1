import 'package:get/get.dart';
import 'package:skakone/presentation/drawer_screen/controller/drawer_controller.dart';

class DrawerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DrawersController());
    // TODO: implement dependencies
  }
}