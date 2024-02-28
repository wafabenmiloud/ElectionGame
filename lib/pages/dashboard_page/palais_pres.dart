import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/models/country_model.dart';
import 'package:gamev2/repositories/countries_repo.dart';
import 'package:gamev2/repositories/country_datas_repo.dart';
import 'package:gamev2/repositories/country_debts_repo.dart';
import 'package:get/get.dart';
import 'package:gamev2/utils/constants.dart';

class Palais extends StatefulWidget {
  const Palais({super.key});

  @override
  State<Palais> createState() => _PalaisState();
}

class _PalaisState extends State<Palais> {
  int pibRanking = 0;
  int dettes = 0;
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      
      final info = await CountriesRepo().getCountriesInfo(
          DashboardController.to.currentGame.value.country_id);
      final dett = await CountryDebtsRepo()
          .getDettes(DashboardController.to.currentGame.value.country_id);
      final rank = await CountryDatasRepo()
          .getPibRanking(DashboardController.to.currentGame.value.country_id);
      setState(() {
        if (info != null) {
          DashboardController.to.countryInfo.value =
              RxMap<String, dynamic>.from(info);
        }
        dettes = dett;
        pibRanking = rank;
   
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 0,
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
                        'Palais présidentiel',
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
                  'Palais présidentiel',
                  style: kBold,
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: kBoxFill,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 146,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color:
                                              Color.fromRGBO(35, 71, 138, 0.00),
                                          width: 2.0,
                                        ),
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.10),
                                      ),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                'Président',
                                                style: TextStyle(
                                                  color: Color(0xFFBFD6FF),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Image.asset(
                                                DashboardController
                                                    .to
                                                    .currentGame
                                                    .value
                                                    .president_image_path,
                                                width: 80,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                DashboardController
                                                        .to
                                                        .currentGame
                                                        .value
                                                        .first_name +
                                                    DashboardController
                                                        .to
                                                        .currentGame
                                                        .value
                                                        .last_name,
                                                style: TextStyle(
                                                  color: Color(0xFFBFD6FF),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      width: double.infinity,
                                      height: 146,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 2),
                                              width: double.infinity,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 71, 138, 0.00),
                                                  width: 2.0,
                                                ),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.10),
                                              ),
                                              child: SvgPicture.asset(
                                                  DashboardController
                                                          .to.countryInfo[
                                                      'symbol_img_path']),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 2),
                                              width: double.infinity,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 71, 138, 0.00),
                                                  width: 2.0,
                                                ),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.10),
                                              ),
                                              child: SvgPicture.asset(
                                                  DashboardController
                                                          .to.countryInfo[
                                                      'continent_img_path']),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 2),
                                              width: double.infinity,
                                              height: 56,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      35, 71, 138, 0.00),
                                                  width: 2.0,
                                                ),
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.10),
                                              ),
                                              child: SvgPicture.asset(
                                                  DashboardController.to.countryInfo['map_img_path']),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          buildRow('Classement PIB mondial', '$pibRanking'),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color.fromRGBO(35, 71, 138, 0.00),
                                  width: 2.0,
                                ),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Réputation',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFBFD6FF),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: starRow(DashboardController
                                          .to.countryInfo['reputation']))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color.fromRGBO(35, 71, 138, 0.00),
                                  width: 2.0,
                                ),
                                color: Color.fromRGBO(255, 255, 255, 0.10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Ambition',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFBFD6FF),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: starRow(DashboardController
                                          .to.countryInfo['ambition']))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color.fromRGBO(35, 71, 138, 0.00),
                                  width: 2.0,
                                ),
                                color: Color.fromRGBO(1, 1, 1, 0.10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Text(''), Row()],
                              ),
                            ),
                          ),
                          buildRow('Pays', DashboardController.to.countryInfo['name']),
                          buildRow('Langues',
                              DashboardController.to.countryInfo['languages']),
                          buildRow('Population',
                              '${DashboardController.to.countryInfo['population_number']}'),
                          buildRow(
                              'Hymne national',
                              DashboardController
                                  .to.countryInfo['national_anthem_name']),
                          Expanded(
                            flex: 4,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 2),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Les plus endettes',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFBFD6FF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
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
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 16),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF254272),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                      color: Color(0xFF30538C),
                                                      width: 2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          8, 23, 48, 0.34),
                                                      offset: Offset(0, 13),
                                                      blurRadius: 35,
                                                      spreadRadius: -1,
                                                    ),
                                                  ],
                                                ),
                                                // child: Text(
                                                //   "${index + 1}",
                                                //   style: kMouvStyle,
                                                // ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
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
                                            'Dettes',
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
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: double.maxFinite,
                                      child: ListView.builder(
                                        itemCount: DashboardController
                                            .to.countryDebts.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final country = DashboardController
                                              .to.countryDebts[index];
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Color(0xff233c6a),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 35,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF254272),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xFF30538C),
                                                            width: 2),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Color.fromRGBO(
                                                                    8,
                                                                    23,
                                                                    48,
                                                                    0.34),
                                                            offset:
                                                                Offset(0, 13),
                                                            blurRadius: 35,
                                                            spreadRadius: -1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "${index + 1}",
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
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SvgPicture.asset(
                                                      country['flag_img_path'],
                                                      width: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      country['name'],
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '${country['debt_remaining']}\$',
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
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: SvgPicture.asset(
                                    DashboardController.to.currentGame.value
                                        .country_flag_img_path,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
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
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Classement PIB',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFBFD6FF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Color(0xff233c6a),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 16),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF254272),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      border: Border.all(
                                                          color:
                                                              Color(0xFF30538C),
                                                          width: 2),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color.fromRGBO(
                                                              8, 23, 48, 0.34),
                                                          offset: Offset(0, 13),
                                                          blurRadius: 35,
                                                          spreadRadius: -1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Pays',
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
                                                ],
                                              ),
                                              Text(
                                                'PIB',
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
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: SizedBox(
                                          height: double.maxFinite,
                                          child: ListView.builder(
                                            itemCount: DashboardController
                                                .to.countryPIB.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final country =
                                                  DashboardController
                                                      .to.countryPIB[index];
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 10),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff233c6a),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 35,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF254272),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xFF30538C),
                                                                width: 2),
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
                                                            ],
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "${index + 1}",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        SvgPicture.asset(
                                                          country[
                                                              'flag_img_path'],
                                                          width: 20,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          country['name'],
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
                                                      ],
                                                    ),
                                                    Text(
                                                      '${country['pib_amount']}\$',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                      ),
                                                    ),
                                                  ],
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
                            ],
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          buildRow('Dettes', '${dettes}\$'),
                          buildRow('PIB par habitant',
                              '${DashboardController.to.countryInfo['pib_amount'] / DashboardController.to.countryInfo['population_number']}\$'),
                          buildRow(
                              'Gouvernement',
                              DashboardController
                                  .to.countryInfo['governement_type']),
                          buildRow('superficie',
                              '${DashboardController.to.countryInfo['area']} km'),
                          buildRow('capitale', DashboardController.to.countryInfo['capital']),
                          buildRow('devise', DashboardController.to.countryInfo['currency']),
                          buildRow(
                              'Spécialités culinaires',
                              DashboardController
                                  .to.countryInfo['culinary_specialities']),
                          buildRow('Taille de l\'armée',
                              '${DashboardController.to.countryInfo['army_size']}'),
                          buildRow('espérance de vie',
                              '${DashboardController.to.countryInfo['life_expectancy']} ans'),
                          Container(
                            width: 200,
                            height: 200,
                            child: SvgPicture.asset(
                              DashboardController.to.countryInfo['map_img_path'],
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget buildRow(String title, String amount) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color.fromRGBO(35, 71, 138, 0.00),
            width: 2.0,
          ),
          color: Color.fromRGBO(255, 255, 255, 0.10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFBFD6FF),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                amount,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFBFD6FF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
