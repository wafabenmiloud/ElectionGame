// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/models/promise_model.dart';

import 'package:gamev2/pages/political_part.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/widgets/page_padding.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
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

  @override
  Widget build(BuildContext context) {
    bool _canSelectPromise(PromiseModel promise) {
      final selectedPromises = CreateNewGameController.to.selectedpromises;
      final levelCount = selectedPromises
          .where((selectedPromise) => selectedPromise.level == promise.level)
          .length;

      if (promise.level == 3) {
        return levelCount < 3;
      } else if (promise.level == 2) {
        return levelCount < 3;
      } else if (promise.level == 1) {
        return levelCount < 4;
      } else {
        return false;
      }
    }

    return Scaffold(
      body: PagePadding(
          child: Obx(() => Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  width: double.infinity,
                                  decoration: kBoxFill,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          "Choisir 10 promesses",
                                          style: kSemiBold,
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: CreateNewGameController
                                              .to.promises.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final promise =
                                                CreateNewGameController
                                                    .to.promises[index];
                                            final isPromiseSelected =
                                                CreateNewGameController
                                                    .to.selectedpromises
                                                    .contains(promise);
                                            final isSelectionDisabled =
                                                CreateNewGameController
                                                        .to
                                                        .selectedpromises
                                                        .length ==
                                                    10;
                                            final isAddOptionDisabled =
                                                isSelectionDisabled &&
                                                    !isPromiseSelected;

                                            return GestureDetector(
                                              onTap: () {
                                                if (!isAddOptionDisabled) {
                                                  if (isPromiseSelected) {
                                                    CreateNewGameController
                                                        .to.selectedpromises
                                                        .remove(promise);
                                                  } else {
                                                    if (_canSelectPromise(
                                                        promise)) {
                                                      CreateNewGameController
                                                          .to.selectedpromises
                                                          .add(promise);
                                                    } else {
                                                      toastification.show(
                                                        context: context,
                                                        title: 'You can only select 3 promises of level 3, 3 promises of level 2, and 4 promises of level 1.',
                                                        showProgressBar: false,
                                                        backgroundColor: Colors.red
                                                                  .withOpacity(
                                                                      0.5),
                                                        autoCloseDuration:
                                                            const Duration(
                                                                seconds: 5),
                                                      );
                                                    
                                                    }
                                                  }
                                                }
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2,
                                                    horizontal: 20),
                                                margin: isPromiseSelected
                                                    ? EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        left: 45,
                                                        right: 5)
                                                    : EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 20),
                                                decoration: BoxDecoration(
                                                  color: isPromiseSelected
                                                      ? Color(0xff236A62)
                                                      : Color(0xff233c6a),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    topRight:
                                                        Radius.circular(10.0),
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        promise.content,
                                                        style: kMouvStyle,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 5,
                                                                horizontal: 15),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF254272),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                                              offset:
                                                                  Offset(0, 13),
                                                              blurRadius: 35,
                                                              spreadRadius: -1,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 15,
                                                                width: 15,
                                                                decoration: BoxDecoration(
                                                                    color: getColorForLevel(
                                                                        promise
                                                                            .level),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100)),
                                                              ),
                                                            ),
                                                            SizedBox(width: 5),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Text(
                                                                '${(CreateNewGameController.to.promises[index].duration_days / 30).round()} mois',
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
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
                                width: 100,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  width: double.infinity,
                                  decoration: kBoxFill,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          "Liste des promesses",
                                          style: kSemiBold,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 15,
                                        child: ListView.builder(
                                          itemCount: CreateNewGameController
                                              .to.selectedpromises.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final selectedpromise =
                                                CreateNewGameController
                                                    .to.selectedpromises[index];

                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 30),
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
                                                  Expanded(
                                                    flex: 4,
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 6,
                                                                    horizontal:
                                                                        11),
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
                                                                  offset:
                                                                      Offset(0,
                                                                          13),
                                                                  blurRadius:
                                                                      35,
                                                                  spreadRadius:
                                                                      -1,
                                                                ),
                                                              ],
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "${index + 1}",
                                                                style:
                                                                    kMouvStyle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          flex: 13,
                                                          child: Text(
                                                            selectedpromise
                                                                .content,
                                                            style: kMouvStyle,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5,
                                                              horizontal: 25),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF254272),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
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
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              height: 15,
                                                              width: 15,
                                                              decoration: BoxDecoration(
                                                                  color: getColorForLevel(
                                                                      selectedpromise
                                                                          .level),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100)),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Text(
                                                              '${(CreateNewGameController.to.selectedpromises[index].duration_days / 30).round()} mois',
                                                              style: kMouvStyle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 35),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF254272),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xff136BFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      "${CreateNewGameController.to.selectedpromises.where((promise) => promise.level == 3).length}/3",
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
                                                    vertical: 5,
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF254272),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffffaf13),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      "${CreateNewGameController.to.selectedpromises.where((promise) => promise.level == 2).length}/3",
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
                                                    vertical: 5,
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF254272),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xfff24261),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      "${CreateNewGameController.to.selectedpromises.where((promise) => promise.level == 1).length}/4",
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Annuler'),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final selectedPromises =
                                      CreateNewGameController
                                          .to.selectedpromises;
                                  if (selectedPromises.length == 10) {
                                    await CreateNewGameController.to
                                        .selectPoliticalParties();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => PoliticalPart(),
                                    ));
                                  } else {
                                     toastification.show(
                                                        context: context,
                                                        title: 'Please select exactly 10 promises.',
                                                        showProgressBar: false,
                                                        backgroundColor: Colors.red
                                                                  .withOpacity(
                                                                      0.5),
                                                        autoCloseDuration:
                                                            const Duration(
                                                                seconds: 5),
                                                      );
                                  }
                                },
                                child: const Text('Continuer'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }
}
