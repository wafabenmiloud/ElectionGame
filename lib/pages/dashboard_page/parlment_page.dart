// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/pages/dashboard/dashboard.dart';
import 'package:gamev2/repositories/country_laws.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:get/get.dart';

class ParlmentPage extends StatefulWidget {
  const ParlmentPage({
    super.key,
  });

  @override
  State<ParlmentPage> createState() => _ParlmentPageState();
}

class _ParlmentPageState extends State<ParlmentPage> {
  final isPositive = -57 >= 0;
  int selectedLaw = 0;
  final currentDate = dateformat.format(DateTime.now());

  Color getStatusColor() {
    if (DashboardController.to.parlLaws.isNotEmpty) {
      switch (DashboardController.to.parlLaws[selectedLaw]['status']) {
        case 'ACCEPTED':
          return Colors.green;
        case 'REJECTED':
          return Colors.red;
        case 'WAITING':
          return Color(0xFF3A86BB);
        default:
          return Color(0xFF3A86BB);
      }
    } else {
      return Color(0xFF3A86BB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 5,
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
                        'Lois en cours',
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
                  'Parlement',
                  style: kBold,
                ),
              ),
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: kBoxFill,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Lois en cours',
                                              style: TextStyle(
                                                  color: Color(0xffBFD6FF),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: DashboardController
                                                  .to.parlLaws.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final law = DashboardController
                                                    .to.parlLaws[index];
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedLaw = index;
                                                    });
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 20),
                                                    decoration: BoxDecoration(
                                                      color: selectedLaw ==
                                                              index
                                                          ? Color(0XFF3A86BB)
                                                          : Color(0xff0F2140),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              law['voting_date'],
                                                              style: TextStyle(
                                                                color: selectedLaw ==
                                                                        index
                                                                    ? Color(
                                                                        0xffffffff)
                                                                    : Color(
                                                                        0xffBFD6FF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              law['name'],
                                                              style: TextStyle(
                                                                color: selectedLaw ==
                                                                        index
                                                                    ? Color(
                                                                        0xff172F5C)
                                                                    : Color(
                                                                        0xffBFD6FF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      DashboardController
                                                              .to
                                                              .parlLaws
                                                              .isNotEmpty
                                                          ? DashboardController
                                                                  .to.parlLaws[
                                                              selectedLaw]['name']
                                                          : '',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 26,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    DashboardController.to
                                                            .parlLaws.isNotEmpty
                                                        ? DashboardController
                                                                    .to.parlLaws[
                                                                selectedLaw]
                                                            ['description']
                                                        : '',
                                                    style: TextStyle(
                                                      color: Color(0xffBFD6FF),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: kHorizontalPadding),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/laws_bg.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kStrokeColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 100),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 70, vertical: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9.527),
                                          border: Border.all(
                                            width: 1.905,
                                            style: BorderStyle.solid,
                                            color: Color(0xFF30538C),
                                          ),
                                          color: getStatusColor(),
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
                                            DashboardController.to.parlLaws.isNotEmpty
                                                ? DashboardController
                                                    .to.parlLaws[selectedLaw]['name']
                                                : '',
                                            style: TextStyle(
                                              color: Color(0xff172F5C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 26,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                 SizedBox(width:30), Expanded(
                                    flex: 1,
                                    child: Text(
                                      DashboardController.to.parlLaws.isNotEmpty?
                                      
                                      '${DashboardController
                                        .to.parlLaws[selectedLaw]['voting_date']}':'',  style: TextStyle(
                                                                  color:  Color(
                                                                          0xffffffff),
                                                                      
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                ),),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                  DashboardController.to.parlLaws.isNotEmpty
                                      ? DashboardController
                                          .to.parlLaws[selectedLaw]['status']
                                      : '',
                                  style: TextStyle(
                                    color: getStatusColor(),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 22,
                                  )),
                            ),
                            Text(
                              DashboardController.to.parlLaws.isNotEmpty
                                  ? 'Nouvelle valeur : ${DashboardController.to.parlLaws[selectedLaw]['new_value']}€'
                                  : '',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              DashboardController.to.parlLaws.isNotEmpty
                                  ? 'Ancienne valeur : ${DashboardController.to.parlLaws[selectedLaw]['old_value']}€'
                                  : '',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            TriangleIconsWidget(
                              percentage: 50,
                              iconsRow1: [
                                Icons.person,
                                Icons.person,
                                Icons.person,
                                Icons.person,
                                Icons.person,
                              ],
                              iconsRow2: [
                                Icons.person,
                                Icons.person,
                                Icons.person,
                                Icons.person,
                              ],
                              iconsRow3: [
                                Icons.person,
                                Icons.person,
                                Icons.person,
                              ],
                              iconsRow4: [
                                Icons.person,
                              ],
                            ),
                            DashboardController.to.parlLaws.isNotEmpty && DateTime.parse(DashboardController.to.parlLaws[selectedLaw]['voting_date']).isBefore(DateTime.now())?
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 40),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.527),
                                  color: Color(0xFF0F2140),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 43,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Color(0xff19BE99),
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DashboardController
                                                .to.parlLaws.isNotEmpty
                                            ? '${DashboardController.to.parlLaws[selectedLaw]['true_voted']} vote : oui'
                                            : '',
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 43,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF24261),
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DashboardController
                                                .to.parlLaws.isNotEmpty
                                            ? '${DashboardController.to.parlLaws[selectedLaw]['false_voted']} vote : non'
                                            : '',
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 43,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Color(0xff565656),
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        DashboardController
                                                .to.parlLaws.isNotEmpty
                                            ? '${DashboardController.to.parlLaws[selectedLaw]['neutral_value']} vote : rien'
                                            : '',
                                        style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          :Container()],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
