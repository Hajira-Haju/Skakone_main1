import 'package:flutter/material.dart';
import 'package:skakone/presentation/my_leaves/widget/my_leaves_widget.dart';

import '../../core/constants/const_data.dart';



class MyLeaves extends StatelessWidget {
  const MyLeaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My LEAVES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              // Padding(padding: EdgeInsets.all(12)),
              MyLeavesWidgets.leaveList(),
            ],
          ),
        ),
      ),
    );
  }
}