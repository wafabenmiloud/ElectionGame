// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/pages/debat.dart';
import 'package:gamev2/repositories/countries_repo.dart';
import 'package:gamev2/repositories/political_parties_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/widgets/page_padding.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dashboard/dashboard.dart';

class PoliticalPart extends StatefulWidget {
  const PoliticalPart({super.key});

  @override
  State<PoliticalPart> createState() => _PoliticalPartState();
}

class _PoliticalPartState extends State<PoliticalPart> {
  bool showSecondContent = false;

  void toggleContent() {
    setState(() {
      showSecondContent = !showSecondContent;
    });
  }

  final controller = CarouselController();
  int _currentIndex = 0;
  int selectedPartiIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagePadding(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: showSecondContent
                    ? Center(
                        child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 100, horizontal: 180),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        width: 800,
                        decoration: kBoxFill,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(CreateNewGameController
                                    .to.selectedParti['party'].img_path),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  CreateNewGameController
                                      .to.selectedParti['party'].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff0F2140),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                      '${CreateNewGameController.to.selectedParti['person'].first_name}  ${CreateNewGameController.to.selectedParti['person'].last_name}',
                                      style: kP6),
                                  Image.asset(
                                    CreateNewGameController
                                        .to.selectedParti['person'].image_path,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Félicitations vous êtes membre de notre parti",
                              style: kSemiBold2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    await CreateNewGameController.to
                                        .createNewGame();

                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Debat(),
                                    ));
                                  },
                                  child: const Text('Suivant'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                    : Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 100, horizontal: 180),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40),
                          width: double.infinity,
                          decoration: kBoxFill,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CarouselSlider.builder(
                                carouselController: controller,
                                options: CarouselOptions(
                                  initialPage: 0,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                ),
                                itemCount: CreateNewGameController
                                    .to.selectedparties.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "Vos promesses ont attiré ${CreateNewGameController.to.selectedparties.length}",
                                              style: kSemiBold2,
                                            ),
                                            Text(
                                              "${CreateNewGameController.to.selectedparties.length} Parti politique vous propose l'adhesion",
                                              style: kSemiBold2,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    CreateNewGameController
                                                        .to
                                                        .selectedparties[index]
                                                            ['party']
                                                        .img_path),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  CreateNewGameController
                                                      .to
                                                      .selectedparties[index]
                                                          ['party']
                                                      .name,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Président du parti :',
                                                          style: kP5,
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                            '${CreateNewGameController.to.selectedparties[index]['person'].first_name} ${CreateNewGameController.to.selectedparties[index]['person'].last_name}',
                                                            style: kP6)
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Membres au parlement :',
                                                          style: kP5,
                                                        ),
                                                        SizedBox(
                                                          width: 20,
                                                        ),
                                                        FutureBuilder<int>(
                                                          future: PoliticalPartiesRepo()
                                                              .getMembers(
                                                                  CreateNewGameController
                                                                      .to
                                                                      .selectedparties[
                                                                          index]
                                                                          [
                                                                          'person']
                                                                      .id),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                    .connectionState ==
                                                                ConnectionState
                                                                    .waiting) {
                                                              return CircularProgressIndicator(); // Show a loading indicator while waiting for the result.
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  'Error: ${snapshot.error}');
                                                            } else {
                                                              return Text(
                                                                '${snapshot.data}',
                                                                style: kP6,
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xff0F2140),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10),
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                        '${CreateNewGameController.to.selectedparties[index]['person'].first_name} ${CreateNewGameController.to.selectedparties[index]['person'].last_name}',
                                                        style: kP6),
                                                    Image.asset(
                                                      CreateNewGameController
                                                          .to
                                                          .selectedparties[
                                                              index]['person']
                                                          .image_path,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () async {
                                                await CreateNewGameController.to
                                                    .createNewGame();

                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) => Debat(),
                                                ));
                                              },
                                              child: const Text(
                                                  'Rester indépendant'),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                setState(() {
                                                  selectedPartiIndex = index;
                                                });
                                                RxMap<String, dynamic>
                                                    selectedParty =
                                                    RxMap<String, dynamic>.from(
                                                  CreateNewGameController.to
                                                      .selectedparties[index],
                                                );
                                                CreateNewGameController.to
                                                    .setSelectedParti(
                                                        selectedParty);
                                                toggleContent();
                                              },
                                              child: const Text('Choisir'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                             if (CreateNewGameController.to.selectedparties.length >= 2 ) Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3A86BB),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: Color(0xff0F2140),
                                    ),
                                    onPressed: next,
                                  ),
                                ),
                              ),
                             if (CreateNewGameController.to.selectedparties.length >= 2 ) Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff3A86BB),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      size: 15,
                                      color: Color(0xff0F2140),
                                    ),
                                    onPressed: prev,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
          ],
        ),
      )),
    );
  }

  void next() {
    controller.nextPage(duration: Duration(milliseconds: 500));
  }

  void prev() {
    controller.previousPage(duration: Duration(milliseconds: 500));
  }
}
