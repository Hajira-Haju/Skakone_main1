import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skakone/presentation/edit_profile/edit_profile_screen.dart';


import 'models/profile_model.dart'; // Import the model + list

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCA4842),
        elevation: 0,
        centerTitle: true,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/person.jpg"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color(0xFFCA4842),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, size: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Text(
              "Johndoe@gmail.com",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCA4842),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  Get.to(EditProfileScreen());
                },
                child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: settingsItems.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Divider(height: 1, color: Colors.grey.shade100);
                  }

                  final item = settingsItems[index - 1];

                  if (item.isDivider) {
                    return Divider(height: 9, color: Colors.grey.shade200);
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 10, right: 14),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFFCA4842),
                        child: Image.asset(
                          item.iconPath,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(item.title, style: const TextStyle(color: Colors.black)),
                      trailing: item.isLogout
                          ? null
                          : CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.red.shade50,
                        child: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 16),
                      ),
                      onTap: item.onTap,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
