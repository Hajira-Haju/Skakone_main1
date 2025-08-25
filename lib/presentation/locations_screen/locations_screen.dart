import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skakone/presentation/locations_screen/widgets/location_widgets.dart';

import '../../core/constants/const_data.dart';
import 'controller/location_controller.dart';

class LocationsScreen extends StatelessWidget {
  final LocationsController controller = Get.put(LocationsController());

  LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstData.prmClr,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Team Locations',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.locations.isEmpty) {
                return const Center(child: Text("No locations available"));
              }
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.locations.length,
                itemBuilder: (context, index) {
                  final item = controller.locations[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        item['team'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['location'] ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Get.to(
                                    () => TeamLocationDetailPage(
                                  teamName: item['team'] ?? '',
                                  location: item['location'] ?? '',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
