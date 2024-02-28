import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/pages/dashboard/dashboard.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';

import '../controllers/create_new_game_controller.dart';

class Election extends StatefulWidget {
  const Election({super.key});

  @override
  State<Election> createState() => _ElectionState();
}

class _ElectionState extends State<Election> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/election.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(CreateNewGameController
                            .to
                            .countries[CreateNewGameController
                                .to.selectedCountryIndex.value]
                            .flag_img_path),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Élection présidentielle',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 270,
                        width: 270,
                        decoration: BoxDecoration(
                          color: Color(0xff0F2140),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Text(
                                '${CreateNewGameController.to.prenom.value.text} ${CreateNewGameController.to.name.value.text}',
                                style: kP6),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              child: Image.asset(
                                CreateNewGameController.to.imageUrl.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 270,
                        width: 570,
                        decoration: BoxDecoration(
                          color: Color(0xffBFD6FF),
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              height: 270,
                              width: (570 / 100) *
                                  (DashboardController.to.election[0]
                                          .result_person_me)
                                      .toDouble(),
                              decoration: BoxDecoration(
                                color: Color(0xff19BE99),
                              ),
                            ),
                            Center(
                              child: Text(
                                '${DashboardController.to.election[0].result_person_me}%',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 270,
                        width: 270,
                        decoration: BoxDecoration(
                          color: Color(0xff0F2140),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Text(
                                '${CreateNewGameController.to.randomCandidatePerson.value['person'].first_name} ${CreateNewGameController.to.randomCandidatePerson.value['person'].last_name}',
                                style: kP6),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              child: Image.asset(
                                CreateNewGameController.to.randomCandidatePerson
                                    .value['person'].image_path,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 270,
                        width: 570,
                        decoration: BoxDecoration(
                          color: Color(0xffBFD6FF),
                        ),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              height: 270,
                              width: (570 / 100) *
                                  (DashboardController.to.election[0]
                                          .result_person_opponent)
                                      .toDouble(),
                              decoration: BoxDecoration(
                                color: Colors.red.shade400,
                              ),
                            ),
                            Center(
                              child: Text(
                                '${DashboardController.to.election[0].result_person_opponent}%',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ));
                        },
                        child: const Text('Commencer'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
