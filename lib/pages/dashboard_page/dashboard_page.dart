// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatTimeDifference(String datetimeString) {
  DateTime sentDatetime = DateTime.parse(datetimeString);
  DateTime currentDatetime = DateTime.now();
  Duration timeDifference = currentDatetime.difference(sentDatetime);

  if (timeDifference.inDays > 365) {
    int yearsDifference = (timeDifference.inDays / 365).floor();
    return 'Il y a ${yearsDifference} an${yearsDifference > 1 ? 's' : ''}';
  } else if (timeDifference.inDays > 31) {
    int monthsDifference = (timeDifference.inDays / 30).floor();
    return 'Il y a ${monthsDifference} mois';
  } else if (timeDifference.inDays > 7) {
    int weeksDifference = (timeDifference.inDays / 7).floor();
    return 'Il y a ${weeksDifference} semaine${weeksDifference > 1 ? 's' : ''}';
  } else {
    int daysDifference = timeDifference.inDays;
    int remainingHours = (timeDifference.inHours % 24).toInt();
    String result = '';
    if (daysDifference > 0) {
      result += '${daysDifference} jour${daysDifference > 1 ? 's' : ''} ';
    }
    if (remainingHours > 0) {
      result += '${remainingHours} heure${remainingHours > 1 ? 's' : ''}';
    }
    return result.isNotEmpty ? 'Il y a $result' : 'Moins d\'une heure';
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int selectedEvent = 0;
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 4,
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
                        'Actualités',
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
                  'Actualités',
                  style: kBold,
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  decoration: kBoxFill,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromRGBO(35, 71, 138, 0.0),
                              width: 2,
                            ),
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Réseaux Sociaux',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 430,
                                child: ListView.builder(
                                  itemCount:
                                      DashboardController.to.events.length,
                                  itemBuilder: (context, index) {
                                    final event =
                                        DashboardController.to.events[index];
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Color(0XFF172F5C)),
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Image.asset(
                                                event['new'].social_media_name ==
                                                        'twitter'
                                                    ? "assets/tw.png"
                                                    : "assets/fb.png",
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          event['new']
                                                              .author_name,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          formatTimeDifference(
                                                              event['newsent']
                                                                  .sent_datetime),
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff9E9E9E),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 7),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  MyRichText(
                                                    originalText:
                                                        event['new'].title,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/jaime.png'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '${event['new'].like_number}',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff9E9E9E),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 7),
                                                      ),
                                                    ],
                                                  )
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
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              'Responsables actualités',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                            Text(
                              'Voici les actualités du moment',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Image.asset(
                              'assets/news.png',
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFF23478A),
                                width: 2,
                              ),
                              color: Color(0xFFDEDEDE),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(10, 7),
                                  blurRadius: 0,
                                  spreadRadius: 0,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                ),
                              ],
                            ),
                            child: DashboardController.to.newsData.isNotEmpty
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'DAILY NEWS',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  shadows: [
                                                    Shadow(
                                                      offset: Offset(0, 4),
                                                      blurRadius: 4,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.25),
                                                    ),
                                                  ],
                                                  fontFamily: 'Moul',
                                                  fontSize: 60,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                DashboardController.to
                                                        .newsData[0]['title'] ??
                                                    '',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 24,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: MyRichText2(
                                                originalText:
                                                    DashboardController
                                                                .to.newsData[0]
                                                            ['content'] ??
                                                        '',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                'Auteur : ${DashboardController.to.newsData[0]['author_first_name'] ?? ''} ${DashboardController.to.newsData[0]['author_last_name'] ?? ''}',
                                                style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(),
                          ))
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
}

class MyRichText2 extends StatelessWidget {
  final String originalText;

  MyRichText2({required this.originalText});
  @override
  Widget build(BuildContext context) {
    List<String> parts = originalText.split(RegExp(r'#'));
    List<TextSpan> textSpans = List<TextSpan>.generate(parts.length, (index) {
      if (index == 0) {
        return TextSpan(
            text: parts[index],
            style: TextStyle(
              color: Color(0xFF000000),
              fontFamily: 'Poppins',
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
            ));
      } else {
        String hashtag = '#${parts[index]}';
        return TextSpan(
          text: hashtag,
          style: TextStyle(
            color: Color(0xff138EFF),
            fontFamily: 'Poppins',
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          ),
        );
      }
    });

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  final String originalText;

  MyRichText({required this.originalText});
  @override
  Widget build(BuildContext context) {
    List<String> parts = originalText.split(RegExp(r'#'));
    List<TextSpan> textSpans = List<TextSpan>.generate(parts.length, (index) {
      if (index == 0) {
        return TextSpan(
          text: parts[index],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        );
      } else {
        String hashtag = '#${parts[index]}';
        return TextSpan(
          text: hashtag,
          style: TextStyle(
            color: Color(0xff138EFF),
            fontWeight: FontWeight.w300,
          ),
        );
      }
    });

    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
    );
  }
}
