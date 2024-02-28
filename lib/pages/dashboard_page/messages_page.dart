// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/pages/dashboard_page/palais_pres2.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/messages_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({
    super.key,
  });

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  int selectedMsg = -1;
  int selectedRes = -1;
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 3,
        child: Expanded(child: Navigator(
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(
                builder: (context) => Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Boîte de réception',
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
                        'Boîte de réception',
                        style: kBold,
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: kBoxFill,
                              child: Column(children: [
                                Expanded(
                                    child: SizedBox(
                                  height: 450,
                                  child: ListView.builder(
                                    itemCount:
                                        DashboardController.to.messages.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final msg = DashboardController
                                          .to.messages[index];

                                      return GestureDetector(
                                        onTap: () async {
                                          await MessagesRepo().updateMessages(
                                            msg['message_id'],
                                          );
                                          await DashboardController.to
                                              .fetchMessages(DashboardController
                                                  .to
                                                  .currentGame
                                                  .value
                                                  .country_id);
                                          await DashboardController.to
                                              .fetchMessagesResponses(
                                                  msg['message_id']);
                                          setState(() {
                                            selectedMsg = index;
                                            selectedRes = -1;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: selectedMsg == index
                                                  ? Color(0XFF2A62A4)
                                                  : Color(0XFF5D7AAE),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff0F2140),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Président de ${msg['country_name']}',
                                                          style: TextStyle(
                                                            fontSize: 7,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              height: 100,
                                                              child: Image
                                                                  .asset(msg[
                                                                      'image_path']),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              bottom: 0,
                                                              child: Container(
                                                                width: 40,
                                                                height: 40,
                                                                child: SvgPicture
                                                                    .asset(msg[
                                                                        'flag_img_path']),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 20,
                                                          width: 130,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xff3C5F89),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Stack(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            children: [
                                                              Container(
                                                                height: 20,
                                                                width: (130 /
                                                                        100) *
                                                                    msg['relation'],
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xffF24261),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
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
                                                                            5),
                                                                    Text(
                                                                      '${msg['relation']}%',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            10,
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
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              msg['title'],
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SvgPicture.asset(
                                                              msg['is_opened'] ==
                                                                      1
                                                                  ? "assets/lu.svg"
                                                                  : "assets/non lu.svg",
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          msg['content'],
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w300,
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
                                      );
                                    },
                                  ),
                                )),
                              ]),
                            ),
                          ),
                          const SizedBox(width: kHorizontalPadding),
                          selectedMsg != -1
                              ? Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: kBoxFill,
                                      child:
                                          DashboardController
                                                  .to.messages.isNotEmpty
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Image.asset(
                                                            'assets/msg.png',
                                                            height: 120,
                                                            width: 120,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            width: 200,
                                                            height: 100,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/msg_bg.png'))),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  'Responsable boîte de reception',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                Text(
                                                                  'Vous avez ${DashboardController.to.messages.length} nouveaux messages',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator
                                                                  .pushNamed(
                                                                context,
                                                                '/palais',
                                                                arguments: {
                                                                  'countryId': DashboardController
                                                                              .to
                                                                              .messages[
                                                                          selectedMsg]
                                                                      [
                                                                      'country_id'],
                                                                  'personImg': DashboardController
                                                                              .to
                                                                              .messages[
                                                                          selectedMsg]
                                                                      [
                                                                      'image_path'],
                                                                  'personFName':
                                                                      DashboardController
                                                                              .to
                                                                              .messages[selectedMsg]
                                                                          [
                                                                          'first_name'],
                                                                  'personLName':
                                                                      DashboardController
                                                                              .to
                                                                              .messages[selectedMsg]
                                                                          [
                                                                          'last_name'],
                                                                  'countryName':
                                                                      DashboardController
                                                                              .to
                                                                              .messages[selectedMsg]
                                                                          [
                                                                          'country_name'],
                                                                  'countryImg':
                                                                      DashboardController
                                                                              .to
                                                                              .messages[selectedMsg]
                                                                          [
                                                                          'flag_img_path'],
                                                                  'popNumber': DashboardController
                                                                              .to
                                                                              .messages[
                                                                          selectedMsg]
                                                                      [
                                                                      'population_number'],
                                                                  'currency': DashboardController
                                                                              .to
                                                                              .messages[
                                                                          selectedMsg]
                                                                      [
                                                                      'currency'],
                                                                  'map': DashboardController
                                                                              .to
                                                                              .messages[
                                                                          selectedMsg]
                                                                      [
                                                                      'map_img_path'],
                                                                  'pib': DashboardController
                                                                              .to
                                                                              .messages[
                                                                          selectedMsg]
                                                                      [
                                                                      'pib_amount'],
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      0xffBED5FF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              margin: EdgeInsets
                                                                  .all(10),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          color: Color(
                                                                              0xff0F2140),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              5),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Text(
                                                                            'Président de ${DashboardController.to.messages[selectedMsg]['country_name']}',
                                                                            style: TextStyle(
                                                                                fontSize: 7,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: 50,
                                                                                height: 50,
                                                                                child: Image.asset(DashboardController.to.messages[selectedMsg]['image_path']),
                                                                              ),
                                                                              Positioned(
                                                                                right: 0,
                                                                                bottom: 0,
                                                                                child: Container(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  child: SvgPicture.asset(DashboardController.to.messages[selectedMsg]['flag_img_path']),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                10,
                                                                            width:
                                                                                60,
                                                                            decoration:
                                                                                BoxDecoration(color: Color(0xff3C5F89), borderRadius: BorderRadius.circular(20)),
                                                                            child:
                                                                                Stack(
                                                                              alignment: Alignment.centerLeft,
                                                                              children: [
                                                                                Container(
                                                                                  height: 10,
                                                                                  width: (60 / 100) * (DashboardController.to.messages[selectedMsg]['relation']),
                                                                                  decoration: BoxDecoration(color: Color(0xffF24261), borderRadius: BorderRadius.circular(20)),
                                                                                ),
                                                                                Center(
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Image.asset('assets/like.png'),
                                                                                      SizedBox(
                                                                                        width: 5,
                                                                                      ),
                                                                                      Text(
                                                                                        '${DashboardController.to.messages[selectedMsg]['relation']}%',
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
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Expanded(
                                                                    flex: 4,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                "De : Président de ${DashboardController.to.messages[selectedMsg]['country_name']}",
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Text(
                                                                                "Date: ${DashboardController.to.messages[selectedMsg]['date']}",
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: 16,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                          'Objet : ${DashboardController.to.messages[selectedMsg]['title']}',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                10),
                                                                        Text(
                                                                          DashboardController
                                                                              .to
                                                                              .messages[selectedMsg]['content'],
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        15),
                                                            child: Align(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  'Réponse : ',
                                                                  style: kP2,
                                                                )),
                                                          ),
                                                          if (DashboardController
                                                              .to
                                                              .messagesRes
                                                              .isNotEmpty)
                                                            DashboardController
                                                                            .to
                                                                            .messages[selectedMsg]
                                                                        [
                                                                        'response_id'] ==
                                                                    null
                                                                ? Expanded(
                                                                    child: GridView
                                                                        .builder(
                                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            10,
                                                                        mainAxisSpacing:
                                                                            10,
                                                                        mainAxisExtent:
                                                                            100),
                                                                    itemCount: DashboardController
                                                                        .to
                                                                        .messagesRes
                                                                        .length,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            int index) {
                                                                      final res =
                                                                          DashboardController
                                                                              .to
                                                                              .messagesRes[index];
                                                                      return InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          setState(
                                                                              () {
                                                                            selectedRes =
                                                                                index;
                                                                          });
                                                                          await DashboardController
                                                                              .to
                                                                              .fetchMessagesResponsesEffects(res['id']);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: selectedRes == index
                                                                                ? Color(0XFF254272)
                                                                                : Color(0XFF0F2140),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            border:
                                                                                Border.all(
                                                                              color: kStrokeColor,
                                                                              width: 2,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Center(
                                                                                child: Text(
                                                                                  res['content'],
                                                                                  style: TextStyle(
                                                                                    color: selectedRes == index ? Color(0xfffFffFF) : Color(0xff4365A0),
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ))
                                                                : Container(
                                                                    margin: EdgeInsets
                                                                        .symmetric(
                                                                            horizontal:
                                                                                100),
                                                                    width: double
                                                                        .infinity,
                                                                    height: 100,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0XFF254272),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color:
                                                                            kStrokeColor,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                    child: DashboardController.to.messages[selectedMsg]['response_id'] !=
                                                                            null
                                                                        ? Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Center(
                                                                                child: Text(
                                                                                  // Using null-aware operators to handle possible null values
                                                                                  DashboardController.to.messagesRes.firstWhere(
                                                                                        (item) => item['id'] == DashboardController.to.messages[selectedMsg]['response_id'],
                                                                                        orElse: () => {},
                                                                                      )['content'] ??
                                                                                      'Default Text',
                                                                                  style: TextStyle(
                                                                                    color: Color(0xfffFffFF),
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        : Column()),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    100),
                                                        child: DashboardController
                                                                    .to
                                                                    .messagesRes
                                                                    .isNotEmpty &&
                                                                selectedRes !=
                                                                    -1
                                                            ? Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  DashboardController
                                                                              .to
                                                                              .messagesResEffects
                                                                              .isNotEmpty &&
                                                                          DashboardController.to.messages[selectedMsg]['response_id'] ==
                                                                              null
                                                                      ? Expanded(
                                                                          child:
                                                                              SizedBox(
                                                                            height:
                                                                                80,
                                                                            child:
                                                                                ListView.builder(
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: DashboardController.to.messagesResEffects.length,
                                                                              itemBuilder: (BuildContext context, int index) {
                                                                                final effect = DashboardController.to.messagesResEffects[index];
                                                                                return Container(
                                                                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                                                                  height: 80,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      SvgPicture.asset(effect['logo_path'], width: 30),
                                                                                      Text(effect['label'], style: kP3),
                                                                                      Container(
                                                                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                                                                        decoration: BoxDecoration(
                                                                                          color: kGreenColor,
                                                                                          borderRadius: BorderRadius.circular(15),
                                                                                        ),
                                                                                        child: Text(
                                                                                          effect['per_round_type'] == 'positif' ? '+${effect['per_round_change']}' : '-${effect['per_round_change']}',
                                                                                          style: kMouvStyle,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                  if (DashboardController
                                                                              .to
                                                                              .messages[selectedMsg]
                                                                          [
                                                                          'response_id'] ==
                                                                      null)
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            80,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Stack(
                                                                              alignment: Alignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  width: 30,
                                                                                  height: 30,
                                                                                  child: SvgPicture.asset(Images.population, width: 30),
                                                                                ),
                                                                                Positioned(
                                                                                  right: 0,
                                                                                  bottom: 0,
                                                                                  child: Container(
                                                                                    width: 15,
                                                                                    height: 15,
                                                                                    child: SvgPicture.asset(DashboardController.to.messages[selectedMsg]['flag_img_path']),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Text(
                                                                              "Relation ${DashboardController.to.messages[selectedMsg]['country_name']}",
                                                                              style: kP3,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                                                              decoration: BoxDecoration(
                                                                                color: kGreenColor,
                                                                                borderRadius: BorderRadius.circular(15),
                                                                              ),
                                                                              child: Text(
                                                                                '+${DashboardController.to.messagesRes[selectedRes]['relationship_strength']}%',
                                                                                style: kMouvStyle,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )
                                                                ],
                                                              )
                                                            : Container()),
                                                    DashboardController.to
                                                                        .messages[
                                                                    selectedMsg]
                                                                [
                                                                'response_id'] ==
                                                            null
                                                        ? InkWell(
                                                            onTap: () async {
                                                              RxList<
                                                                      Map<String,
                                                                          dynamic>>
                                                                  effects =
                                                                  <Map<String, dynamic>>[]
                                                                      .obs;

                                                              if (DashboardController
                                                                      .to
                                                                      .messages
                                                                      .isNotEmpty &&
                                                                  selectedRes !=
                                                                      -1) {
                                                                await MessagesRepo().updateResponse(
                                                                    DashboardController
                                                                            .to
                                                                            .messagesRes[selectedRes]
                                                                        ['id'],
                                                                    DashboardController
                                                                            .to
                                                                            .messages[selectedMsg]
                                                                        [
                                                                        'message_id']);

                                                                effects.value = await CountryEffectsRepo().getMessagesResponsesEffects(
                                                                    DashboardController
                                                                            .to
                                                                            .messagesRes[selectedRes]
                                                                        ['id']);

                                                                for (var effect
                                                                    in effects) {
                                                                  await CountryEffectsRepo().updateResponseEffects(
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
                                                                    .fetchCountryDatas(DashboardController
                                                                        .to
                                                                        .currentGame
                                                                        .value
                                                                        .country_id);
                                                                await DashboardController
                                                                    .to
                                                                    .fetchMessages(DashboardController
                                                                        .to
                                                                        .currentGame
                                                                        .value
                                                                        .country_id);

                                                                setState(() {
                                                                  hide = true;
                                                                });
                                                                // ignore: use_build_context_synchronously
                                                                toastification
                                                                    .show(
                                                                  context:
                                                                      context,
                                                                  title:
                                                                      'Success',
                                                                  showProgressBar:
                                                                      false,
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xff19BE99),
                                                                  autoCloseDuration:
                                                                      const Duration(
                                                                          seconds:
                                                                              3),
                                                                );
                                                              }
                                                            },
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          35,
                                                                      vertical:
                                                                          15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xff0CA0F3),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    border: Border.all(
                                                                        color: Color(
                                                                            0xff30538C)),
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
                                                                    ],
                                                                  ),
                                                                  child: Text(
                                                                      "Envoyer"),
                                                                ),
                                                              ],
                                                            ))
                                                        : Container()
                                                  ],
                                                )
                                              : const Column()),
                                )
                              : Expanded(
                                  child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: kBoxFill,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              'assets/msg.png',
                                              height: 120,
                                              width: 120,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              width: 200,
                                              height: 100,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/msg_bg.png'))),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Responsable boîte de reception',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    'Vous avez ${DashboardController.to.messages.length} nouveaux messages',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (settings.name == '/palais') {
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
}
