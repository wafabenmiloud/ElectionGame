import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/countries_repo.dart';
import 'package:gamev2/repositories/country_datas_repo.dart';
import 'package:gamev2/repositories/country_debts_repo.dart';
import 'package:get/get.dart';
import 'package:gamev2/utils/constants.dart';

class Palais2 extends StatefulWidget {
  final int countryId;
  final String personImg;
  final String personFName;
  final String personLName;
  final String countryName;
  final String countryImg;
  final String currency;
  final int popNumber;
  final int pib;
  final String map;

  const Palais2(
      {required this.countryId,
      required this.personImg,
      required this.personFName,
      required this.personLName,
      required this.countryName,
      required this.countryImg,
      required this.popNumber,
      required this.currency,
      required this.map,
      required this.pib,
      Key? key})
      : super(key: key);

  @override
  State<Palais2> createState() => _Palais2State();
}

class _Palais2State extends State<Palais2> {
  int pibRanking = 0;
  int dettes = 0;
 RxMap<String, dynamic> countryInfo = <String, dynamic>{
    'id': 1,
    'country_id': 1,
    'symbol_img_path': 'assets/f1.svg',
    'continent_img_path': 'assets/f2.svg',
    'map_img_path': 'assets/f2.svg',
    'reputation': 0,
    'ambition': 0,
    'languages': '',
    'national_anthem_name': '',
    'governement_type': '',
    'area': 0,
    'capital': '',
    'currency': '',
    'name': '',
    'culinary_specialities': '',
    'army_size': 0,
    'life_expectancy': 0,
    'pib_amount': 0,
    'population_number': 0,
  }.obs;
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      final info = await CountriesRepo().getCountriesInfo(widget.countryId);
      final dett = await CountryDebtsRepo().getDettes(widget.countryId);
      final rank = await CountryDatasRepo().getPibRanking(widget.countryId);
      setState(() {
        if (info != null) {
          countryInfo.value = RxMap<String, dynamic>.from(info);
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
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteBlueishColor,
                    )),
              ],
            )),
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
                                    color: Color.fromRGBO(35, 71, 138, 0.00),
                                    width: 2.0,
                                  ),
                                  color: Color.fromRGBO(255, 255, 255, 0.10),
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
                                          widget.personImg,
                                          width: 80,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          widget.personFName +
                                              widget.personLName,
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
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
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
                                            countryInfo['symbol_img_path']),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
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
                                            countryInfo['continent_img_path']),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 2),
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
                                        child: SvgPicture.asset(widget.map),
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
                    buildRow('Classement PIB mondial',
                        '${pibRanking}'),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Expanded(child: starRow(countryInfo['reputation']))
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Expanded(child: starRow(countryInfo['ambition']))
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(''), Row()],
                        ),
                      ),
                    ),
                    buildRow('Pays', widget.countryName),
                    buildRow('Langues', countryInfo['languages']),
                    buildRow('Population', '${widget.popNumber}'),
                    buildRow(
                        'Hymne national', countryInfo['national_anthem_name']),
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 16),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF254272),
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                                                width: 35,
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
                                                child: Center(
                                                  child: Text(
                                                    "${index + 1}",
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
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFFFFFFF),
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
                              widget.countryImg,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                  vertical: 10, horizontal: 16),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF254272),
                                                borderRadius:
                                                    BorderRadius.circular(100),
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
                                  flex: 7,
                                  child: SizedBox(
                                    height: double.maxFinite,
                                    child: ListView.builder(
                                      itemCount: DashboardController
                                          .to.countryPIB.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final country = DashboardController
                                            .to.countryPIB[index];
                                        return Container(
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
                                                    width: 35,
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
                                                    child: Center(
                                                      child: Text(
                                                        "${index + 1}",
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
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${country['pib_amount']}\$',
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
                    child: Column(
                  children: [
                    buildRow(
                        'Dettes', '${dettes}\$'),
                    buildRow('PIB par habitant',
                        '${widget.pib / widget.popNumber}\$'),
                    buildRow('Gouvernement', countryInfo['governement_type']),
                    buildRow('superficie', '${countryInfo['area']} km'),
                    buildRow('capitale', countryInfo['capital']),
                    buildRow('devise', widget.currency),
                    buildRow('Spécialités culinaires',
                        countryInfo['culinary_specialities']),
                    buildRow(
                        'Taille de l\'armée', '${countryInfo['army_size']}'),
                    buildRow('espérance de vie',
                        '${countryInfo['life_expectancy']} ans'),
                    Container(
                      width: 200,
                      height: 200,
                      child: SvgPicture.asset(
                        widget.map,
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
