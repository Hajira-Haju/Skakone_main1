import 'package:flutter/material.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/acc_info/widgets/acc_info_widgets.dart';


class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // go back
          },
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: Text('John Doe',style: TextStyle(fontSize: 30),)),
                      // Profile Image
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/person.jpg'),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFCA4842),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Profile fields
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            AccInfoWidgets.profileTile('EMPLOYEE ID', Icons.tag, '12345'),
                            AccInfoWidgets.profileTile('WORK MOBILE NO.', Icons.call, '+1 234 567'),
                            AccInfoWidgets.profileTile('EMAIL', Icons.email_outlined, 'annadesign@gmail.com'),
                            AccInfoWidgets.profileTile('DEPARTMENT', Icons.category_outlined, 'Human Resources'),
                            AccInfoWidgets.profileTile('DESIGNATION', Icons.person_outline_sharp, 'Manager'),
                            AccInfoWidgets.profileTile('TEAM', Icons.group_add, 'Recruitment', isLast: true),
                          ],
                        ),
                      ),

                      // const Spacer(), // Pushes button to bottom if space available
                      SizedBox(height: 40,),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}