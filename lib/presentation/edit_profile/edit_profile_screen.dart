import 'package:flutter/material.dart';
import 'package:skakone/presentation/edit_profile/widgets/edit_profile_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFCA4842),
        title: const Text(
            'Edit Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image
            SizedBox(height: 40,),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/person.jpg"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFCA4842),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                        Icons.camera_alt, size: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Full Name Field
            const SizedBox(height: 8),
            EditProfileWidgets.buildTextField(
              label: "Full Name",
              hint: "Abrahamfs",
              icon: Icons.person_outline_sharp,
            ),

            // const SizedBox(height: 20),

            // Email Field
            const SizedBox(height: 8),
            EditProfileWidgets.buildTextField(
              label: "Email",
              hint: "ndsjdn@gmail.com",
              icon: Icons.email_outlined,
            ),

            // const SizedBox(height: 20),

            // Phone Number
            const SizedBox(height: 8),
            EditProfileWidgets.buildTextField(
              label: "Phone No",
              hint: "+1 23345567",
              icon: Icons.call,
            ),

            // const SizedBox(height: 20),

            // Password

            const SizedBox(height: 8),
            EditProfileWidgets.buildTextField(
              label: "Password",
              hint: "*******",
              icon: Icons.password,
            ),

            const SizedBox(height: 30),

            // Edit Profile Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFCA4842),
                    padding: const EdgeInsets.symmetric(vertical: 14,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                      "Edit Profile", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Join date & delete
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Joined 31 October 2022",
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade700,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                        "Delete", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}