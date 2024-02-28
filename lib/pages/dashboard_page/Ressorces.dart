// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/country_resources_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Ressorces extends StatefulWidget {
  const Ressorces({super.key});

  @override
  State<Ressorces> createState() => _RessorcesState();
}

class _RessorcesState extends State<Ressorces> {
  int selectedResourceIndex = 0;
  int selectedAgResourceIndex = 0;
  bool resNaturel = true;
  bool showbtnsNat = false;
  bool showbtnsAgr = false;
  int number = 0;
  String size = '';
  int number2 = 0;
  String size2 = '';
  int isList = 1;
  int isList2 = 1;
  int isListA = 1;
  int isList2A = 1;
  int getCompanySizeValue(String companySize) {
    switch (companySize.toUpperCase()) {
      case 'S':
        return 1;
      case 'M':
        return 5;
      case 'L':
        return 10;
      default:
        return 0;
    }
  }

  List<Map<String, dynamic>> resNatEffects = [];
  List<Map<String, dynamic>> resAgrEffects = [];

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    if (DashboardController.to.ressourcesNat.isNotEmpty) {
      final effects1 = await CountryEffectsRepo().getRessourceEffects(
          DashboardController.to.ressourcesNat[selectedResourceIndex]['id']);
      setState(() {
        resNatEffects = effects1;
        number = DashboardController.to.ressourcesNat[selectedResourceIndex]
            ['number_of_companies'];
        size = DashboardController.to.ressourcesNat[selectedResourceIndex]
            ['company_size'];
      });
    }
    if (DashboardController.to.ressourcesAgr.isNotEmpty) {
      final effects2 = await CountryEffectsRepo().getRessourceEffects(
          DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['id']);
      setState(() {
        resAgrEffects = effects2;
        number2 = DashboardController.to.ressourcesAgr[selectedAgResourceIndex]
            ['number_of_companies'];
        size2 = DashboardController.to.ressourcesAgr[selectedAgResourceIndex]
            ['company_size'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 9,
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
                          resNaturel = true;
                          showbtnsAgr = false;
                        });
                      },
                      child: Text(
                        'Naturelles',
                        style: TextStyle(
                            decoration: resNaturel
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
                          resNaturel = false;
                          showbtnsNat = false;
                        });
                      },
                      child: Text(
                        'Agricoles',
                        style: TextStyle(
                            decoration: resNaturel
                                ? TextDecoration.none
                                : TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              resNaturel
                  ? Expanded(
                      flex: 1,
                      child: Text('Ressources Naturelles', style: kBold),
                    )
                  : Expanded(
                      flex: 1,
                      child: Text(
                        'Ressources Agricoles',
                        style: kBold,
                      ),
                    ),
              resNaturel ? ressourcesNaturelles() : ressourcesAgricoles()
            ],
          ),
        ),
      ),
    );
  }

  Widget ressourcesNaturelles() {
    return Expanded(
      flex: 15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: kBoxFill,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 475,
                    child: ListView.builder(
                      itemCount: DashboardController.to.ressourcesNat.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ressource =
                            DashboardController.to.ressourcesNat[index];

                        return InkWell(
                          onTap: () async {
                            setState(() {
                              selectedResourceIndex = index;
                              showbtnsNat = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: selectedResourceIndex == index
                                    ? Color(0xff4365A0)
                                    : Color(0xff233c6a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: SvgPicture.asset(
                                        '${ressource['image_path']}')),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '${ressource['name']}',
                                    style: kMouvStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
            flex: 2,
            child: selectedResourceIndex != -1 &&
                    DashboardController.to.ressourcesNat.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    decoration: kBoxFill,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${DashboardController.to.ressourcesNat[selectedResourceIndex]['name']}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color.fromRGBO(35, 71, 138, 0.00),
                                    width: 2.0,
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.10),
                                ),
                                child: Column(
                                  children: [
                                    buildRow2(
                                      'Coefficient de production',
                                      ['X10', 'X50', 'X150', 'X500'],
                                      [
                                        Color(0xff7B8AA1),
                                        Color(0xff3EBCBC),
                                        Color(0xff7B8AA1),
                                        Color(0xff7B8AA1)
                                      ],
                                    ),
                                    buildRow2(
                                      'Type d’emploi',
                                      ['1', '2', '3'],
                                      [
                                        Color(0xff7B8AA1),
                                        Color(0xff3EBCBC),
                                        Color(0xff7B8AA1)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Taille entreprise',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              child: buildContainerNat2(
                                                  'S',
                                                  DashboardController
                                                              .to.ressourcesNat[
                                                          selectedResourceIndex]
                                                      ['id'], () {
                                                setState(() {
                                                  size = 'S';
                                                });
                                              }, 0),
                                            ),
                                            Expanded(
                                              child: buildContainerNat2(
                                                  'M',
                                                  DashboardController
                                                              .to.ressourcesNat[
                                                          selectedResourceIndex]
                                                      ['id'], () {
                                                setState(() {
                                                  size = 'M';
                                                });
                                              }, 1),
                                            ),
                                            Expanded(
                                              child: buildContainerNat2(
                                                  'L',
                                                  DashboardController
                                                              .to.ressourcesNat[
                                                          selectedResourceIndex]
                                                      ['id'], () {
                                                setState(() {
                                                  size = 'L';
                                                });
                                              }, 2),
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Nombre d’entreprise',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: buildContainerNat(
                                                    '100',
                                                    DashboardController
                                                                .to.ressourcesNat[
                                                            selectedResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 100;
                                                      });
                                                    },
                                                    0,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerNat(
                                                    '3000',
                                                    DashboardController
                                                                .to.ressourcesNat[
                                                            selectedResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 3000;
                                                      });
                                                    },
                                                    1,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerNat(
                                                    '20 000',
                                                    DashboardController
                                                                .to.ressourcesNat[
                                                            selectedResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 20000;
                                                      });
                                                    },
                                                    2,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerNat(
                                                    '80 000',
                                                    DashboardController
                                                                .to.ressourcesNat[
                                                            selectedResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 80000;
                                                      });
                                                    },
                                                    3,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    buildRow('Valeur/U: ',
                                        '${DashboardController.to.ressourcesNat[selectedResourceIndex]['value']}€'),
                                    buildRow('Nombre total de salariés: ',
                                        '${DashboardController.to.ressourcesNat[selectedResourceIndex]['number_of_companies'] * getCompanySizeValue(DashboardController.to.ressourcesNat[selectedResourceIndex]['company_size'])}'),
                                    buildRow(
                                        'Production salarié par jour: ', '10'),
                                    buildRow('Production total par jour: ',
                                        '${DashboardController.to.ressourcesNat[selectedResourceIndex]['production_per_day']}'),
                                    buildRow('Total: ',
                                        '${DashboardController.to.ressourcesNat[selectedResourceIndex]['total_quantity']}€'),
                                    if (showbtnsNat == true)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 80,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: resNatEffects.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final effect =
                                                    resNatEffects[index];
                                                return Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  height: 80,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        effect['logo_path'],
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        effect['label'],
                                                        style: kP3,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 12,
                                                                vertical: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              effect['per_round_type'] ==
                                                                      'positif'
                                                                  ? kGreenColor
                                                                  : kRedColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Text(
                                                          effect['per_round_type'] ==
                                                                  'positif'
                                                              ? '+${effect['per_round_change']}'
                                                              : '-${effect['per_round_change']}',
                                                          style: kMouvStyle,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width: 240,
                                            height: 40,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          showbtnsNat = false;
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF30538C),
                                                                  width: 2,
                                                                ),
                                                                color: Color(
                                                                    0xFF0CA0F3),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        8,
                                                                        23,
                                                                        48,
                                                                        0.34),
                                                                offset: Offset(
                                                                    0, 13),
                                                                blurRadius: 35,
                                                                spreadRadius:
                                                                    -1,
                                                              ),
                                                            ]),
                                                        child: Center(
                                                          child:
                                                              Text('Annuler'),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(width: 20),
                                                Expanded(
                                                  child: InkWell(
                                                      onTap: () async {
                                                        try {
                                                          bool check = await CountryRessourcesRepo()
                                                              .updateRessource(
                                                                  DashboardController
                                                                          .to
                                                                          .ressourcesNat[
                                                                      selectedResourceIndex]['id'],
                                                                  number,
                                                                  size);
                                                          for (var effect
                                                              in resNatEffects) {
                                                            await CountryEffectsRepo().updateResEffects(
                                                                effect[
                                                                    'per_round_change'],
                                                                effect[
                                                                    'affected_country_data_attribute_name'],
                                                                effect[
                                                                    'per_round_type'],
                                                                DashboardController
                                                                    .to
                                                                    .currentGame
                                                                    .value
                                                                    .country_id);
                                                          }
                                                          await DashboardController
                                                              .to
                                                              .fetchCountryDatas(
                                                                  DashboardController
                                                                      .to
                                                                      .currentGame
                                                                      .value
                                                                      .country_id);
                                                          await DashboardController
                                                              .to
                                                              .fetchRessorces(
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

                                                          if (check) {
                                                            setState(() {
                                                              showbtnsNat =
                                                                  false;
                                                            });
                                                          }
                                                        } catch (e) {
                                                          print(
                                                              "Error updating resource: $e");
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF30538C),
                                                                  width: 2,
                                                                ),
                                                                color: Color(
                                                                    0xFF0CA0F3),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        8,
                                                                        23,
                                                                        48,
                                                                        0.34),
                                                                offset: Offset(
                                                                    0, 13),
                                                                blurRadius: 35,
                                                                spreadRadius:
                                                                    -1,
                                                              ),
                                                            ]),
                                                        child: Center(
                                                          child:
                                                              Text('Modifier'),
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color.fromRGBO(35, 71, 138, 0.00),
                                    width: 2.0,
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        'Contrats en cours',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Color(0xff233c6a),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pays',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Quantité',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Text(
                                            'Valeur',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: DashboardController
                                            .to.contractsNat.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final contract = DashboardController
                                              .to.contractsNat[index];
                                          if (contract['resource_id'] !=
                                              DashboardController
                                                          .to.ressourcesNat[
                                                      selectedResourceIndex]
                                                  ['id']) {
                                            return SizedBox.shrink();
                                          }
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Color(0xff233c6a),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: SvgPicture.asset(
                                                          contract[
                                                              'flag_img_path'],
                                                          width: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          contract[
                                                              'country_name'],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${contract['total_quantity']}',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${contract['price']}€',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
                : Container(
                    width: double.infinity,
                    decoration: kBoxFill,
                  )),
      ]),
    );
  }

  Widget ressourcesAgricoles() {
    return Expanded(
      flex: 15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            decoration: kBoxFill,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 475,
                    child: ListView.builder(
                      itemCount: DashboardController.to.ressourcesAgr.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ressource =
                            DashboardController.to.ressourcesAgr[index];
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              selectedAgResourceIndex = index;
                              showbtnsAgr = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: selectedAgResourceIndex == index
                                    ? Color(0xff4365A0)
                                    : Color(0xff233c6a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: SvgPicture.asset(
                                        '${ressource['image_path']}')),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '${ressource['name']}',
                                    style: kMouvStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
            flex: 2,
            child: selectedAgResourceIndex != -1
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    decoration: kBoxFill,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['name']}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color.fromRGBO(35, 71, 138, 0.00),
                                    width: 2.0,
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.10),
                                ),
                                child: Column(
                                  children: [
                                    buildRow2(
                                      'Coefficient de production',
                                      ['X10', 'X50', 'X150', 'X500'],
                                      [
                                        Color(0xff7B8AA1),
                                        Color(0xff3EBCBC),
                                        Color(0xff7B8AA1),
                                        Color(0xff7B8AA1)
                                      ],
                                    ),
                                    buildRow2(
                                      'Type d’emploi',
                                      ['1', '2', '3'],
                                      [
                                        Color(0xff7B8AA1),
                                        Color(0xff3EBCBC),
                                        Color(0xff7B8AA1)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Taille entreprise',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Expanded(
                                              child: buildContainerAgr2(
                                                  'S',
                                                  DashboardController
                                                              .to.ressourcesAgr[
                                                          selectedAgResourceIndex]
                                                      ['id'], () {
                                                setState(() {
                                                  size = 'S';
                                                });
                                              }, 0),
                                            ),
                                            Expanded(
                                              child: buildContainerAgr2(
                                                  'M',
                                                  DashboardController
                                                              .to.ressourcesAgr[
                                                          selectedAgResourceIndex]
                                                      ['id'], () {
                                                setState(() {
                                                  size = 'M';
                                                });
                                              }, 1),
                                            ),
                                            Expanded(
                                              child: buildContainerAgr2(
                                                  'L',
                                                  DashboardController
                                                              .to.ressourcesAgr[
                                                          selectedAgResourceIndex]
                                                      ['id'], () {
                                                setState(() {
                                                  size = 'L';
                                                });
                                              }, 2),
                                            ),
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Nombre d’entreprise',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: buildContainerAgr(
                                                    '100',
                                                    DashboardController
                                                                .to.ressourcesAgr[
                                                            selectedAgResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 100;
                                                      });
                                                    },
                                                    0,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerAgr(
                                                    '3000',
                                                    DashboardController
                                                                .to.ressourcesAgr[
                                                            selectedAgResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 3000;
                                                      });
                                                    },
                                                    1,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerAgr(
                                                    '20 000',
                                                    DashboardController
                                                                .to.ressourcesAgr[
                                                            selectedAgResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 20000;
                                                      });
                                                    },
                                                    2,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerAgr(
                                                    '80 000',
                                                    DashboardController
                                                                .to.ressourcesAgr[
                                                            selectedAgResourceIndex]
                                                        ['id'],
                                                    () {
                                                      setState(() {
                                                        number = 80000;
                                                      });
                                                    },
                                                    3,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    buildRow('Valeur/U: ',
                                        '${DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['value']}€'),
                                    buildRow('Nombre total de salariés: ',
                                        '${DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['number_of_companies'] * getCompanySizeValue(DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['company_size'])}'),
                                    buildRow(
                                        'Production salarié par jour: ', '10'),
                                    buildRow('Production total par jour: ',
                                        '${DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['production_per_day']}'),
                                    buildRow('Total: ',
                                        '${DashboardController.to.ressourcesAgr[selectedAgResourceIndex]['total_quantity']}€'),
                                    if (showbtnsAgr == true)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 80,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: resAgrEffects.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final effect =
                                                    resAgrEffects[index];
                                                return Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  height: 80,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        effect['logo_path'],
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        effect['label'],
                                                        style: kP3,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 12,
                                                                vertical: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              effect['per_round_type'] ==
                                                                      'positif'
                                                                  ? kGreenColor
                                                                  : kRedColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Text(
                                                          effect['per_round_type'] ==
                                                                  'positif'
                                                              ? '+${effect['per_round_change']}'
                                                              : '-${effect['per_round_change']}',
                                                          style: kMouvStyle,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            width: 240,
                                            height: 40,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          showbtnsAgr = false;
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF30538C),
                                                                  width: 2,
                                                                ),
                                                                color: Color(
                                                                    0xFF0CA0F3),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        8,
                                                                        23,
                                                                        48,
                                                                        0.34),
                                                                offset: Offset(
                                                                    0, 13),
                                                                blurRadius: 35,
                                                                spreadRadius:
                                                                    -1,
                                                              ),
                                                            ]),
                                                        child: Center(
                                                          child:
                                                              Text('Annuler'),
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(width: 20),
                                                Expanded(
                                                  child: InkWell(
                                                      onTap: () async {
                                                        try {
                                                          bool check = await CountryRessourcesRepo()
                                                              .updateRessource(
                                                                  DashboardController
                                                                          .to
                                                                          .ressourcesAgr[
                                                                      selectedAgResourceIndex]['id'],
                                                                  number,
                                                                  size);
                                                          for (var effect
                                                              in resAgrEffects) {
                                                            await CountryEffectsRepo().updateResEffects(
                                                                effect[
                                                                    'per_round_change'],
                                                                effect[
                                                                    'affected_country_data_attribute_name'],
                                                                effect[
                                                                    'per_round_type'],
                                                                DashboardController
                                                                    .to
                                                                    .currentGame
                                                                    .value
                                                                    .country_id);
                                                          }
                                                          await DashboardController
                                                              .to
                                                              .fetchCountryDatas(
                                                                  DashboardController
                                                                      .to
                                                                      .currentGame
                                                                      .value
                                                                      .country_id);
                                                          await DashboardController
                                                              .to
                                                              .fetchRessorces(
                                                                  DashboardController
                                                                      .to
                                                                      .currentGame
                                                                      .value
                                                                      .country_id);

                                                          if (check) {
                                                            setState(() {
                                                              showbtnsAgr =
                                                                  false;
                                                            });
                                                          }
                                                        } catch (e) {
                                                          print(
                                                              "Error updating resource: $e");
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xFF30538C),
                                                                  width: 2,
                                                                ),
                                                                color: Color(
                                                                    0xFF0CA0F3),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        8,
                                                                        23,
                                                                        48,
                                                                        0.34),
                                                                offset: Offset(
                                                                    0, 13),
                                                                blurRadius: 35,
                                                                spreadRadius:
                                                                    -1,
                                                              ),
                                                            ]),
                                                        child: Center(
                                                          child:
                                                              Text('Modifier'),
                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color.fromRGBO(35, 71, 138, 0.00),
                                    width: 2.0,
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        'Contrats en cours',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Color(0xff233c6a),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pays',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Quantité',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          Text(
                                            'Valeur',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: DashboardController
                                            .to.contractsAgr.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final contract = DashboardController
                                              .to.contractsAgr[index];
                                          if (contract['resource_id'] !=
                                              DashboardController
                                                          .to.ressourcesAgr[
                                                      selectedAgResourceIndex]
                                                  ['id']) {
                                            return SizedBox.shrink();
                                          }
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 2),
                                            decoration: BoxDecoration(
                                                color: Color(0xff233c6a),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: SvgPicture.asset(
                                                          contract[
                                                              'flag_img_path'],
                                                          width: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          contract[
                                                              'country_name'],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 14,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${contract['total_quantity']}',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${contract['price']}€',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
                : Container(
                    width: double.infinity,
                    decoration: kBoxFill,
                  )),
      ]),
    );
  }

  Widget buildContainer(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kStrokeColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(8, 23, 48, 0.34),
            blurRadius: 35,
            offset: Offset(0, 13),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }

  Widget buildRow2(String title, List<String> labels, List<Color> colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: List.generate(labels.length, (index) {
              return Expanded(
                child: buildContainer(labels[index], colors[index]),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget buildContainerNat(
      String text, int id, VoidCallback update, int index) {
    return InkWell(
      onTap: () async {
        update();
        final effects1 = await CountryEffectsRepo().getRessourceEffects(id);
        setState(() {
          resNatEffects = effects1;
          showbtnsNat = true;
          isList = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: isList == index ? Color(0xff3EBCBC) : Color(0xff436BAB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kStrokeColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              blurRadius: 35,
              offset: Offset(0, 13),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerNat2(
      String text, int id, VoidCallback update, int index) {
    return InkWell(
      onTap: () async {
        update();
        final effects1 = await CountryEffectsRepo().getRessourceEffects(id);
        setState(() {
          resNatEffects = effects1;
          showbtnsNat = true;
          isList2 = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: isList2 == index ? Color(0xff3EBCBC) : Color(0xff436BAB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kStrokeColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              blurRadius: 35,
              offset: Offset(0, 13),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerAgr(
      String text, int id, VoidCallback update, int index) {
    return InkWell(
      onTap: () async {
        update();
        final effects1 = await CountryEffectsRepo().getRessourceEffects(id);
        setState(() {
          resAgrEffects = effects1;
          showbtnsAgr = true;
          isListA = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: isListA == index ? Color(0xff3EBCBC) : Color(0xff436BAB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kStrokeColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              blurRadius: 35,
              offset: Offset(0, 13),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerAgr2(
      String text, int id, VoidCallback update, int index) {
    return InkWell(
      onTap: () async {
        update();
        final effects1 = await CountryEffectsRepo().getRessourceEffects(id);
        setState(() {
          resAgrEffects = effects1;
          showbtnsAgr = true;
          isList2A = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        margin: EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: isList2A == index ? Color(0xff3EBCBC) : Color(0xff436BAB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kStrokeColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              blurRadius: 35,
              offset: Offset(0, 13),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text1,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ],
    );
  }
}
