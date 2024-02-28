import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/country_resources_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Industries extends StatefulWidget {
  const Industries({super.key});

  @override
  State<Industries> createState() => _IndustriesState();
}

class _IndustriesState extends State<Industries> {
  int selectedIndusIndex = 0;
  int selectedLicenceIndex = 0;
  bool isIndust = true;
  bool showbtnsInd = false;
  int number = 0;
  String size = '';
  int isList = 1;
  int isList2 = 1;
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

  List<Map<String, dynamic>> resIndEffects = [];
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    if (DashboardController.to.ressourcesInd.isNotEmpty) {
      await DashboardController.to.fetchLicences(
          DashboardController.to.ressourcesInd[selectedLicenceIndex]['id']);
      final effects1 = await CountryEffectsRepo().getRessourceEffects(
          DashboardController.to.ressourcesInd[selectedIndusIndex]['id']);
      setState(() {
        resIndEffects = effects1;
        number = DashboardController.to.ressourcesInd[selectedIndusIndex]
            ['number_of_companies'];
        size = DashboardController.to.ressourcesInd[selectedIndusIndex]
            ['company_size'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 10,
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
                          isIndust = true;
                        });
                      },
                      child: Text(
                        'Industries',
                        style: TextStyle(
                            decoration: isIndust
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
                          isIndust = false;
                          showbtnsInd = false;
                        });
                      },
                      child: Text(
                        'Licences',
                        style: TextStyle(
                            decoration: isIndust
                                ? TextDecoration.none
                                : TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              isIndust
                  ? Expanded(
                      flex: 1,
                      child: Text('Industries', style: kBold),
                    )
                  : Expanded(
                      flex: 1,
                      child: Text(
                        'Licences',
                        style: kBold,
                      ),
                    ),
              isIndust ? industrie() : licences()
            ],
          ),
        ),
      ),
    );
  }

  Widget industrie() {
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
                      itemCount: DashboardController.to.ressourcesInd.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ressource =
                            DashboardController.to.ressourcesInd[index];

                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndusIndex = index;
                              showbtnsInd = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: selectedIndusIndex == index
                                    ? Color(0xff4365A0)
                                    : Color(0xff233c6a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SvgPicture.asset(
                                      '${ressource['image_path']}'),
                                ),
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
            child: selectedIndusIndex != -1 &&
                    DashboardController.to.ressourcesInd.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    decoration: kBoxFill,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${DashboardController.to.ressourcesInd[selectedIndusIndex]['name']}',
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
                                margin: EdgeInsets.symmetric(vertical: 0),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Licence expertise',
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
                                            child: starRow(DashboardController
                                                        .to.ressourcesInd[
                                                    selectedIndusIndex]
                                                ['licence_level'])),
                                      ],
                                    ),
                                    DashboardController.to.ressourcesInd[
                                                    selectedIndusIndex]
                                                ['licence_level'] ==
                                            0
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Vous devez acheter une licence pour activer',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Row(
                                            children: [
                                              Text(''),
                                            ],
                                          ),
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
                                              child: buildContainerInd2(
                                                  'S',
                                                  DashboardController
                                                          .to.ressourcesInd[
                                                      selectedIndusIndex]['id'],
                                                  () {
                                                setState(() {
                                                  size = 'S';
                                                });
                                              }, 0),
                                            ),
                                            Expanded(
                                              child: buildContainerInd2(
                                                  'M',
                                                  DashboardController
                                                          .to.ressourcesInd[
                                                      selectedIndusIndex]['id'],
                                                  () {
                                                setState(() {
                                                  size = 'M';
                                                });
                                              }, 1),
                                            ),
                                            Expanded(
                                              child: buildContainerInd2(
                                                  'L',
                                                  DashboardController
                                                          .to.ressourcesInd[
                                                      selectedIndusIndex]['id'],
                                                  () {
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
                                                  child: buildContainerInd(
                                                    '100',
                                                    DashboardController
                                                            .to.ressourcesInd[
                                                        selectedIndusIndex]['id'],
                                                    () {
                                                      setState(() {
                                                        number = 100;
                                                      });
                                                    },
                                                    0,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerInd(
                                                    '3000',
                                                    DashboardController
                                                            .to.ressourcesInd[
                                                        selectedIndusIndex]['id'],
                                                    () {
                                                      setState(() {
                                                        number = 3000;
                                                      });
                                                    },
                                                    1,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerInd(
                                                    '20 000',
                                                    DashboardController
                                                            .to.ressourcesInd[
                                                        selectedIndusIndex]['id'],
                                                    () {
                                                      setState(() {
                                                        number = 20000;
                                                      });
                                                    },
                                                    2,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildContainerInd(
                                                    '80 000',
                                                    DashboardController
                                                            .to.ressourcesInd[
                                                        selectedIndusIndex]['id'],
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
                                      height: 15,
                                    ),
                                    buildRow('Valeur/U: ',
                                        '${DashboardController.to.ressourcesInd[selectedIndusIndex]['value']}€'),
                                    buildRow('Nombre total de salariés: ',
                                        '${DashboardController.to.ressourcesInd[selectedIndusIndex]['number_of_companies'] * getCompanySizeValue(DashboardController.to.ressourcesInd[selectedIndusIndex]['company_size'])}'),
                                    buildRow(
                                        'Production salarié par jour: ', '10'),
                                    buildRow('Production total par jour: ',
                                        '${DashboardController.to.ressourcesInd[selectedIndusIndex]['production_per_day']}'),
                                    buildRow('Total: ',
                                        '${DashboardController.to.ressourcesInd[selectedIndusIndex]['total_quantity']}€'),
                                    if (showbtnsInd == true)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 80,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: resIndEffects.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final effect =
                                                    resIndEffects[index];
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
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        effect['label'],
                                                        style: kP3,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 12),
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
                                                          showbtnsInd = false;
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
                                                                          .ressourcesInd[
                                                                      selectedIndusIndex]['id'],
                                                                  number,
                                                                  size);
                                                          for (var effect
                                                              in resIndEffects) {
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
                                                              showbtnsInd =
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
                                            .to.contractsInd.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final contract = DashboardController
                                              .to.contractsInd[index];
                                          if (contract['resource_id'] !=
                                              DashboardController
                                                      .to.ressourcesInd[
                                                  selectedIndusIndex]['id']) {
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
                                                        width: 5,
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
                                                    '${contract['price']}',
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

  Widget licences() {
    return Expanded(
      flex: 15,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          flex: 2,
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
                      itemCount: DashboardController.to.ressourcesInd.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ressource =
                            DashboardController.to.ressourcesInd[index];
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              selectedLicenceIndex = index;
                            });
                            await DashboardController.to.fetchLicences(
                                DashboardController.to
                                    .ressourcesInd[selectedLicenceIndex]['id']);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: selectedLicenceIndex == index
                                    ? Color(0xff4365A0)
                                    : Color(0xff233c6a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:
                                      SvgPicture.asset(ressource['image_path']),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    ressource['name'],
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
            flex: 4,
            child: selectedLicenceIndex != -1
                ? Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            width: double.infinity,
                            decoration: kBoxFill,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    DashboardController.to
                                            .ressourcesInd[selectedLicenceIndex]
                                        ['name'],
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Licence expertise',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: starRow(DashboardController
                                                      .to.ressourcesInd[
                                                  selectedLicenceIndex]
                                              ['licence_level'])),
                                    ],
                                  ),
                                ),
                                DashboardController.to.ressourcesInd[
                                                selectedLicenceIndex]
                                            ['licence_level'] ==
                                        0
                                    ? Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Vous devez acheter une licence pour activer',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Expanded(
                                        child: Row(
                                          children: [
                                            Text(''),
                                          ],
                                        ),
                                      ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            width: double.infinity,
                            decoration: kBoxFill,
                            child: Column(
                              children: [
                                /*  Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      child: Text(
                                                        'Recherches',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 10),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff30538C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                'Faire les recherches en interne',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Text(
                                                                'Education taux % de reussite',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: InkWell(
                                                                  child:
                                                                      Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            6,
                                                                        horizontal:
                                                                            8),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        border: Border
                                                                            .all(
                                                                          color:
                                                                              Color(0xFF30538C),
                                                                          width:
                                                                              2,
                                                                        ),
                                                                        color: Color(
                                                                            0xFF0CA0F3),
                                                                        boxShadow: [
                                                                      BoxShadow(
                                                                        color: Color.fromRGBO(
                                                                            8,
                                                                            23,
                                                                            48,
                                                                            0.34),
                                                                        offset: Offset(
                                                                            0,
                                                                            13),
                                                                        blurRadius:
                                                                            35,
                                                                        spreadRadius:
                                                                            -1,
                                                                      ),
                                                                    ]),
                                                                child: Text(
                                                                    'Commencer'),
                                                              )),
                                                            )
                                                          ]),
                                                    ),
                                                   */
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Acheter la licence',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 200,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 50,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 300 / 180,
                                    ),
                                    itemCount:
                                        DashboardController.to.licences.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final licence = DashboardController
                                          .to.licences[index];
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: Color(0xff30538C),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        licence['country_name'],
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: SvgPicture.asset(
                                                        licence[
                                                            'flag_img_path'],
                                                        width: 30,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${licence['price']}€',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                    onTap: () async {
                                                      await CountryRessourcesRepo().updateCountryDataAndResourceLicence(
                                                          licence['id'],
                                                          DashboardController.to
                                                                      .ressourcesInd[
                                                                  selectedLicenceIndex]
                                                              ['country_id'],
                                                          DashboardController.to
                                                                  .ressourcesInd[
                                                              selectedLicenceIndex]['id'],
                                                          licence['price']);
                                                      await DashboardController
                                                          .to
                                                          .fetchRessorces(
                                                              DashboardController
                                                                          .to
                                                                          .ressourcesInd[
                                                                      selectedLicenceIndex]
                                                                  [
                                                                  'country_id']);
                                                      await DashboardController
                                                          .to
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
                                                    child: DashboardController
                                                                        .to
                                                                        .ressourcesInd[
                                                                    selectedLicenceIndex]
                                                                [
                                                                'licence_level'] ==
                                                            5
                                                        ? Container()
                                                        : Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 6,
                                                                    horizontal:
                                                                        20),
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    border:
                                                                        Border
                                                                            .all(
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
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            13),
                                                                    blurRadius:
                                                                        35,
                                                                    spreadRadius:
                                                                        -1,
                                                                  ),
                                                                ]),
                                                            child:
                                                                Text('Acheter'),
                                                          )),
                                              )
                                            ]),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  )
                : Container(
                    width: double.infinity,
                    decoration: kBoxFill,
                  )),
        Expanded(
          flex: 1,
          child: Container(
            child: Image.asset('assets/lic.png'),
          ),
        ),
      ]),
    );
  }

  Widget buildContainerInd(
      String text, int id, VoidCallback update, int index) {
    return InkWell(
      onTap: () async {
        update();
        final effects1 = await CountryEffectsRepo().getRessourceEffects(id);
        setState(() {
          resIndEffects = effects1;
          showbtnsInd = true;
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

  Widget buildContainerInd2(
      String text, int id, VoidCallback update, int index) {
    return InkWell(
      onTap: () async {
        update();
        final effects1 = await CountryEffectsRepo().getRessourceEffects(id);
        setState(() {
          resIndEffects = effects1;
          showbtnsInd = true;
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

  Widget starRow(int numberOfStars) {
    if (numberOfStars < 0 || numberOfStars > 5) {
      print('Number of stars must be between 0 and 5');
    }

    List<Widget> stars = [];

    for (int i = 0; i < 5; i++) {
      if (i < numberOfStars) {
        stars.add(Icon(Icons.star, color: Colors.amber));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.grey));
      }
    }

    return Row(
      children: stars,
    );
  }
}
