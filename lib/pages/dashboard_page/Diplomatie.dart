import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/pages/dashboard_page/palais_pres2.dart';
import 'package:gamev2/repositories/country_laws.dart';
import 'package:gamev2/repositories/organizations_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Diplomatie extends StatefulWidget {
  const Diplomatie({super.key});

  @override
  State<Diplomatie> createState() => _DiplomatieState();
}

class _DiplomatieState extends State<Diplomatie> {
  int continent = 0;

  int indexEurope = 0;
  int indexAmerique = 0;
  int indexAustralie = 0;
  int indexAsie = 0;
  int indexAfrique = 0;

  String embassy = '';
  String visa = '';
  String military = '';
  String commercial = '';

  int embassyIndex = -1;
  int visaIndex = -1;
  int militaryIndex = -1;
  int commercialIndex = -1;

  int selectedAdhesion = 0;
  int selectedOrgan = 0;
  bool isDiplom = true;
  bool hide = false;
  @override
  void initState() {
    super.initState();
    initializeData(selectedOrgan);
  }

  void reset() {
    embassy = '';
    visa = '';
    military = '';
    commercial = '';

    embassyIndex = -1;
    visaIndex = -1;
    militaryIndex = -1;
    commercialIndex = -1;
  }

  Future<void> initializeData(int id) async {
    if (DashboardController.to.organizations.isNotEmpty) {
      await DashboardController.to
          .fetchPrerequis(DashboardController.to.organizations[id]['id']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 7,
        child: Expanded(child: Navigator(
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(
                builder: (context) => Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isDiplom = true;
                                reset();
                              });
                            },
                            child: Text(
                              'Diplomatie',
                              style: TextStyle(
                                  decoration: isDiplom
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
                                isDiplom = false;
                              });
                            },
                            child: Text(
                              'Organisations international',
                              style: TextStyle(
                                  decoration: isDiplom
                                      ? TextDecoration.none
                                      : TextDecoration.underline,
                                  color: Color(0xffBFD6FF),
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isDiplom
                        ? Expanded(
                            flex: 1,
                            child: Text('Diplomatie', style: kBold),
                          )
                        : Expanded(
                            flex: 1,
                            child: Text(
                              'Organisations international',
                              style: kBold,
                            ),
                          ),
                    isDiplom
                        ? Expanded(
                            flex: 15,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      width: double.infinity,
                                      decoration: kBoxFill,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        continent = 0;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    9.527),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF254272),
                                                          width: 1.905,
                                                        ),
                                                        color: continent == 0
                                                            ? Color(0xFF30538C)
                                                            : Color(0xff0F2140),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Amérique',
                                                          style: TextStyle(
                                                              color: continent ==
                                                                      0
                                                                  ? Color(
                                                                      0xffffffff)
                                                                  : Color(
                                                                      0xff435678),
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        continent = 1;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    9.527),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF254272),
                                                          width: 1.905,
                                                        ),
                                                        color: continent == 1
                                                            ? Color(0xFF30538C)
                                                            : Color(0xff0F2140),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Australie',
                                                          style: TextStyle(
                                                              color: continent ==
                                                                      1
                                                                  ? Color(
                                                                      0xffffffff)
                                                                  : Color(
                                                                      0xff435678),
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        continent = 2;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    9.527),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF254272),
                                                          width: 1.905,
                                                        ),
                                                        color: continent == 2
                                                            ? Color(0xFF30538C)
                                                            : Color(0xff0F2140),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Europe',
                                                          style: TextStyle(
                                                              color: continent ==
                                                                      2
                                                                  ? Color(
                                                                      0xffffffff)
                                                                  : Color(
                                                                      0xff435678),
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        continent = 3;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    9.527),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF254272),
                                                          width: 1.905,
                                                        ),
                                                        color: continent == 3
                                                            ? Color(0xFF30538C)
                                                            : Color(0xff0F2140),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Asie',
                                                          style: TextStyle(
                                                              color: continent ==
                                                                      3
                                                                  ? Color(
                                                                      0xffffffff)
                                                                  : Color(
                                                                      0xff435678),
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 4),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        continent = 4;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    9.527),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFF254272),
                                                          width: 1.905,
                                                        ),
                                                        color: continent == 4
                                                            ? Color(0xFF30538C)
                                                            : Color(0xff0F2140),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Afrique',
                                                          style: TextStyle(
                                                              color: continent ==
                                                                      4
                                                                  ? Color(
                                                                      0xffffffff)
                                                                  : Color(
                                                                      0xff435678),
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (continent == 0)
                                            SizedBox(
                                              height: 300,
                                              child: ListView.builder(
                                                itemCount: DashboardController
                                                    .to.america.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final country =
                                                      DashboardController
                                                          .to.america[index];
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        indexAmerique = index;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 10),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: indexAmerique ==
                                                                  index
                                                              ? Color(
                                                                  0xff4365A0)
                                                              : Color(
                                                                  0xff233c6a),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SvgPicture.asset(
                                                                country[
                                                                    'flag_img_path'],
                                                                width: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                country['name'],
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff3C5F89),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: country['relationship_strength'] >
                                                                              50
                                                                          ? Color(
                                                                              0xff19BE99)
                                                                          : Color(
                                                                              0xffF24261),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image.asset(
                                                                          'assets/like.png'),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        '${country['relationship_strength']}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 8),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          if (continent == 1)
                                            SizedBox(
                                              height: 300,
                                              child: ListView.builder(
                                                itemCount: DashboardController
                                                    .to.australia.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final country =
                                                      DashboardController
                                                          .to.australia[index];
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        indexAustralie = index;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 10),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: indexAustralie ==
                                                                  index
                                                              ? Color(
                                                                  0xff4365A0)
                                                              : Color(
                                                                  0xff233c6a),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SvgPicture.asset(
                                                                country[
                                                                    'flag_img_path'],
                                                                width: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                country['name'],
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff3C5F89),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: country['relationship_strength'] >
                                                                              50
                                                                          ? Color(
                                                                              0xff19BE99)
                                                                          : Color(
                                                                              0xffF24261),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image.asset(
                                                                          'assets/like.png'),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        '${country['relationship_strength']}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 8),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          if (continent == 2)
                                            SizedBox(
                                              height: 300,
                                              child: ListView.builder(
                                                itemCount: DashboardController
                                                    .to.europe.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final country =
                                                      DashboardController
                                                          .to.europe[index];
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        indexEurope = index;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 10),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: indexEurope ==
                                                                  index
                                                              ? Color(
                                                                  0xff4365A0)
                                                              : Color(
                                                                  0xff233c6a),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SvgPicture.asset(
                                                                country[
                                                                    'flag_img_path'],
                                                                width: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                country['name'],
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff3C5F89),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: country['relationship_strength'] >
                                                                              50
                                                                          ? Color(
                                                                              0xff19BE99)
                                                                          : Color(
                                                                              0xffF24261),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image.asset(
                                                                          'assets/like.png'),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        '${country['relationship_strength']}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 8),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          if (continent == 3)
                                            SizedBox(
                                              height: 300,
                                              child: ListView.builder(
                                                itemCount: DashboardController
                                                    .to.asia.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final country =
                                                      DashboardController
                                                          .to.asia[index];
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        indexAsie = index;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 10),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: indexAsie ==
                                                                  index
                                                              ? Color(
                                                                  0xff4365A0)
                                                              : Color(
                                                                  0xff233c6a),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SvgPicture.asset(
                                                                country[
                                                                    'flag_img_path'],
                                                                width: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                country['name'],
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff3C5F89),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: country['relationship_strength'] >
                                                                              50
                                                                          ? Color(
                                                                              0xff19BE99)
                                                                          : Color(
                                                                              0xffF24261),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image.asset(
                                                                          'assets/like.png'),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        '${country['relationship_strength']}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 8),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          if (continent == 4)
                                            SizedBox(
                                              height: 300,
                                              child: ListView.builder(
                                                itemCount: DashboardController
                                                    .to.africa.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final country =
                                                      DashboardController
                                                          .to.africa[index];
                                                  return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        indexAfrique = index;
                                                        reset();
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 10),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 10),
                                                      decoration: BoxDecoration(
                                                          color: indexAfrique ==
                                                                  index
                                                              ? Color(
                                                                  0xff4365A0)
                                                              : Color(
                                                                  0xff233c6a),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SvgPicture.asset(
                                                                country[
                                                                    'flag_img_path'],
                                                                width: 30,
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                country['name'],
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            width: 60,
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff3C5F89),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              children: [
                                                                Container(
                                                                  height: 20,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: country['relationship_strength'] >
                                                                              50
                                                                          ? Color(
                                                                              0xff19BE99)
                                                                          : Color(
                                                                              0xffF24261),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                ),
                                                                Center(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Image.asset(
                                                                          'assets/like.png'),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        '${country['relationship_strength']}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 8),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  if (continent == 0 &&
                                      DashboardController.to.america.isNotEmpty)
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            width: double.infinity,
                                            decoration: kBoxFill,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            DashboardController.to
                                                                        .america[
                                                                    indexAmerique]
                                                                [
                                                                'flag_img_path'],
                                                            width: 70,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            DashboardController.to
                                                                        .america[
                                                                    indexAmerique]
                                                                ['name'],
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 160),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/palais2',
                                                              arguments: {
                                                                'countryId':
                                                                    DashboardController
                                                                            .to
                                                                            .america[indexAmerique]
                                                                        [
                                                                        'c_id'],
                                                                'personImg': DashboardController
                                                                            .to
                                                                            .america[
                                                                        indexAmerique]
                                                                    [
                                                                    'person_image_path'],
                                                                'personFName': DashboardController
                                                                            .to
                                                                            .america[
                                                                        indexAmerique]
                                                                    [
                                                                    'first_name'],
                                                                'personLName': DashboardController
                                                                            .to
                                                                            .america[
                                                                        indexAmerique]
                                                                    [
                                                                    'last_name'],
                                                                'countryName':
                                                                    DashboardController
                                                                            .to
                                                                            .america[indexAmerique]
                                                                        [
                                                                        'name'],
                                                                'countryImg': DashboardController
                                                                            .to
                                                                            .america[
                                                                        indexAmerique]
                                                                    [
                                                                    'flag_img_path'],
                                                                'popNumber':
                                                                    10000,
                                                                'currency': DashboardController
                                                                            .to
                                                                            .america[
                                                                        indexAmerique]
                                                                    [
                                                                    'currency'],
                                                                'map': DashboardController
                                                                            .to
                                                                            .america[
                                                                        indexAmerique]
                                                                    [
                                                                    'map_img_path'],
                                                                'pib': 5550,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff0F2140),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Premiére ministre de ${DashboardController.to.america[indexAmerique]['name']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          7,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      child: Image.asset(DashboardController
                                                                              .to
                                                                              .america[indexAmerique]
                                                                          [
                                                                          'person_image_path']),
                                                                    ),
                                                                    Positioned(
                                                                      right: 0,
                                                                      bottom: 0,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child: SvgPicture.asset(DashboardController
                                                                            .to
                                                                            .america[indexAmerique]['flag_img_path']),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xff3C5F89),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            10,
                                                                        width: (60 /
                                                                                100) *
                                                                            DashboardController.to.america[indexAmerique]['like_me_percent'],
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffF24261),
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset('assets/like.png'),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(
                                                                              '${DashboardController.to.america[indexAmerique]['like_me_percent']}%',
                                                                              style: TextStyle(color: Colors.white, fontSize: 7),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                buildDiplomatie(
                                                    DashboardController
                                                        .to.america,
                                                    indexAmerique),
                                              ],
                                            ))),
                                  if (continent == 1 &&
                                      DashboardController
                                          .to.australia.isNotEmpty)
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            width: double.infinity,
                                            decoration: kBoxFill,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            DashboardController
                                                                        .to
                                                                        .australia[
                                                                    indexAustralie]
                                                                [
                                                                'flag_img_path'],
                                                            width: 70,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            DashboardController
                                                                        .to
                                                                        .australia[
                                                                    indexAustralie]
                                                                ['name'],
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 160),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/palais2',
                                                              arguments: {
                                                                'countryId':
                                                                    DashboardController
                                                                            .to
                                                                            .australia[indexAustralie]
                                                                        [
                                                                        'c_id'],
                                                                'personImg': DashboardController
                                                                            .to
                                                                            .australia[
                                                                        indexAustralie]
                                                                    [
                                                                    'person_image_path'],
                                                                'personFName': DashboardController
                                                                            .to
                                                                            .australia[
                                                                        indexAustralie]
                                                                    [
                                                                    'first_name'],
                                                                'personLName': DashboardController
                                                                            .to
                                                                            .australia[
                                                                        indexAustralie]
                                                                    [
                                                                    'last_name'],
                                                                'countryName':
                                                                    DashboardController
                                                                            .to
                                                                            .australia[indexAustralie]
                                                                        [
                                                                        'name'],
                                                                'countryImg': DashboardController
                                                                            .to
                                                                            .australia[
                                                                        indexAustralie]
                                                                    [
                                                                    'flag_img_path'],
                                                                'popNumber':
                                                                    10000,
                                                                'currency': DashboardController
                                                                            .to
                                                                            .australia[
                                                                        indexAustralie]
                                                                    [
                                                                    'currency'],
                                                                'map': DashboardController
                                                                            .to
                                                                            .australia[
                                                                        indexAustralie]
                                                                    [
                                                                    'map_img_path'],
                                                                'pib': 5550,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff0F2140),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Premiére ministre de ${DashboardController.to.australia[indexAustralie]['name']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          7,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      child: Image.asset(DashboardController
                                                                              .to
                                                                              .australia[indexAustralie]
                                                                          [
                                                                          'person_image_path']),
                                                                    ),
                                                                    Positioned(
                                                                      right: 0,
                                                                      bottom: 0,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child: SvgPicture.asset(DashboardController
                                                                            .to
                                                                            .australia[indexAustralie]['flag_img_path']),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xff3C5F89),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            10,
                                                                        width: (60 /
                                                                                100) *
                                                                            DashboardController.to.australia[indexAustralie]['like_me_percent'],
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffF24261),
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset('assets/like.png'),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(
                                                                              '${DashboardController.to.australia[indexAustralie]['like_me_percent']}%',
                                                                              style: TextStyle(color: Colors.white, fontSize: 7),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                buildDiplomatie(
                                                    DashboardController
                                                        .to.australia,
                                                    indexAustralie),
                                              ],
                                            ))),
                                  if (continent == 2 &&
                                      DashboardController.to.europe.isNotEmpty)
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            width: double.infinity,
                                            decoration: kBoxFill,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            DashboardController.to
                                                                        .europe[
                                                                    indexEurope]
                                                                [
                                                                'flag_img_path'],
                                                            width: 70,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            DashboardController.to
                                                                        .europe[
                                                                    indexEurope]
                                                                ['name'],
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 160),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/palais2',
                                                              arguments: {
                                                                'countryId':
                                                                    DashboardController
                                                                            .to
                                                                            .europe[indexEurope]
                                                                        [
                                                                        'c_id'],
                                                                'personImg': DashboardController
                                                                            .to
                                                                            .europe[
                                                                        indexEurope]
                                                                    [
                                                                    'person_image_path'],
                                                                'personFName': DashboardController
                                                                            .to
                                                                            .europe[
                                                                        indexEurope]
                                                                    [
                                                                    'first_name'],
                                                                'personLName': DashboardController
                                                                            .to
                                                                            .europe[
                                                                        indexEurope]
                                                                    [
                                                                    'last_name'],
                                                                'countryName':
                                                                    DashboardController
                                                                            .to
                                                                            .europe[indexEurope]
                                                                        [
                                                                        'name'],
                                                                'countryImg': DashboardController
                                                                            .to
                                                                            .europe[
                                                                        indexEurope]
                                                                    [
                                                                    'flag_img_path'],
                                                                'popNumber':
                                                                    10000,
                                                                'currency': DashboardController
                                                                            .to
                                                                            .europe[
                                                                        indexEurope]
                                                                    [
                                                                    'currency'],
                                                                'map': DashboardController
                                                                            .to
                                                                            .europe[
                                                                        indexEurope]
                                                                    [
                                                                    'map_img_path'],
                                                                'pib': 5550,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff0F2140),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Premiére ministre de ${DashboardController.to.europe[indexEurope]['name']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          7,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      child: Image.asset(DashboardController
                                                                              .to
                                                                              .europe[indexEurope]
                                                                          [
                                                                          'person_image_path']),
                                                                    ),
                                                                    Positioned(
                                                                      right: 0,
                                                                      bottom: 0,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child: SvgPicture.asset(DashboardController
                                                                            .to
                                                                            .europe[indexEurope]['flag_img_path']),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xff3C5F89),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            10,
                                                                        width: (60 /
                                                                                100) *
                                                                            DashboardController.to.europe[indexEurope]['like_me_percent'],
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffF24261),
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset('assets/like.png'),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(
                                                                              '${DashboardController.to.europe[indexEurope]['like_me_percent']}%',
                                                                              style: TextStyle(color: Colors.white, fontSize: 7),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                buildDiplomatie(
                                                    DashboardController
                                                        .to.europe,
                                                    indexEurope),
                                              ],
                                            ))),
                                  if (continent == 3 &&
                                      DashboardController.to.asia.isNotEmpty)
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            width: double.infinity,
                                            decoration: kBoxFill,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            DashboardController
                                                                        .to.asia[
                                                                    indexAsie][
                                                                'flag_img_path'],
                                                            width: 70,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            DashboardController
                                                                        .to.asia[
                                                                    indexAsie]
                                                                ['name'],
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 160),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/palais2',
                                                              arguments: {
                                                                'countryId':
                                                                    DashboardController
                                                                            .to
                                                                            .asia[indexAsie]
                                                                        [
                                                                        'c_id'],
                                                                'personImg': DashboardController
                                                                            .to
                                                                            .asia[
                                                                        indexAsie]
                                                                    [
                                                                    'person_image_path'],
                                                                'personFName': DashboardController
                                                                            .to
                                                                            .asia[
                                                                        indexAsie]
                                                                    [
                                                                    'first_name'],
                                                                'personLName': DashboardController
                                                                            .to
                                                                            .asia[
                                                                        indexAsie]
                                                                    [
                                                                    'last_name'],
                                                                'countryName':
                                                                    DashboardController
                                                                            .to
                                                                            .asia[indexAsie]
                                                                        [
                                                                        'name'],
                                                                'countryImg': DashboardController
                                                                            .to
                                                                            .asia[
                                                                        indexAsie]
                                                                    [
                                                                    'flag_img_path'],
                                                                'popNumber':
                                                                    10000,
                                                                'currency': DashboardController
                                                                            .to
                                                                            .asia[
                                                                        indexAsie]
                                                                    [
                                                                    'currency'],
                                                                'map': DashboardController
                                                                            .to
                                                                            .asia[
                                                                        indexAsie]
                                                                    [
                                                                    'map_img_path'],
                                                                'pib': 5550,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff0F2140),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Premiére ministre de ${DashboardController.to.asia[indexAsie]['name']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          7,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      child: Image.asset(DashboardController
                                                                              .to
                                                                              .asia[indexAsie]
                                                                          [
                                                                          'person_image_path']),
                                                                    ),
                                                                    Positioned(
                                                                      right: 0,
                                                                      bottom: 0,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child: SvgPicture.asset(DashboardController
                                                                            .to
                                                                            .asia[indexAsie]['flag_img_path']),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xff3C5F89),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            10,
                                                                        width: (60 /
                                                                                100) *
                                                                            DashboardController.to.asia[indexAsie]['like_me_percent'],
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffF24261),
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset('assets/like.png'),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(
                                                                              '${DashboardController.to.asia[indexAsie]['like_me_percent']}%',
                                                                              style: TextStyle(color: Colors.white, fontSize: 7),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                buildDiplomatie(
                                                    DashboardController.to.asia,
                                                    indexAsie),
                                              ],
                                            ))),
                                  if (continent == 4 &&
                                      DashboardController.to.africa.isNotEmpty)
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            width: double.infinity,
                                            decoration: kBoxFill,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            DashboardController.to
                                                                        .africa[
                                                                    indexAfrique]
                                                                [
                                                                'flag_img_path'],
                                                            width: 70,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            DashboardController.to
                                                                        .africa[
                                                                    indexAfrique]
                                                                ['name'],
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 160),
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                              context,
                                                              '/palais2',
                                                              arguments: {
                                                                'countryId':
                                                                    DashboardController
                                                                            .to
                                                                            .africa[indexAfrique]
                                                                        [
                                                                        'c_id'],
                                                                'personImg': DashboardController
                                                                            .to
                                                                            .africa[
                                                                        indexAfrique]
                                                                    [
                                                                    'person_image_path'],
                                                                'personFName': DashboardController
                                                                            .to
                                                                            .africa[
                                                                        indexAfrique]
                                                                    [
                                                                    'first_name'],
                                                                'personLName': DashboardController
                                                                            .to
                                                                            .africa[
                                                                        indexAfrique]
                                                                    [
                                                                    'last_name'],
                                                                'countryName':
                                                                    DashboardController
                                                                            .to
                                                                            .africa[indexAfrique]
                                                                        [
                                                                        'name'],
                                                                'countryImg': DashboardController
                                                                            .to
                                                                            .africa[
                                                                        indexAfrique]
                                                                    [
                                                                    'flag_img_path'],
                                                                'popNumber':
                                                                    10000,
                                                                'currency': DashboardController
                                                                            .to
                                                                            .africa[
                                                                        indexAfrique]
                                                                    [
                                                                    'currency'],
                                                                'map': DashboardController
                                                                            .to
                                                                            .africa[
                                                                        indexAfrique]
                                                                    [
                                                                    'map_img_path'],
                                                                'pib': 5550,
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Color(
                                                                    0xff0F2140),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        5),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Premiére ministre de ${DashboardController.to.africa[indexAfrique]['name']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          7,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      child: Image.asset(DashboardController
                                                                              .to
                                                                              .africa[indexAfrique]
                                                                          [
                                                                          'person_image_path']),
                                                                    ),
                                                                    Positioned(
                                                                      right: 0,
                                                                      bottom: 0,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child: SvgPicture.asset(DashboardController
                                                                            .to
                                                                            .africa[indexAfrique]['flag_img_path']),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10,
                                                                  width: 60,
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xff3C5F89),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            10,
                                                                        width: (60 /
                                                                                100) *
                                                                            DashboardController.to.africa[indexAfrique]['like_me_percent'],
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xffF24261),
                                                                            borderRadius: BorderRadius.circular(20)),
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset('assets/like.png'),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(
                                                                              '${DashboardController.to.africa[indexAfrique]['like_me_percent']}%',
                                                                              style: TextStyle(color: Colors.white, fontSize: 7),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                buildDiplomatie(
                                                    DashboardController
                                                        .to.africa,
                                                    indexAfrique)
                                              ],
                                            ))),
                                ]),
                          )
                        : organizations()
                  ],
                ),
              );
            } else if (settings.name == '/palais2') {
              var arguments = settings.arguments;

              if (arguments != null && arguments is Map<String, dynamic>) {
                var countryId = arguments['countryId'];
                var personImg = arguments['personImg'];
                var personFName = arguments['personFName'];
                var personLName = arguments['personLName'];
                var countryName = arguments['countryName'];
                var countryImg = arguments['countryImg'];
                var popNumber = arguments['popNumber'];
                var currency = arguments['currency'];
                var map = arguments['map'];
                var pib = arguments['pib'];

                return MaterialPageRoute(
                  builder: (context) {
                    return Palais2(
                        countryId: countryId,
                        personImg: personImg,
                        personFName: personFName,
                        personLName: personLName,
                        countryName: countryName,
                        countryImg: countryImg,
                        popNumber: popNumber,
                        currency: currency,
                        map: map,
                        pib: pib);
                  },
                );
              }
            }
            return null;
          },
        )),
      ),
    );
  }

  Widget organizations() {
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
                    height: 425,
                    child: ListView.builder(
                      itemCount: DashboardController.to.organizations.length,
                      itemBuilder: (BuildContext context, int index) {
                        final org = DashboardController.to.organizations[index];
                        return InkWell(
                          onTap: () async {
                            setState(() {
                              selectedOrgan = index;
                            });
                            await initializeData(selectedOrgan);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color: selectedOrgan == index
                                    ? Color(0xff4365A0)
                                    : Color(0xff233c6a),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      org['image_path'],
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      org['name'],
                                      style: kMouvStyle,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 15,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Color(0xff3C5F89),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color:
                                                org['relationship_strength'] >
                                                        50
                                                    ? Color(0xff19BE99)
                                                    : Color(0xffF24261),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/like.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '${org['relationship_strength']}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                decoration: kBoxFill,
                child: DashboardController.to.memStatus.isNotEmpty &&
                        DashboardController
                                .to.memStatus[selectedOrgan].status ==
                            'MEMBER'
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      DashboardController
                                              .to.organizations[selectedOrgan]
                                          ['image_path'],
                                      width: 70,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      DashboardController.to
                                          .organizations[selectedOrgan]['name'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'assets/iso.png',
                                            width: 60,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                            width: 30,
                                            height: 20,
                                            child: Image.asset(
                                                DashboardController
                                                            .to.organizations[
                                                        selectedOrgan]
                                                    ['image_path']),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    Text('President',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 20),
                                    Container(
                                      height: 15,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Color(0xff3C5F89),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: Color(0xff19BE99),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset('assets/like.png'),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${DashboardController.to.organizations[selectedOrgan]['relationship_strength']}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                ),
                                color: Color(0xFF30538C),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Votez',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 20),
                                  Wrap(
                                    alignment: WrapAlignment.spaceEvenly,
                                    spacing: 10,
                                    children: [
                                      for (var item
                                          in DashboardController.to.orgmembers)
                                        buildAvatar(
                                          'assets/iso.png',
                                          item['flag_img_path'],
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFF30538C),
                                              width: 2.0,
                                            ),
                                            color: Color(0xFF3A86BB),
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
                                          child: Text('Oui',
                                              style: TextStyle(
                                                  color: Color(0xff172F5C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFF30538C),
                                              width: 2.0,
                                            ),
                                            color: Color(0xFF3A86BB),
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
                                          child: Text('Non',
                                              style: TextStyle(
                                                  color: Color(0xff172F5C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: Color(0xFF30538C),
                                              width: 2.0,
                                            ),
                                            color: Color(0xFF3A86BB),
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
                                          child: Text('Neutre',
                                              style: TextStyle(
                                                  color: Color(0xff172F5C),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        DashboardController
                                                .to.organizations[selectedOrgan]
                                            ['image_path'],
                                        width: 70,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        DashboardController
                                                .to.organizations[selectedOrgan]
                                            ['name'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xff0F2140),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${DashboardController.to.organizations[selectedOrgan]['first_name']} ${DashboardController.to.organizations[selectedOrgan]['last_name']}',
                                        style: TextStyle(
                                            fontSize: 7,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 80,
                                            child: Image.asset(
                                                DashboardController
                                                            .to.organizations[
                                                        selectedOrgan]
                                                    ['person_image_path']),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 10,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Color(0xff3C5F89),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            Container(
                                              height: 10,
                                              width: (60 / 100) *
                                                  DashboardController
                                                              .to.organizations[
                                                          selectedOrgan]
                                                      ['like_me_percent'],
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF24261),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      'assets/like.png'),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    '${DashboardController.to.organizations[selectedOrgan]['like_me_percent']}%',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: DashboardController.to.memStatus.isNotEmpty
                                ? Container(
                                    width: 400,
                                    height: 130,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                      ),
                                      color: Color(0xFF30538C),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Demander l’adhesion',
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        InkWell(
                                            onTap: (DashboardController
                                                            .to
                                                            .memStatus[
                                                                selectedOrgan]
                                                            .status ==
                                                        'WAITING' ||
                                                    DashboardController
                                                            .to
                                                            .memStatus[
                                                                selectedOrgan]
                                                            .status ==
                                                        'NOT_ELIGIBLE')
                                                ? () {}
                                                : () async {
                                                    final val = await OrganizationsRepo()
                                                        .doesRecordExist(
                                                            DashboardController
                                                                        .to
                                                                        .organizations[
                                                                    selectedOrgan]
                                                                ['id'],
                                                            DashboardController
                                                                        .to
                                                                        .organizations[
                                                                    selectedOrgan]
                                                                ['country_id']);

                                                    if (!val) {
                                                      final accepted =
                                                          DashboardController.to
                                                              .compareDatas();
                                                      if (accepted) {
                                                        await OrganizationsRepo().updateMemberStatus(
                                                            'WAITING',
                                                            DashboardController
                                                                        .to
                                                                        .organizations[
                                                                    selectedOrgan]
                                                                ['id'],
                                                            DashboardController
                                                                        .to
                                                                        .organizations[
                                                                    selectedOrgan]
                                                                ['country_id']);
                                                        await DashboardController
                                                            .to
                                                            .fetchMemberStatus(
                                                                DashboardController
                                                                            .to
                                                                            .organizations[
                                                                        selectedOrgan]
                                                                    [
                                                                    'country_id']);
                                                      } else {
                                                        await OrganizationsRepo().updateMemberStatus(
                                                            'NOT_ELIGIBLE',
                                                            DashboardController
                                                                        .to
                                                                        .organizations[
                                                                    selectedOrgan]
                                                                ['id'],
                                                            DashboardController
                                                                        .to
                                                                        .organizations[
                                                                    selectedOrgan]
                                                                ['country_id']);
                                                        await DashboardController
                                                            .to
                                                            .fetchMemberStatus(
                                                                DashboardController
                                                                            .to
                                                                            .organizations[
                                                                        selectedOrgan]
                                                                    [
                                                                    'country_id']);
                                                      }
                                                    } else {
                                                      await DashboardController
                                                          .to
                                                          .fetchMemberStatus(
                                                              DashboardController
                                                                          .to
                                                                          .organizations[
                                                                      selectedOrgan]
                                                                  [
                                                                  'country_id']);
                                                      await DashboardController
                                                          .to
                                                          .fetchOrgMembers(
                                                              DashboardController
                                                                      .to
                                                                      .organizations[
                                                                  selectedOrgan]['id']);
                                                    }
                                                    setState(() {
                                                      hide = true;
                                                    });
                                                  },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: DashboardController
                                                                .to
                                                                .memStatus[
                                                                    selectedOrgan]
                                                                .status ==
                                                            '' ||
                                                        DashboardController
                                                                .to
                                                                .memStatus[
                                                                    selectedOrgan]
                                                                .status ==
                                                            null
                                                    ? Color(0xff0CA0F3)
                                                    : Color(0xff5D7AAE),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Color(0xff30538C)),
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
                                              child: Text(
                                                DashboardController
                                                            .to
                                                            .memStatus[
                                                                selectedOrgan]
                                                            .status ==
                                                        'NOT_ELIGIBLE'
                                                    ? "Non éligible"
                                                    : DashboardController
                                                                .to
                                                                .memStatus[
                                                                    selectedOrgan]
                                                                .status ==
                                                            'WAITING'
                                                        ? "En attente"
                                                        : "Confirmer",
                                                style: TextStyle(
                                                    color: Color(0xff0F2140),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ))
                                      ],
                                    ))
                                : Container(),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                              flex: 2,
                              child: Container(
                                  width: 600,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                    color: Color(0xFF30538C),
                                  ),
                                  child: DashboardController
                                          .to.prerequis.isNotEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: Text(
                                                  'Prérequis',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Continent : ${DashboardController.to.prerequis[0].continent_name}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min population number : ${DashboardController.to.prerequis[0].min_population_number}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min median salary : ${DashboardController.to.prerequis[0].min_median_salary}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'max_pollution_taux : ${DashboardController.to.prerequis[0].max_pollution_taux}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min security taux : ${DashboardController.to.prerequis[0].min_security_taux}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min total economy amount : ${DashboardController.to.prerequis[0].min_total_economy_amount}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min military number : ${DashboardController.to.prerequis[0].min_military_number}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min pib_amount : ${DashboardController.to.prerequis[0].min_pib_amount}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Min stability international taux : ${DashboardController.to.prerequis[0].min_stability_international_taux}',
                                                style: TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column()))
                        ],
                      )))
      ]),
    );
  }

  Widget buildDiplomatie(RxList<Map<String, dynamic>> continent, int id) {
    return Obx(() => Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Ambassade dans le pays',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'VISA',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: (continent[id]['embassy_status'] == null)
                            ? Row(
                                children: [
                                  buildContainer(id, continent, 'Ouverte', 0,
                                      () {
                                    setState(() {
                                      embassy = 'OK';
                                      embassyIndex = 0;
                                    });
                                  }),
                                  buildContainer(id, continent, 'Renvoyer', 1,
                                      () {
                                    setState(() {
                                      embassy = 'MIDDLE';
                                      embassyIndex = 1;
                                    });
                                  }),
                                  buildContainer(id, continent, 'Fermé', 2, () {
                                    setState(() {
                                      embassy = 'NO';
                                      embassyIndex = 2;
                                    });
                                  }),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['embassy_status'] ==
                                                'OK'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Ouverte',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['embassy_status'] ==
                                                'MIDDLE'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Renvoyer',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['embassy_status'] ==
                                                'NO'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Fermé',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: (continent[id]['visa_status'] == null)
                            ? Row(
                                children: [
                                  buildContainer2(id, continent, 'Sans', 0, () {
                                    setState(() {
                                      visa = 'NO';
                                      visaIndex = 0;
                                    });
                                  }),
                                  buildContainer2(
                                      id, continent, 'Electronique', 1, () {
                                    setState(() {
                                      visa = 'MIDDLE';
                                      visaIndex = 1;
                                    });
                                  }),
                                  buildContainer2(id, continent, 'Avec', 2, () {
                                    setState(() {
                                      visa = 'OK';
                                      visaIndex = 2;
                                    });
                                  }),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color:
                                            continent[id]['visa_status'] == 'NO'
                                                ? Color(0xff19BE99)
                                                : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Sans',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]['visa_status'] ==
                                                'MIDDLE'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Electronique',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color:
                                            continent[id]['visa_status'] == 'OK'
                                                ? Color(0xff19BE99)
                                                : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Avec',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Collaboration militaire',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Libre échange commercial',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: (continent[id]['military_status'] == null)
                            ? Row(
                                children: [
                                  buildContainer3(
                                      id, continent, 'Droit aux bases', 0, () {
                                    setState(() {
                                      military = 'OK';
                                      militaryIndex = 0;
                                    });
                                  }),
                                  buildContainer3(
                                      id, continent, 'Avion seulement', 1, () {
                                    setState(() {
                                      military = 'MIDDLE';
                                      militaryIndex = 1;
                                    });
                                  }),
                                  buildContainer3(id, continent, 'Non', 2, () {
                                    setState(() {
                                      military = 'NO';
                                      militaryIndex = 2;
                                    });
                                  }),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['military_status'] ==
                                                'OK'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Droit aux bases',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['military_status'] ==
                                                'MIDDLE'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Avion seulement',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['military_status'] ==
                                                'NO'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          'Non',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: continent[id]['commercial_status'] == null
                            ? Row(
                                children: [
                                  buildContainer4(id, continent, '100%', 0, () {
                                    setState(() {
                                      commercial = 'OK';
                                      commercialIndex = 0;
                                    });
                                  }),
                                  buildContainer4(id, continent, '50%', 1, () {
                                    setState(() {
                                      commercial = 'MIDDLE';
                                      commercialIndex = 1;
                                    });
                                  }),
                                  buildContainer4(id, continent, '0%', 2, () {
                                    setState(() {
                                      commercial = 'NO';
                                      commercialIndex = 2;
                                    });
                                  })
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['commercial_status'] ==
                                                'OK'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          '100%',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['commercial_status'] ==
                                                'MIDDLE'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          '50%',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: continent[id]
                                                    ['commercial_status'] ==
                                                'NO'
                                            ? Color(0xff19BE99)
                                            : Color(0xff0CA0F3),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Color(0xFF30538C),
                                          width: 2,
                                        ),
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
                                      child: Center(
                                        child: Text(
                                          '0%',
                                          style: TextStyle(
                                            color: Color(0xff0F2140),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  child: SvgPicture.asset(
                                    'assets/user.svg',
                                    width: 50,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 20,
                                    height: 30,
                                    child: SvgPicture.asset(
                                        continent[id]['flag_img_path']),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Relation ${continent[id]['name']}",
                              style: kP3,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                    continent[id]['relationship_strength'] > 50
                                        ? Color(0xff19BE99)
                                        : Color(0xffF24261),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                '${continent[id]['relationship_strength']}%',
                                style: kMouvStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (continent[id]['embassy_status'] == null &&
                  continent[id]['visa_status'] == null &&
                  continent[id]['military_status'] == null &&
                  continent[id]['commercial_status'] == null)
                Expanded(
                  flex: 1,
                  child: InkWell(
                      onTap: () async {
                        int strength = continent[id]['relationship_strength'];

                        switch (embassy) {
                          case 'OK':
                            strength += 5;
                            break;
                          case 'MIDDLE':
                            strength -= 5;
                            break;
                          case 'NO':
                            strength -= 10;
                            break;
                        }

                        switch (visa) {
                          case 'OK':
                            strength += 5;
                            break;
                          case 'MIDDLE':
                            strength -= 5;
                            break;
                          case 'NO':
                            strength -= 10;
                            break;
                        }

                        switch (military) {
                          case 'OK':
                            strength += 5;
                            break;
                          case 'MIDDLE':
                            strength -= 5;
                            break;
                          case 'NO':
                            strength -= 10;
                            break;
                        }

                        switch (commercial) {
                          case 'OK':
                            strength += 5;
                            break;
                          case 'MIDDLE':
                            strength -= 5;
                            break;
                          case 'NO':
                            strength -= 10;
                            break;
                        }
                        await CountryLawsRepo().insertDiplom(embassy, visa,
                            military, commercial, continent[id]['country_id']);
                        await CountryLawsRepo().updateStrength(
                            continent[id]['country_id'],
                            strength,
                            DashboardController
                                .to.currentGame.value.country_id);
                        await DashboardController.to.fetchDiplomaties(
                            DashboardController
                                .to.currentGame.value.country_id);
                        toastification.show(
                          context: context,
                          title: 'Success',
                          showProgressBar: false,
                          backgroundColor: Color(0xff19BE99),
                          autoCloseDuration: const Duration(seconds: 3),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xff0CA0F3),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Color(0xff30538C)),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(8, 23, 48, 0.34),
                              offset: Offset(0, 13),
                              blurRadius: 35,
                              spreadRadius: -1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirmer",
                              style: TextStyle(
                                  color: Color(0xff0F2140),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )),
                )
            ],
          ),
        ));
  }

  Widget buildContainer(int id, RxList<Map<String, dynamic>> continent,
      String text, int index, VoidCallback onTapCallback) {
    return Expanded(
      child: InkWell(
        onTap: (continent[id]['embassy_status'] == null &&
                continent[id]['visa_status'] == null &&
                continent[id]['military_status'] == null &&
                continent[id]['commercial_status'] == null)
            ? onTapCallback
            : null,
        child: Container(
          width: 50,
          padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
          decoration: BoxDecoration(
            color:
                embassyIndex == index ? Color(0xff19BE99) : Color(0xff0CA0F3),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFF30538C),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(8, 23, 48, 0.34),
                offset: Offset(0, 13),
                blurRadius: 35,
                spreadRadius: -1,
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xff0F2140),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer2(int id, RxList<Map<String, dynamic>> continent,
      String text, int index, VoidCallback onTapCallback) {
    return Expanded(
      child: Container(
        width: 50,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        decoration: BoxDecoration(
          color: visaIndex == index ? Color(0xff19BE99) : Color(0xff0CA0F3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFF30538C),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              offset: Offset(0, 13),
              blurRadius: 35,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: (continent[id]['embassy_status'] == null &&
                    continent[id]['visa_status'] == null &&
                    continent[id]['military_status'] == null &&
                    continent[id]['commercial_status'] == null)
                ? onTapCallback
                : null,
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xff0F2140),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer3(int id, RxList<Map<String, dynamic>> continent,
      String text, int index, VoidCallback onTapCallback) {
    return Expanded(
      child: Container(
        width: 50,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        decoration: BoxDecoration(
          color: militaryIndex == index ? Color(0xff19BE99) : Color(0xff0CA0F3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFF30538C),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              offset: Offset(0, 13),
              blurRadius: 35,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: (continent[id]['embassy_status'] == null &&
                    continent[id]['visa_status'] == null &&
                    continent[id]['military_status'] == null &&
                    continent[id]['commercial_status'] == null)
                ? onTapCallback
                : null,
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xff0F2140),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer4(int id, RxList<Map<String, dynamic>> continent,
      String text, int index, VoidCallback onTapCallback) {
    return Expanded(
      child: Container(
        width: 50,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        decoration: BoxDecoration(
          color:
              commercialIndex == index ? Color(0xff19BE99) : Color(0xff0CA0F3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFF30538C),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(8, 23, 48, 0.34),
              offset: Offset(0, 13),
              blurRadius: 35,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: (continent[id]['embassy_status'] == null &&
                    continent[id]['visa_status'] == null &&
                    continent[id]['military_status'] == null &&
                    continent[id]['commercial_status'] == null)
                ? onTapCallback
                : null,
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xff0F2140),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAvatar(String avatar, String flag) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          child: Image.asset(
            avatar,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            height: 30,
            width: 30,
            child: SvgPicture.asset(flag),
          ),
        ),
      ],
    );
  }
}
