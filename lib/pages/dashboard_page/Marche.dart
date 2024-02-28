import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/country_resources_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class Marche extends StatefulWidget {
  const Marche({super.key});

  @override
  State<Marche> createState() => _MarcheState();
}

class _MarcheState extends State<Marche> {
  int isList = 0;

  int indexVendre = 0;
  int indexAchat = 0;
  int indexCAchat = 0;
  int indexCVente = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 11,
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
                        'Marche',
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
                child: Text('Marche', style: kBold),
              ),
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: kBoxFill,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          isList = 0;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                          border: Border.all(
                                            color: Color(0xFF254272),
                                            width: 1.905,
                                          ),
                                          color: isList == 0
                                              ? Color(0xFF30538C)
                                              : Color(0xff0F2140),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Vendre',
                                            style: TextStyle(
                                                color: isList == 0
                                                    ? Color(0xffffffff)
                                                    : Color(0xff435678),
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
                                          isList = 1;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                          border: Border.all(
                                            color: Color(0xFF254272),
                                            width: 1.905,
                                          ),
                                          color: isList == 1
                                              ? Color(0xFF30538C)
                                              : Color(0xff0F2140),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Acheter',
                                            style: TextStyle(
                                                color: isList == 1
                                                    ? Color(0xffffffff)
                                                    : Color(0xff435678),
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
                                          isList = 2;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                          border: Border.all(
                                            color: Color(0xFF254272),
                                            width: 1.905,
                                          ),
                                          color: isList == 2
                                              ? Color(0xFF30538C)
                                              : Color(0xff0F2140),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Contrats achats',
                                            style: TextStyle(
                                                color: isList == 2
                                                    ? Color(0xffffffff)
                                                    : Color(0xff435678),
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
                                          isList = 3;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9.527),
                                          border: Border.all(
                                            color: Color(0xFF254272),
                                            width: 1.905,
                                          ),
                                          color: isList == 3
                                              ? Color(0xFF30538C)
                                              : Color(0xff0F2140),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Contrats vente',
                                            style: TextStyle(
                                                color: isList == 3
                                                    ? Color(0xffffffff)
                                                    : Color(0xff435678),
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isList == 0) vendre(),
                            if (isList == 1) achat(),
                            if (isList == 2) contratsAchat(),
                            if (isList == 3) contratsVente(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    if (isList == 0 && DashboardController.to.vendre.isNotEmpty)
                      selectedVendre(),
                    if (isList == 1 && DashboardController.to.achat.isNotEmpty)
                      selectedAchat(),
                    if (isList == 2 &&
                        DashboardController.to.contractsAchat.isNotEmpty)
                      selectedContratsAchat(),
                    if (isList == 3 &&
                        DashboardController.to.contractsVendre.isNotEmpty)
                      selectedContratsVente()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget vendre() {
    return SizedBox(
      height: 425,
      child: ListView.builder(
        itemCount: DashboardController.to.vendre.length,
        itemBuilder: (BuildContext context, int index) {
          final cont = DashboardController.to.vendre[index];
          return InkWell(
              onTap: () {
                setState(() {
                  indexVendre = index;
                });
              },
              child: cont['contract_status'] == 0
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                          color: indexVendre == index
                              ? Color(0xff4365A0)
                              : Color(0xff233c6a),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: SvgPicture.asset(
                                    cont['flag_img_path'],
                                    width: 30,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    cont['country_name'],
                                    style: kMouvStyle,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    cont['resource_name'],
                                    style: kMouvStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Color(0xff19BE99),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    '+${cont['difference_percent']}%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ),
                        ],
                      ))
                  : Container());
        },
      ),
    );
  }

  Widget selectedVendre() {
    return Expanded(
        flex: 3,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            decoration: kBoxFill,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/marche.png'),
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DashboardController.to.vendre[indexVendre]
                            ['resource_name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pays : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                DashboardController.to.vendre[indexVendre]
                                    ['flag_img_path'],
                                width: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                DashboardController.to.vendre[indexVendre]
                                    ['country_name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût moyen mondial :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.vendre[indexVendre]['mondial_unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.vendre[indexVendre]['unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Différence',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: 20,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff3C5F89),
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 20,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xff19BE99),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '+${DashboardController.to.vendre[indexVendre]['difference_percent']}%',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volume :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.vendre[indexVendre]['total_quantity']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.vendre[indexVendre]['price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () async {
                            if (DashboardController.to.vendre.isNotEmpty) {
                              await CountryRessourcesRepo().sellResource(
                                DashboardController.to.vendre[indexVendre]
                                    ['resource_id'],
                                DashboardController
                                    .to.currentGame.value.country_id,
                                DashboardController.to.vendre[indexVendre]
                                    ['id'],
                                DashboardController.to.vendre[indexVendre]
                                    ['price'],
                              );

                              await DashboardController.to.fetchContracts(
                                  DashboardController
                                      .to.currentGame.value.country_id);
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
                            } else {
                              print('The selling list is empty.');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
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
                            child: Text(
                              "Signer le contrat",
                              style: TextStyle(
                                  color: Color(0xff0F2140),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget achat() {
    return SizedBox(
      height: 425,
      child: ListView.builder(
        itemCount: DashboardController.to.achat.length,
        itemBuilder: (BuildContext context, int index) {
          final cont = DashboardController.to.achat[index];
          return InkWell(
            onTap: () {
              setState(() {
                indexAchat = index;
              });
            },
            child: cont['contract_status'] == 0
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: indexAchat == index
                            ? Color(0xff4365A0)
                            : Color(0xff233c6a),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: SvgPicture.asset(
                                  cont['flag_img_path'],
                                  width: 30,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  cont['country_name'],
                                  style: kMouvStyle,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  cont['resource_name'],
                                  style: kMouvStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Color(0xff19BE99),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  '+${cont['difference_percent']}%',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                        ),
                      ],
                    ))
                : Container(),
          );
        },
      ),
    );
  }

  Widget selectedAchat() {
    return Expanded(
        flex: 3,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            decoration: kBoxFill,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/marche.png'),
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DashboardController.to.achat[indexAchat]
                            ['resource_name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pays : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                DashboardController.to.achat[indexAchat]
                                    ['flag_img_path'],
                                width: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                DashboardController.to.achat[indexAchat]
                                    ['country_name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût moyen mondial :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.achat[indexAchat]['mondial_unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.achat[indexAchat]['unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Différence',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: 20,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color(0xff3C5F89),
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  height: 20,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xff19BE99),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '+${DashboardController.to.achat[indexAchat]['difference_percent']}%',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volume :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.achat[indexAchat]['total_quantity']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.achat[indexAchat]['price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () async {
                            if (DashboardController.to.achat.isNotEmpty) {
                              await CountryRessourcesRepo().buyResource(
                                  DashboardController.to.achat[indexAchat]
                                      ['resource_id'],
                                  DashboardController
                                      .to.currentGame.value.country_id,
                                  DashboardController.to.achat[indexAchat]
                                      ['id'],
                                  DashboardController.to.achat[indexAchat]
                                      ['price']);

                              await DashboardController.to.fetchContracts(
                                  DashboardController
                                      .to.currentGame.value.country_id);
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
                            } else {
                              print('The achat list is empty.');
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
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
                            child: Text(
                              "Signer le contrat",
                              style: TextStyle(
                                  color: Color(0xff0F2140),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget contratsAchat() {
    return SizedBox(
      height: 425,
      child: ListView.builder(
        itemCount: DashboardController.to.contractsAchat.length,
        itemBuilder: (BuildContext context, int index) {
          final contract = DashboardController.to.contractsAchat[index];
          return InkWell(
            onTap: () {
              setState(() {
                indexCAchat = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: indexCAchat == index
                      ? Color(0xff4365A0)
                      : Color(0xff233c6a),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            contract['flag_img_path'],
                            width: 30,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            contract['country_name'],
                            style: kMouvStyle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            contract['resource_name'],
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
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                            color: contract['contract_status'] == 0
                                ? Color(0xffFF7C32)
                                : Color(0xff3CD37A),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            contract['contract_status'] == 0
                                ? 'Incomplet'
                                : 'livré',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget selectedContratsAchat() {
    return Expanded(
        flex: 3,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            decoration: kBoxFill,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/marche.png'),
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DashboardController.to.contractsAchat[indexCAchat]
                            ['resource_name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pays : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 50,
                                child: SvgPicture.asset(DashboardController
                                        .to.contractsAchat[indexCAchat]
                                    ['flag_img_path']),
                              ),
                              Text(
                                DashboardController
                                        .to.contractsAchat[indexCAchat]
                                    ['country_name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût moyen mondial :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsAchat[indexCAchat]['mondial_unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsAchat[indexCAchat]['unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volume :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsAchat[indexCAchat]['total_quantity']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsAchat[indexCAchat]['price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                          decoration: BoxDecoration(
                              color: DashboardController
                                              .to.contractsAchat[indexCAchat]
                                          ['contract_status'] ==
                                      0
                                  ? Color(0xffFF7C32)
                                  : Color(0xff3CD37A),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            DashboardController.to.contractsAchat[indexCAchat]
                                        ['contract_status'] ==
                                    0
                                ? 'Incomplet'
                                : 'livré',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget contratsVente() {
    return SizedBox(
      height: 425,
      child: ListView.builder(
        itemCount: DashboardController.to.contractsVendre.length,
        itemBuilder: (BuildContext context, int index) {
          final contract = DashboardController.to.contractsVendre[index];

          return InkWell(
            onTap: () {
              setState(() {
                indexCVente = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: indexCVente == index
                      ? Color(0xff4365A0)
                      : Color(0xff233c6a),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            contract['flag_img_path'],
                            width: 30,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            contract['country_name'],
                            style: kMouvStyle,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            contract['resource_name'],
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
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                            color: contract['contract_status'] == 0
                                ? Color(0xffFF7C32)
                                : Color(0xff3CD37A),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            contract['contract_status'] == 0
                                ? 'Incomplet'
                                : 'livré',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget selectedContratsVente() {
    return Expanded(
        flex: 3,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.infinity,
            decoration: kBoxFill,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/marche.png'),
                      ],
                    )),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        DashboardController.to.contractsVendre[indexCVente]
                            ['resource_name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pays : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                DashboardController
                                        .to.contractsVendre[indexCVente]
                                    ['flag_img_path'],
                                width: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                DashboardController
                                        .to.contractsVendre[indexCVente]
                                    ['country_name'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût moyen mondial :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsVendre[indexCVente]['mondial_unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coût :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsVendre[indexCVente]['unit_price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volume :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsVendre[indexCVente]['total_quantity']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${DashboardController.to.contractsVendre[indexCVente]['price']}€',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                          decoration: BoxDecoration(
                              color: DashboardController
                                              .to.contractsVendre[indexCVente]
                                          ['contract_status'] ==
                                      0
                                  ? Color(0xffFF7C32)
                                  : Color(0xff3CD37A),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            DashboardController.to.contractsVendre[indexCVente]
                                        ['contract_status'] ==
                                    0
                                ? 'Incomplet'
                                : 'livré',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}
