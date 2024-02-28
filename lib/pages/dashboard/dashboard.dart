import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/models/country_laws_model.dart';
import 'package:gamev2/pages/dashboard_page/Demog.dart';
import 'package:gamev2/pages/dashboard_page/Diplomatie.dart';
import 'package:gamev2/pages/dashboard/navigation.dart';
import 'package:gamev2/pages/dashboard_page/Banque.dart';
import 'package:gamev2/pages/dashboard_page/Calendrier.dart';
import 'package:gamev2/pages/dashboard_page/Conseiller.dart';
import 'package:gamev2/pages/dashboard_page/Industries.dart';
import 'package:gamev2/pages/dashboard_page/Marche.dart';
import 'package:gamev2/pages/dashboard_page/Politique.dart';
import 'package:gamev2/pages/dashboard_page/Ressorces.dart';
import 'package:gamev2/pages/dashboard_page/Statistiques.dart';
import 'package:gamev2/pages/dashboard_page/dashboard_page.dart';
import 'package:gamev2/pages/dashboard_page/messages_page.dart';
import 'package:gamev2/pages/dashboard_page/palais_pres.dart';
import 'package:gamev2/pages/dashboard_page/parlment_page.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/country_laws.dart';
import 'package:gamev2/repositories/current_game_repo.dart';
import 'package:gamev2/repositories/ministers_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'custom_top_bar.dart';

int n = 0;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kHorizontalPadding / 2,
        ),
        child: Row(
          children: [
            Navigation(),
            SizedBox(
              width: kHorizontalPadding,
            ),
            Expanded(
              child: Column(
                children: [
                  CustomTopBar(),
                  SizedBox(height: kHorizontalPadding / 2),
                  CountryDatas(),
                  SizedBox(height: kHorizontalPadding),
                  Palais(),
                  GovernmentPage(),
                  Conseiller(),
                  MessagesPage(),
                  DashboardPage(),
                  ParlmentPage(),
                  Banque(),
                  Diplomatie(),
                  Politique(),
                  Ressorces(),
                  Industries(),
                  Marche(),
                  Demog(),
                  Calendrier(),
                  Statistiques()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GovernmentPage extends StatefulWidget {
  const GovernmentPage({
    super.key,
  });

  @override
  State<GovernmentPage> createState() => _GovernmentPageState();
}

class _GovernmentPageState extends State<GovernmentPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 1,
        child: Expanded(
          child: Navigator(
            onGenerateRoute: (settings) {
              if (settings.name == '/') {
                return MaterialPageRoute(
                    builder: (context) => GovernmentContent());
              } else if (settings.name == '/defense') {
                setState(() {
                  n = 0;
                });

                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Défense',
                          pageImage: 'assets/ministres/defense2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/economie') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Economie & Travail',
                          pageImage: 'assets/ministres/eco2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/sport') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Sport & Culture',
                          pageImage: 'assets/ministres/sport2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/sante') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Santé & Social',
                          pageImage: 'assets/ministres/sante2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/energie') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Energie & Transports',
                          pageImage: 'assets/ministres/energie2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/diplomatie') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Diplomatie',
                          pageImage: 'assets/ministres/diplom2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/education') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Education',
                          pageImage: 'assets/ministres/education2.png',
                        );
                      }
                    },
                  ),
                );
              } else if (settings.name == '/interieur') {
                setState(() {
                  n = 0;
                });
                var ministerId = settings.arguments as int;
                Future<List<CountryLawsModel>> laws =
                    DashboardController.to.getLaws(ministerId);
                return MaterialPageRoute(
                  builder: (context) => FutureBuilder<List<CountryLawsModel>>(
                    future: laws,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return LawsPage(
                          id: ministerId,
                          countryLaws: snapshot.data!,
                          pageTitle: 'Intérieur',
                          pageImage: 'assets/ministres/inter2.png',
                        );
                      }
                    },
                  ),
                );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class GovernmentContent extends StatefulWidget {
  @override
  _GovernmentContentState createState() => _GovernmentContentState();
}

