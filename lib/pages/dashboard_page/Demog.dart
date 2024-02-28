// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/country_resources_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';

class Demog extends StatefulWidget {
  const Demog({super.key});

  @override
  State<Demog> createState() => _DemogState();
}

class _DemogState extends State<Demog> {
  int selectedPopulationIndex = 0;
  int selectedPopulation2Index = 0;
  int selectedPopulation2LawIndex = 0;
  int selectedTypeIndex = 0;
  int selectedAgeIndex = 0;
  String selectedAttributeLabel = 'Tout';

  bool demogLoi = true;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 12,
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          demogLoi = true;
                        });
                      },
                      child: Text(
                        'Démographie',
                        style: TextStyle(
                            decoration: demogLoi
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
                          demogLoi = false;
                        });
                      },
                      child: Text(
                        'Lois par population',
                        style: TextStyle(
                            decoration: demogLoi
                                ? TextDecoration.none
                                : TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              demogLoi
                  ? Expanded(
                      flex: 1,
                      child: Text('Démographie', style: kBold),
                    )
                  : Expanded(
                      flex: 1,
                      child: Text(
                        'Lois par population',
                        style: kBold,
                      ),
                    ),
              SizedBox(
                height: 25,
              ),
              demogLoi ? demographie() : lois()
            ],
          ),
        ),
      ),
    );
  }

  Widget demographie() {
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
                    height: 475,
                    child: ListView.builder(
                      itemCount:
                          DashboardController.to.countryPopulation.length,
                      itemBuilder: (BuildContext context, int index) {
                        final population =
                            DashboardController.to.countryPopulation[index];

                        return InkWell(
                          onTap: () async {
                            setState(() {
                              selectedPopulationIndex = index;
                              selectedTypeIndex = 0;
                              selectedAgeIndex = 0;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: selectedPopulationIndex == index
                                    ? Color(0XFF3A86BB)
                                    : Color(0xff0F2140),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                '${population['attribute_type_label']}',
                                style: TextStyle(
                                  color: selectedPopulationIndex == index
                                      ? Color(0xff172F5C)
                                      : Color(0xffBFD6FF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
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
            child: selectedPopulationIndex != -1 &&
                    DashboardController.to.countryPopulation.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    decoration: kBoxFill,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, -30.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            margin: EdgeInsets.symmetric(horizontal: 80),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.527),
                              border: Border.all(
                                width: 1.905,
                                style: BorderStyle.solid,
                                color: Color(0xFF30538C),
                              ),
                              color: Color(0xFF3A86BB),
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
                                '${DashboardController.to.countryPopulation[selectedPopulationIndex]['attribute_type_label']}',
                                style: TextStyle(
                                  color: Color(0xff172F5C),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemExtent: 200,
                            itemCount: DashboardController
                                    .to
                                    .countryPopulation[selectedPopulationIndex]
                                        ['attribute_values']
                                    .length +
                                1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return buildAttributeItem(
                                    'Tout', index, selectedTypeIndex, (index) {
                                  setState(() {
                                    selectedTypeIndex = index;
                                    selectedAgeIndex = 0;
                                    selectedAttributeLabel = 'Tout';
                                  });
                                });
                              } else {
                                final population =
                                    DashboardController.to.countryPopulation[
                                            selectedPopulationIndex]
                                        ['attribute_values'][index - 1];
                                return buildAttributeItem(
                                    '${population['attribute_value_label']}',
                                    index,
                                    selectedTypeIndex, (index) {
                                  setState(() {
                                    selectedTypeIndex = index;
                                    selectedAgeIndex = 0;
                                    selectedAttributeLabel =
                                        population['attribute_value_label'];
                                  });
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        if (selectedTypeIndex != 0)
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemExtent: double.maxFinite,
                                itemCount: DashboardController
                                    .to
                                    .countryPopulation[selectedPopulationIndex]
                                        ['attribute_values']
                                    .where((population) =>
                                        population['attribute_value_label'] ==
                                        selectedAttributeLabel)
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  final filteredPopulations =
                                      DashboardController
                                          .to
                                          .countryPopulation[
                                              selectedPopulationIndex]
                                              ['attribute_values']
                                          .where((population) =>
                                              population[
                                                  'attribute_value_label'] ==
                                              selectedAttributeLabel)
                                          .toList();
                                  final Map<String, List<Map<String, dynamic>>>
                                      groupedByAgeCategory = {};
                                  for (final attribute
                                      in filteredPopulations[index]
                                          ['attributes']) {
                                    final ageCategory =
                                        attribute['age_category'] as String;
                                    if (!groupedByAgeCategory
                                        .containsKey(ageCategory)) {
                                      groupedByAgeCategory[ageCategory] = [];
                                    }
                                    groupedByAgeCategory[ageCategory]!
                                        .add(attribute);
                                  }
                                  var sortedKeys = groupedByAgeCategory.keys
                                      .toList()
                                    ..sort((a, b) => int.parse(a.split('-')[0])
                                        .compareTo(int.parse(b.split('-')[0])));

                                  Map<String, List<Map<String, dynamic>>>
                                      sortedData = Map.fromEntries(
                                          sortedKeys.map((key) => MapEntry(key,
                                              groupedByAgeCategory[key]!)));

                                  return Row(
                                    children: [
                                      Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          color: Color.fromRGBO(
                                              217, 217, 217, 0.1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                color: Color(0xffffffff),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Femmes',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    142, 59, 248, 0.98),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'Hommes',
                                              style: TextStyle(
                                                color: Color(0xffABFCE8),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ...sortedData.entries.map((entry) {
                                        num totPercent = 0;
                                        final ageCategory = entry.key;
                                        final List<Map<String, dynamic>>
                                            attributes = entry.value;
                                        for (var per in entry.value) {
                                          totPercent += per['percent'];
                                        }
                                        return buildAttribute2ItemGroup(
                                            ageCategory,
                                            attributes,
                                            totPercent);
                                      }).toList(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ))
                : Container(
                    width: double.infinity,
                    decoration: kBoxFill,
                  )),
      ]),
    );
  }

  Widget buildAttributeItem(
      String label, int index, int selectedIndex, Function(int) onTap) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Color(0XFF3A86BB) : Color(0xff0F2140),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedIndex == index
                  ? Color(0xff172F5C)
                  : Color(0xffBFD6FF),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAttribute2ItemGroup(String ageCategory,
      List<Map<String, dynamic>> attributes, num totPercent) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        color: Color.fromRGBO(217, 217, 217, 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '$totPercent%',
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            '-',
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            '${(totPercent / 100) * DashboardController.to.population.value}',
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          for (final attribute in attributes)
            buildAttribute2Item(
                '${attribute['gender']}', '${attribute['percent']}'),
          Text(
            '$ageCategory',
            style: TextStyle(
              color: Color(0xffBCBF2D),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAttribute2Item(String gender, String percent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: Center(
        child: Column(
          children: [
            Text(
              '$percent%',
              style: TextStyle(
                color: gender == 'Femme'
                    ? Color.fromRGBO(142, 59, 248, 0.98)
                    : Color(0xffABFCE8),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              '-',
              style: TextStyle(
                color: gender == 'Femme'
                    ? Color.fromRGBO(142, 59, 248, 0.98)
                    : Color(0xffABFCE8),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            Text(
              '${(double.parse(percent) / 100) * DashboardController.to.population.value}',
              style: TextStyle(
                color: gender == 'Femme'
                    ? Color.fromRGBO(142, 59, 248, 0.98)
                    : Color(0xffABFCE8),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lois() {
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
                    height: 475,
                    child: ListView.builder(
                      itemCount:
                          DashboardController.to.countryPopulationLaws.length,
                      itemBuilder: (BuildContext context, int index) {
                        final population =
                            DashboardController.to.countryPopulationLaws[index];

                        return InkWell(
                          onTap: () async {
                            setState(() {
                              selectedPopulation2Index = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                                color: selectedPopulation2Index == index
                                    ? Color(0XFF3A86BB)
                                    : Color(0xff0F2140),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                '${population['country_population']['attribute_type_label']}',
                                style: TextStyle(
                                  color: selectedPopulation2Index == index
                                      ? Color(0xff172F5C)
                                      : Color(0xffBFD6FF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
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
            child: selectedPopulation2Index != -1 &&
                    DashboardController.to.countryPopulationLaws.isNotEmpty
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    decoration: kBoxFill,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, -30.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70, vertical: 10),
                            margin: EdgeInsets.symmetric(horizontal: 80),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.527),
                              border: Border.all(
                                width: 1.905,
                                style: BorderStyle.solid,
                                color: Color(0xFF30538C),
                              ),
                              color: Color(0xFF3A86BB),
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
                                '${DashboardController.to.countryPopulationLaws[selectedPopulation2Index]['country_population']['attribute_type_label']}',
                                style: TextStyle(
                                  color: Color(0xff172F5C),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: DashboardController
                                        .to
                                        .countryPopulationLaws[
                                            selectedPopulation2Index]
                                            ['laws_info']
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final law = DashboardController
                                                  .to.countryPopulationLaws[
                                              selectedPopulation2Index]
                                          ['laws_info'][index];
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPopulation2LawIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          decoration: BoxDecoration(
                                            color:
                                                selectedPopulation2LawIndex ==
                                                        index
                                                    ? Color(0XFF3A86BB)
                                                    : Color(0xff0F2140),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    law['name'],
                                                    style: TextStyle(
                                                      color:
                                                          selectedPopulation2LawIndex ==
                                                                  index
                                                              ? Color(
                                                                  0xff172F5C)
                                                              : Color(
                                                                  0xffBFD6FF),
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                if (selectedPopulation2LawIndex != -1 &&
                                    DashboardController
                                        .to
                                        .countryPopulationLaws[
                                            selectedPopulation2Index]
                                            ['laws_info']
                                        .isNotEmpty)
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Column(
                                        
                                        children: [
                                          Text( DashboardController
                                                            .to.countryPopulationLaws[
                                                        selectedPopulation2Index]
                                                    ['laws_info'][
                                                selectedPopulation2LawIndex]['name']
                                           ,
                                            style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),SizedBox(height: 10,),
                                          Text(
                                            DashboardController.to.countryPopulationLaws[
                                                            selectedPopulation2Index]
                                                        ['laws_info'][
                                                    selectedPopulation2LawIndex]
                                                ['description'],
                                            style: TextStyle(
                                              color: Color(0xffBFD6FF),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Population touchées : ${((DashboardController.to.countryPopulationLaws[selectedPopulation2Index]['laws_info'][selectedPopulation2LawIndex]['percent'] / 100) * DashboardController.to.population.value).toStringAsFixed(2)}',
                                                  style: TextStyle(
                                                    color: Color(0xffBFD6FF),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Valeur : 10€ par jour',
                                                  style: TextStyle(
                                                    color: Color(0xffBFD6FF),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          DashboardController.to.countryPopulationLaws[
                                                                  selectedPopulation2Index]
                                                              ['laws_info'][
                                                          selectedPopulation2LawIndex]
                                                      ['relation_type'] ==
                                                  'PROFIT'
                                              ? buildFinancesRow(
                                                  'Revenus',
                                                  '${(DashboardController.to.countryPopulationLaws[selectedPopulation2Index]['laws_info'][selectedPopulation2LawIndex]['incomes'] / 1000000000).toStringAsFixed(2)}Md\$',
                                                  kGreenColor)
                                              : buildFinancesRow(
                                                  'Dépences',
                                                  '${(DashboardController.to.countryPopulationLaws[selectedPopulation2Index]['laws_info'][selectedPopulation2LawIndex]['expenses'] / 1000000000).toStringAsFixed(2)}Md\$',
                                                  kRedColor),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                : Container(
                    width: double.infinity,
                    decoration: kBoxFill,
                  )),
      ]),
    );
  }
   Widget buildFinancesRow(String title, String amount, Color bgColor) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color(0xff0F2140),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
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
