import 'package:flutter/material.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';

class Statistiques extends StatefulWidget {
  const Statistiques({super.key});

  @override
  State<Statistiques> createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 14,
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Calendrier',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Statistiques',
                  style: kBold,
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(width: double.infinity, decoration: kBoxFill),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