class _GovernmentContentState extends State<GovernmentContent> {
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
                onTap: () {},
                child: Text(
                  'Gouvernement',
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
            'Gouvernement & Ministres',
            style: kBold,
          ),
        ),
        Expanded(
          flex: 15,
          child: Container(
            width: double.infinity,
            decoration: kBoxFill,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: 240 / 220,
              padding: const EdgeInsets.all(kHorizontalPadding),
              shrinkWrap: true,
              children: List.generate(
                DashboardController.to.countryMinisters.length,
                (index) {
                  final minister =
                      DashboardController.to.countryMinisters[index];
                  return GestureDetector(
                    onTap: () {
                      if (minister.name == "Défense") {
                        Navigator.pushNamed(context, '/defense',
                            arguments: minister.id);
                      }
                      if (minister.name == "Economie & Travail") {
                        Navigator.pushNamed(context, '/economie',
                            arguments: minister.id);
                      }
                      if (minister.name == "Sport & Culture") {
                        Navigator.pushNamed(context, '/sport',
                            arguments: minister.id);
                      }
                      if (minister.name == "Santé & Social") {
                        Navigator.pushNamed(context, '/sante',
                            arguments: minister.id);
                      }
                      if (minister.name == "Energie & Transports") {
                        Navigator.pushNamed(context, '/energie',
                            arguments: minister.id);
                      }
                      if (minister.name == "Diplomatie") {
                        Navigator.pushNamed(context, '/diplomatie',
                            arguments: minister.id);
                      }
                      if (minister.name == "Education") {
                        Navigator.pushNamed(context, '/education',
                            arguments: minister.id);
                      }
                      if (minister.name == "Intérieur") {
                        Navigator.pushNamed(context, '/interieur',
                            arguments: minister.id);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: kBoxFill,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                minister.name,
                                style: const TextStyle(
                                  color: kWhiteBlueishColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Image.asset(
                              minister.img_path,
                              width: 100,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kGreenColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: kCardPadding / 2,
                                    child: Text(
                                      '${minister.profits / 1000000000}md\$',
                                      style: kMouvStyle,
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
          ),
        ),
      ],
    );
  }
}

class LawsPage extends StatefulWidget {
  final List<CountryLawsModel> countryLaws;
  final String pageTitle;
  final String pageImage;
  final int id;
  const LawsPage(
      {Key? key,
      required this.id,
      required this.countryLaws,
      required this.pageTitle,
      required this.pageImage})
      : super(key: key);

  @override
  _LawsPageState createState() => _LawsPageState();
}

class _LawsPageState extends State<LawsPage> {
  int selectedLaw = 0;
  bool isHovered = false;

  Map<String, dynamic>? data;
  List<Map<String, dynamic>> lawsEffects = [];
  int newDefValue = 0;
  bool check = false;
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    try {
      if (widget.countryLaws.isNotEmpty) {
        final effects = await CountryEffectsRepo()
            .getLawsEffects(widget.countryLaws[selectedLaw].id);

        setState(() {
          lawsEffects = effects;
          newDefValue = widget.countryLaws[selectedLaw].default_value;
        });
      }
      final result =
          await CountryMinistersRepo().getMinisterFinancials(widget.id);
      setState(() {
        data = result;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<bool> doesParlementLawExist() async {
    return await CountryLawsRepo()
        .doesParlementLawExist(widget.countryLaws[selectedLaw].id);
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
          flex: 1,
          child: Text(
            widget.pageTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kWhiteBlueishColor,
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: kBoxFill,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: ListView.builder(
                                      itemCount: widget.countryLaws.length,
                                      itemBuilder: (context, index) {
                                        final law = widget.countryLaws[index];

                                        return InkWell(
                                          onTap: () async {
                                            setState(() {
                                              selectedLaw = index;

                                              n = 0;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: selectedLaw == index
                                                  ? Color(0XFF3A86BB)
                                                  : Color(0xff0F2140),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  law.name,
                                                  style: TextStyle(
                                                    color: selectedLaw == index
                                                        ? Color(0xff172F5C)
                                                        : Color(0xffBFD6FF),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Image.asset(
                                  widget.pageImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                widget.countryLaws[selectedLaw]
                                                    .name,
                                                style: TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 26,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              widget.countryLaws[selectedLaw]
                                                  .description,
                                              style: TextStyle(
                                                color: Color(0xffBFD6FF),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            FutureBuilder<bool>(
                                              future: doesParlementLawExist(),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.done) {
                                                  bool lawExists =
                                                      snapshot.data ?? false;
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap: !lawExists
                                                                ? () {
                                                                    int maxAllowedValue = widget
                                                                            .countryLaws[
                                                                                selectedLaw]
                                                                            .default_value ~/
                                                                        widget
                                                                            .countryLaws[selectedLaw]
                                                                            .value_per_slice;
                                                                    if (n >
                                                                        -maxAllowedValue) {
                                                                      setState(
                                                                          () {
                                                                        n--;
                                                                        newDefValue =
                                                                            widget.countryLaws[selectedLaw].default_value +
                                                                                (n * widget.countryLaws[selectedLaw].value_per_slice);
                                                                      });
                                                                      if (newDefValue <
                                                                          widget
                                                                              .countryLaws[selectedLaw]
                                                                              .value_min) {
                                                                        setState(
                                                                            () {
                                                                          n++;
                                                                        });
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          newDefValue =
                                                                              widget.countryLaws[selectedLaw].default_value + (n * widget.countryLaws[selectedLaw].value_per_slice);
                                                                        });
                                                                      }
                                                                    }
                                                                  }
                                                                : null,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10),
                                                              width: 30,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff0CA0F3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '-',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff0F2140),
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            width: 130,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xff6BA2FF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                '${newDefValue}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff0F2140),
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            width: 30,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xff6BA2FF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                '${widget.countryLaws[selectedLaw].value_type}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff0F2140),
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: !lawExists
                                                                ? () {
                                                                    int maxAllowedValue = widget
                                                                            .countryLaws[
                                                                                selectedLaw]
                                                                            .default_value ~/
                                                                        widget
                                                                            .countryLaws[selectedLaw]
                                                                            .value_per_slice;

                                                                    if (n <
                                                                        maxAllowedValue) {
                                                                      setState(
                                                                          () {
                                                                        n++;
                                                                        newDefValue =
                                                                            widget.countryLaws[selectedLaw].default_value +
                                                                                (n * widget.countryLaws[selectedLaw].value_per_slice);
                                                                      });
                                                                      if (newDefValue >
                                                                          widget
                                                                              .countryLaws[selectedLaw]
                                                                              .value_max) {
                                                                        n--;
                                                                      } else {
                                                                        setState(
                                                                            () {
                                                                          newDefValue =
                                                                              widget.countryLaws[selectedLaw].default_value + (n * widget.countryLaws[selectedLaw].value_per_slice);
                                                                        });
                                                                      }
                                                                    }
                                                                  }
                                                                : null,
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10),
                                                              width: 30,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xff0CA0F3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  '+',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff0F2140),
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              height: 80,
                                                              child: ListView
                                                                  .builder(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    lawsEffects
                                                                        .length,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  final effect =
                                                                      lawsEffects[
                                                                          index];
                                                                  return Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    height: 80,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          effect[
                                                                              'logo_path'],
                                                                          width:
                                                                              30,
                                                                        ),
                                                                        Text(
                                                                          effect[
                                                                              'label'],
                                                                          style:
                                                                              kP3,
                                                                        ),
                                                                        Container(
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: 12,
                                                                              vertical: 4),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: effect['per_round_type'] == 'positif'
                                                                                ? kGreenColor
                                                                                : kRedColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            effect['per_round_type'] == 'positif'
                                                                                ? '+${effect['per_round_change']}'
                                                                                : '-${effect['per_round_change']}',
                                                                            style:
                                                                                kMouvStyle,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: 150,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/star.svg'),
                                                                  Text(
                                                                    '-${widget.countryLaws[selectedLaw].points_per_slice}',
                                                                    style:
                                                                        kMouvStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        onTap: !lawExists
                                                            ? () async {
                                                                await CountryLawsRepo().insertParlementLaw(
                                                                    widget
                                                                        .countryLaws[
                                                                            selectedLaw]
                                                                        .id,
                                                                    'WAITING',
                                                                    widget
                                                                        .countryLaws[
                                                                            selectedLaw]
                                                                        .default_value,
                                                                    newDefValue);
                                                                await DashboardController
                                                                    .to
                                                                    .fetchParlments();
                                                                CountryLawsRepo()
                                                                    .updateCountryLaws(
                                                                  widget
                                                                      .countryLaws[
                                                                          selectedLaw]
                                                                      .id,
                                                                  newDefValue,
                                                                  n,
                                                                );
                                                                for (var effect
                                                                    in lawsEffects) {
                                                                  await CountryEffectsRepo().updateLawsEffects(
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

                                                                await CurrentGameRepo().updatePoints(
                                                                    DashboardController
                                                                        .to
                                                                        .currentGame
                                                                        .value
                                                                        .id!,
                                                                    n,
                                                                    widget
                                                                        .countryLaws[
                                                                            selectedLaw]
                                                                        .points_per_slice);
                                                                await DashboardController
                                                                    .to
                                                                    .fetchGame();
                                                                setState(() {
                                                                  check = true;
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
                                                                  backgroundColor: Color(
                                                                            0xff19BE99)
                                                                       ,
                                                                  autoCloseDuration:
                                                                      const Duration(
                                                                          seconds:
                                                                              3),
                                                                );
                                                              
                                                              }
                                                            : null,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30,
                                                                  vertical: 15),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: lawExists
                                                                ? Color(
                                                                    0xff5D7AAE)
                                                                : Color(
                                                                    0xff0CA0F3),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xff30538C),
                                                            ),
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
                                                          child: Text(
                                                            lawExists
                                                                ? "Loi en cours de modification"
                                                                : "Envoyer au parlement",
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return const CircularProgressIndicator();
                                                }
                                              },
                                            ),
                                          ],
                                        )),
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
              const SizedBox(width: kHorizontalPadding),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: kBoxFill,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Finances',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      buildFinancesRow(
                          'Revenus',
                          data != null
                              ? '${(data!['incomes'] / 1000000000).toStringAsFixed(2)}Md\$'
                              : '0',
                          kGreenColor),
                      buildFinancesRow(
                          'Dépences',
                          data != null
                              ? '${(data!['expenses'] / 1000000000).toStringAsFixed(2)}Md\$'
                              : '0',
                          kRedColor),
                      SizedBox(
                        height: 100,
                      ),
                      buildFinancesRow(
                          'Benefice',
                          data != null
                              ? '${(data!['profits'] / 1000000000).toStringAsFixed(2)}Md\$'
                              : '0',
                          kGreenColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFinancesRow(String title, String amount, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff0F2140),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xffBFD6FF),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                amount,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountryDatas extends StatelessWidget {
  const CountryDatas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color progressBarColor = Colors.blue;
    String ideology = "center";

    if (DashboardController.to.ideology.obs.value < 20) {
      progressBarColor = Color(0xff860E1B);
      ideology = "Gauche";
    } else if (DashboardController.to.ideology.obs.value > 40 &&
        DashboardController.to.ideology.obs.value < 60) {
      progressBarColor = Color(0xffD6DA11);
      ideology = "Centre";
    } else if (DashboardController.to.ideology.obs.value >= 60) {
      progressBarColor = Color(0xff4074B1);
      ideology = "Droite";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Population',
              icon: Images.population,
              type: CountryDataType.number,
              value: DashboardController.to.population.value,
              movement: DashboardController.to.populationMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Pollution',
              icon: Images.pollution,
              type: CountryDataType.percentage,
              value: DashboardController.to.pollution.value,
              movement: DashboardController.to.pollutionMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Securite',
              icon: Images.security,
              type: CountryDataType.percentage,
              value: DashboardController.to.security.value,
              movement: DashboardController.to.securityMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Justice',
              icon: Images.justice,
              type: CountryDataType.percentage,
              value: DashboardController.to.justice.value,
              movement: DashboardController.to.justiceMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Education',
              icon: Images.education,
              type: CountryDataType.percentage,
              value: DashboardController.to.education.value,
              movement: DashboardController.to.educationMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Sante',
              icon: Images.health,
              type: CountryDataType.percentage,
              value: DashboardController.to.health.value,
              movement: DashboardController.to.healthMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Economie',
              icon: Images.economy,
              type: CountryDataType.number,
              value: DashboardController.to.economy.value,
              movement: DashboardController.to.economyMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Stabilite Int',
              icon: Images.stabint,
              type: CountryDataType.percentage,
              value: DashboardController.to.intStab.value,
              movement: DashboardController.to.intStabMouv.value,
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => CountryDataCard(
              title: 'Stabilite Ext',
              icon: Images.stabext,
              type: CountryDataType.percentage,
              value: DashboardController.to.extStab.value,
              movement: DashboardController.to.extStabMouv.value,
            ),
          ),
        ),
        Expanded(
            child: Obx(
          () => Container(
            width: 130,
            height: 100,
            constraints: BoxConstraints(minHeight: 80),
            decoration: BoxDecoration(
              color: kCardFill,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: kStrokeColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: SvgPicture.asset(Images.politique)),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Politique",
                                style: kP3,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Text(
                            '$ideology',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            color: Color(0xff13264A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: progressBarColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${DashboardController.to.ideology.obs.value}%',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
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
        )),
      ],
    );
  }
}

class CountryDataCard extends StatelessWidget {
  final String title;
  final String icon;
  final int value;
  final CountryDataType type;
  final int movement;
  const CountryDataCard({
    super.key,
    required this.title,
    required this.value,
    required this.type,
    required this.movement,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = movement >= 0;
    final textLeading = isPositive ? '+' : '';
    final textTrailing = type == CountryDataType.percentage ? '%' : '';

    return Container(
      width: 130,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      constraints: BoxConstraints(minHeight: 60),
      decoration: BoxDecoration(
        color: kCardFill,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kStrokeColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: isPositive ? kGreenColor : kRedColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: kCardPadding / 2,
                      child: Text(
                        '$textLeading$movement$textTrailing',
                        style: kMouvStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: SvgPicture.asset(icon)),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            title,
                            style: kP3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '$value',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kWhiteBlueishColor,
                    ).copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleIconsWidget extends StatefulWidget {
  final List<IconData> iconsRow1;
  final List<IconData> iconsRow2;
  final List<IconData> iconsRow3;
  final List<IconData> iconsRow4;
  final int percentage;

  TriangleIconsWidget({
    required this.iconsRow1,
    required this.iconsRow2,
    required this.iconsRow3,
    required this.iconsRow4,
    required this.percentage,
  });

  @override
  _TriangleIconsWidgetState createState() => _TriangleIconsWidgetState();
}

class _TriangleIconsWidgetState extends State<TriangleIconsWidget> {
  List<Color> _iconColors = [];

  @override
  void initState() {
    super.initState();
    _updateIconColors();
  }

  void _updateIconColors() {
    final List<List<IconData>> allRows = [
      widget.iconsRow1,
      widget.iconsRow2,
      widget.iconsRow3,
      widget.iconsRow4,
    ];

    final int totalIcons = allRows.fold(0, (sum, row) => sum + row.length);
    final int numColoredIcons = (totalIcons * widget.percentage / 100).round();

    final List<Color> newColors = [];
    int coloredIconsCount = 0;

    for (final row in allRows) {
      final int numIconsInRow = row.length;
      final int numColoredIconsInRow =
          ((numIconsInRow * widget.percentage / 100) - coloredIconsCount)
              .round();

      for (int i = 0; i < numIconsInRow; i++) {
        newColors.add(coloredIconsCount < numColoredIcons
            ? _getRandomColor()
            : Color(0xff8E8E8E));
        coloredIconsCount++;

        if (coloredIconsCount >= numColoredIcons) break;
      }
    }

    setState(() {
      _iconColors = newColors;
    });
  }

  Color _getRandomColor() {
    return Random().nextBool() ? Color(0xff19BE99) : Color(0xffBE2319);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildIconRow(widget.iconsRow1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildIconRow(widget.iconsRow2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildIconRow(widget.iconsRow3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildIconRow(widget.iconsRow4),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIconRow(List<IconData> icons) {
    return icons
        .map((icon) => Icon(
              icon,
              color: _iconColors[icons.indexOf(icon)],
              size: 50,
            ))
        .toList();
  }
}
