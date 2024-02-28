// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/pages/programs.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/presidential_advisor_demands_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Conseiller extends StatefulWidget {
  const Conseiller({super.key});

  @override
  State<Conseiller> createState() => _ConseillerState();
}

class _ConseillerState extends State<Conseiller> {
  Color getColorForLevel(int level) {
    if (level == 1) {
      return Color(0xffF24261);
    } else if (level == 2) {
      return Color(0xffFFAF13);
    } else if (level == 3) {
      return Color(0xff136BFF);
    } else {
      return Colors.black;
    }
  }

  bool noDemands = false;
  bool isConseillerSelected = true;
  @override
  void initState() {
    super.initState();
    if (DashboardController.to.currentDemand == null) {
      setState(() {
        noDemands = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 2,
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isConseillerSelected = true;
                        });
                      },
                      child: Text(
                        'Conseiller',
                        style: TextStyle(
                            decoration: isConseillerSelected
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isConseillerSelected = false;
                        });
                      },
                      child: Text(
                        'Promesses',
                        style: TextStyle(
                            decoration: isConseillerSelected
                                ? TextDecoration.none
                                : TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              isConseillerSelected
                  ? Expanded(
                      flex: 1,
                      child: Text('Conseiller présidentielle', style: kBold),
                    )
                  : Expanded(
                      flex: 1,
                      child: Text(
                        'Liste des promesses',
                        style: kBold,
                      ),
                    ),
              isConseillerSelected ? demands() : promises(),
            ],
          ),
        ),
      ),
    );
  }

  Widget demands() {
    return Expanded(
      flex: 15,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(child: Image.asset('assets/conseil.png')),
          ),
          Expanded(
            flex: 4,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
                padding: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    color: Color(0xff254272),
                    borderRadius: BorderRadius.circular(100)),
                child: !noDemands
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  '${DashboardController.to.currentDemand?['curr']?.content ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffF5F5F5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${DashboardController.to.currentDemand?['curr']?.min_value ?? "N/A"}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              DashboardController.to.currentDemand?['curr']
                                          ?.current_value !=
                                      null
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      width: 700,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xff13264A),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: (((DashboardController
                                                        .to
                                                        .currentDemand?['curr']
                                                        ?.current_value) *
                                                    700) /
                                                100),
                                            decoration: BoxDecoration(
                                              color: Color(0xff19BE99),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              DashboardController
                                                          .to
                                                          .currentDemand?[
                                                              'curr']
                                                          ?.current_value !=
                                                      null
                                                  ? '${DashboardController.to.currentDemand?['curr']?.current_value}'
                                                  : '',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Text(
                                DashboardController.to.currentDemand?['curr']
                                            ?.max_value !=
                                        null
                                    ? '${DashboardController.to.currentDemand?['curr']?.max_value}'
                                    : '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: DashboardController
                                        .to.demandsEffects.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final effect = DashboardController
                                          .to.demandsEffects[index];
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              effect['label'],
                                              style: TextStyle(
                                                  color: Color(0xffBFD6FF),
                                                  fontSize: 15),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Color.fromRGBO(
                                                        35, 71, 138, 0.0),
                                                    width: 2),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.1),
                                              ),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    effect['logo_path'],
                                                    width: 30,
                                                  ),
                                                  Text(
                                                    effect['per_round_type'] ==
                                                            'positif'
                                                        ? '+${effect['per_round_change']}'
                                                        : '-${effect['per_round_change']}',
                                                    style: kMouvStyle,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              DashboardController.to.currentDemand?['curr']
                                          ?.is_accomplished ==
                                      0
                                  ? InkWell(
                                      onTap: () async {
                                        for (var effect in DashboardController
                                            .to.demandsEffects) {
                                          await CountryEffectsRepo()
                                              .updateDemandEffects(
                                                  effect['per_round_change'],
                                                  effect[
                                                      'affected_country_data_attribute_name'],
                                                  effect['per_round_type'],
                                                  DashboardController
                                                      .to
                                                      .currentGame
                                                      .value
                                                      .country_id);
                                        }
                                        await DashboardController.to
                                            .updateDemandStatus();

                                        if (DashboardController
                                                .to.currentDemand ==
                                            null) {
                                          setState(() {
                                            noDemands = true;
                                          });
                                        }
                                        ;
                                        await DashboardController.to
                                            .fetchCountryDatas(
                                                DashboardController
                                                    .to
                                                    .currentGame
                                                    .value
                                                    .country_id);
                                       toastification
                                                                    .show(
                                                                  context:
                                                                      context,
                                                                  title:
                                                                      'Success',
                                                                  showProgressBar:
                                                                      false,
                                                                  backgroundColor: Color(
                                                                            0xff19BE99)
                                                                       ,
                                                                  autoCloseDuration:
                                                                      const Duration(
                                                                          seconds:
                                                                              3),
                                                                );
                                      },
                                      child: Container(
                                        width: 120,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9.5),
                                          border: Border.all(
                                              width: 0.95,
                                              color: Color(0xFF30538C)),
                                          color: Color(0xFF5DCAA3),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Valider',
                                            style: TextStyle(
                                                color: Color(0xff30538C)),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'Aucune demande présidentielle',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffF5F5F5)),
                            ),
                          ),
                        ],
                      )),
          )
        ],
      ),
    );
  }

  Widget promises() {
    return Expanded(
      flex: 15,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          decoration: kBoxFill,
          child: DashboardController.to.prespromisesList.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      flex: 15,
                      child: ListView.builder(
                        itemCount:
                            DashboardController.to.prespromisesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final preprom = DashboardController
                              .to.prespromisesList[index]['prepromise'];
                          final prom = DashboardController
                              .to.prespromisesList[index]['promise'];
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            decoration: BoxDecoration(
                                color: DateTime.parse(preprom.end_date).isAfter(
                                        DateTime.parse(DashboardController
                                            .to.currentGame.value.current_date))
                                    ? Color(0xff233c6a)
                                    : Color(0xffB85365),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 11),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF254272),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            color: Color(0xFF30538C), width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromRGBO(8, 23, 48, 0.34),
                                            offset: Offset(0, 13),
                                            blurRadius: 35,
                                            spreadRadius: -1,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        "${index + 1}",
                                        style: kMouvStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      prom.content,
                                      style: kMouvStyle,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  width: 200,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Color(0xff13264A),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: (200 / 100) *
                                            (preprom.progress).toDouble(),
                                        decoration: BoxDecoration(
                                          color: Color(0xff19BE99),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 25),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF254272),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xFF30538C), width: 2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(8, 23, 48, 0.34),
                                        offset: Offset(0, 13),
                                        blurRadius: 35,
                                        spreadRadius: -1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            color: getColorForLevel(prom.level),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                      SizedBox(
                                        width: 45,
                                      ),
                                      Text(
                                        '${(preprom.duration_days / 30).round()} mois',
                                        style: kMouvStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFF254272),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xFF30538C), width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(8, 23, 48, 0.34),
                                    offset: Offset(0, 13),
                                    blurRadius: 35,
                                    spreadRadius: -1,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Color(0xff136BFF),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "${DashboardController.to.prespromisesList.where((promise) => promise['promise'].level == 3).length}/3",
                                    style: kMouvStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFF254272),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xFF30538C), width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(8, 23, 48, 0.34),
                                    offset: Offset(0, 13),
                                    blurRadius: 35,
                                    spreadRadius: -1,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Color(0xffffaf13),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "${DashboardController.to.prespromisesList.where((promise) => promise['promise'].level == 2).length}/3",
                                    style: kMouvStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Color(0xFF254272),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xFF30538C), width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(8, 23, 48, 0.34),
                                    offset: Offset(0, 13),
                                    blurRadius: 35,
                                    spreadRadius: -1,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff24261),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "${DashboardController.to.prespromisesList.where((promise) => promise['promise'].level == 1).length}/4",
                                    style: kMouvStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Column()),
    );
  }
}
