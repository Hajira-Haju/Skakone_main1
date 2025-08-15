import 'package:get/get.dart';
import '../../acc_info/acc_info.dart';


class ProfileItemModel {
  final String iconPath;
  final String title;
  final void Function()? onTap;
  final bool isLogout;
  final bool isDivider;

  ProfileItemModel({
    this.iconPath = '',
    this.title = '',
    this.onTap,
    this.isLogout = false,
    this.isDivider = false,
  });
}

final List<ProfileItemModel> settingsItems = [
  ProfileItemModel(
    iconPath: 'assets/settingg.png',
    title: 'Settings',
    onTap: () {},
  ),
  ProfileItemModel(
    iconPath: 'assets/info (1).png',
    title: 'Account Information',
    onTap: () => Get.to(AccountInfo()),
  ),
  ProfileItemModel(
    iconPath: 'assets/copilot.png',
    title: 'User Management',
    onTap: () {},
  ),
  ProfileItemModel(isDivider: true),
  ProfileItemModel(
    iconPath: 'assets/i.png',
    title: 'Information',
    onTap: () {},
  ),
  ProfileItemModel(
    iconPath: 'assets/logout (1).png',
    title: 'Logout',
    isLogout: true,
    onTap: () {},
  ),
];
