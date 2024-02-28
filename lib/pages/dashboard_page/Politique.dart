import 'package:flutter/material.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/models/person_model.dart';
import 'package:gamev2/pages/dashboard_page/Ressorces.dart';
import 'package:gamev2/repositories/countries_repo.dart';
import 'package:gamev2/repositories/jobs_repo.dart';
import 'package:gamev2/repositories/political_parties_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';

class Politique extends StatefulWidget {
  const Politique({super.key});

  @override
  State<Politique> createState() => _PolitiqueState();
}

class _PolitiqueState extends State<Politique> {
  String determinePoliticalDirection(int politicalDirection) {
    if (politicalDirection >= 0 && politicalDirection <= 20) {
      return 'Extrême Gauche';
    } else if (politicalDirection > 20 && politicalDirection <= 40) {
      return 'Gauche';
    } else if (politicalDirection > 40 && politicalDirection <= 60) {
      return 'Centre';
    } else if (politicalDirection > 60 && politicalDirection <= 80) {
      return 'Droite';
    } else if (politicalDirection > 80 && politicalDirection <= 100) {
      return 'Extrême Droite';
    } else {
      return 'Unknown';
    }
  }

  int selectedParti = -1;
  RxList<PersonModel> members = RxList<PersonModel>();

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
  if (DashboardController.to.partyPersonList.isNotEmpty) {
    var initialData = await PoliticalPartiesRepo().getMembersData(
        DashboardController.to.partyPersonList[0]['person'].id);
    members.addAll(initialData);
  }
}


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 8,
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
                        'Partis politiques',
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
                  'Politique',
                  style: kBold,
                ),
              ),
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        width: double.infinity,
                        decoration: kBoxFill,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Les partis politiques',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 400,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 30,
                                ),
                                itemCount: DashboardController
                                    .to.partyPersonList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () async {
                                      setState(() {
                                        selectedParti = index;
                                      });
                                      var newData = await PoliticalPartiesRepo()
                                          .getMembersData(
                                              DashboardController
                                                  .to
                                                  .partyPersonList[
                                                      selectedParti]['person']
                                                  .id);
                                      setState(() {
                                        members.value = newData;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: selectedParti == index
                                            ? Color(0xff4365A0)
                                            : Color(0xff233C6A),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Image.asset(
                                                          DashboardController
                                                              .to
                                                              .partyPersonList[
                                                                  index]
                                                                  ['party']
                                                              .img_path,
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Text(
                                                          DashboardController
                                                              .to
                                                              .partyPersonList[
                                                                  index]
                                                                  ['party']
                                                              .name,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'Nom : ${DashboardController.to.partyPersonList[index]['person'].first_name} ${DashboardController.to.partyPersonList[index]['person'].last_name}',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                /* Expanded(
                                                            child: Text(
                                                              'Fonction :',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight.w400,
                                                              ),
                                                            ),
                                                          ),*/
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    'Direction politique : ${determinePoliticalDirection(DashboardController.to.partyPersonList[index]['party'].political_direction)}',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                                FutureBuilder<int>(
                                                  future: PoliticalPartiesRepo()
                                                      .getMembers(
                                                          DashboardController
                                                              .to
                                                              .partyPersonList[
                                                                  index]
                                                                  ['person']
                                                              .id),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState
                                                            .waiting) {
                                                      return CircularProgressIndicator();
                                                    } else if (snapshot
                                                        .hasError) {
                                                      return Text(
                                                          'Error: ${snapshot.error}');
                                                    } else {
                                                      return Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          'Nombre : ${snapshot.data}',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
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
                    Expanded(
                        flex: 2,
                        child: (selectedParti != -1 && DashboardController
                                                        .to
                                                        .partyPersonList.isNotEmpty)
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                width: double.infinity,
                                decoration: kBoxFill,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    DashboardController
                                                        .to
                                                        .partyPersonList[
                                                            selectedParti]
                                                            ['party']
                                                        .img_path),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  DashboardController
                                                      .to
                                                      .partyPersonList[
                                                          selectedParti]
                                                          ['party']
                                                      .name,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 400,
                                            child: GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 50,
                                                mainAxisSpacing: 30,
                                              ),
                                              itemCount: members.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final member = members[index];
                                                return Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff0F2140),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          child: Image.asset(
                                                              member.image_path),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          height: 20,
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xff3C5F89),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            children: [
                                                              Container(
                                                                height: 20,
                                                              width: (80 / 100) * (member.like_me_percent ?? 0),

                                                                decoration: BoxDecoration(
                                                                    color: Color(
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
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      '${member.like_me_percent}%',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              8),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Nom : ${member.first_name + member.last_name}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            /* Expanded(
                                                                        child: Text(
                                                                          'Fonction : Président(e)',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  10,
                                                                              fontWeight: FontWeight
                                                                                  .w400,
                                                                              color:
                                                                                  Colors.white),
                                                                        ),
                                                                      ),*/
                                                            Expanded(
                                                              child: Text(
                                                                'Age : ${member.age}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      /*   Expanded(
                                                                  flex: 2,
                                                                  child: InkWell(
                                                                    onTap: () {},
                                                                    child: Container(
                                                                      padding:
                                                                          EdgeInsets.symmetric(
                                                                              horizontal: 8,
                                                                              vertical: 3),
                                                                      decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        border: Border.all(
                                                                          color:
                                                                              Color(0xFF30538C),
                                                                          width: 2,
                                                                        ),
                                                                        color: Color(0xFF0CA0F3),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color: Color.fromRGBO(
                                                                                8, 23, 48, 0.34),
                                                                            blurRadius: 35,
                                                                            offset: Offset(0, 13),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      child: Text(
                                                                        'Sudoyer',
                                                                        style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              */
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                decoration: kBoxFill,
                              )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
