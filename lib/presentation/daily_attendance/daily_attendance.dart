import 'package:flutter/material.dart';
import 'package:skakone/core/constants/const_data.dart';
import 'package:skakone/presentation/daily_attendance/widgets/daily_attendance_widgets.dart';
import 'package:slide_to_act/slide_to_act.dart';

class DailyAttendance extends StatelessWidget {
  const DailyAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> checkInKey = GlobalKey();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Column(
              children: const [
                Text('Van VAN10',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text('TOTAL HOURS OF WORKING: 8'),
                Text('Status:',style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
              height: 50,
              width: 500,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ConstData.prmClr,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // shadow color
                    spreadRadius: 2, // how far the shadow spreads
                    blurRadius: 4, // softness of the shadow
                    offset: const Offset(2, 4), // horizontal & vertical movement
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '28-05-2025 Wednesday ',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  DailyAttendanceWidget(label: 'Check in time',value: '9:00 PM',),
                  SizedBox(width: 10),
                  DailyAttendanceWidget(label: 'Check out time',value: '6:00 PM',),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                const [
                  DailyAttendanceWidget(label: 'Shift IN',value: '12:00 PM',),
                  SizedBox(width: 10),
                  DailyAttendanceWidget(label: 'Shift OUT ',value: '3:00 PM',),
                ],
              ),
            ),
           Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SlideAction(
                key: checkInKey,
                text: "Swipe to Check In",
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                outerColor: ConstData.prmClr,
                innerColor: Colors.white,
                elevation: 4,
                height: 65,
                onSubmit: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✅ Checked In')),
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    checkInKey.currentState?.reset();
                  });
                },
              ),
            ),
            
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

