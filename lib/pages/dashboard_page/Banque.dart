import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/country_debts_repo.dart';
import 'package:gamev2/repositories/country_laws.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class StatusIndicator extends StatelessWidget {
  final String status;

  const StatusIndicator({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color indicatorColor;
    String labelText;
    switch (status) {
      case 'WAITING':
        indicatorColor = Colors.blueGrey;
        labelText = 'En attente de réponse';
        break;
      case 'IN_PROGRESS':
        indicatorColor = Colors.orange;
        labelText = 'En cours';
        break;
      case 'REJECTED':
        indicatorColor = Colors.red;
        labelText = 'Refusé';
        break;
      case 'FINISH':
        indicatorColor = Colors.green;
        labelText = 'Terminé';
        break;
      default:
        indicatorColor = Colors.grey;
        labelText = 'Inconnu';
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF30538C),
          width: 2,
        ),
        color: indicatorColor,
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
        labelText,
        style: TextStyle(
            color: Color(0xffBFD6FF),
            fontSize: 10,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class Banque extends StatefulWidget {
  const Banque({super.key});

  @override
  State<Banque> createState() => _BanqueState();
}

class _BanqueState extends State<Banque> {
  @override
  void initState() {
    super.initState();
  }

  bool isNat = true;
  int selectedOrgan = 0;
  String selectedOption = '1 an';
  num loan = 0;
  int years = 0;
  num interest = 0;
  num calculateDebt(num loanAmount, int durationYears) {
    num inter = 0;
    if (durationYears == 1) {
      inter = 5;
    } else if (durationYears == 2) {
      inter = 8;
    } else if (durationYears == 3) {
      inter = 15;
    }

    num totalDebt = loanAmount + (loanAmount * inter / 100);

    return totalDebt;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 6,
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
                          isNat = true;
                        });
                      },
                      child: Text(
                        'Banque Nationale',
                        style: TextStyle(
                            decoration: isNat
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
                          isNat = false;
                        });
                      },
                      child: Text(
                        'Organisations bancaires',
                        style: TextStyle(
                            decoration: isNat
                                ? TextDecoration.none
                                : TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              isNat
                  ? Expanded(
                      flex: 1,
                      child: Text('Banque Nationale', style: kBold),
                    )
                  : Expanded(
                      flex: 1,
                      child: Text(
                        'Organisations bancaires',
                        style: kBold,
                      ),
                    ),
              isNat ? debts() : organizations()
            ],
          ),
        ),
      ),
    );
  }

  Widget debts() {
    return Expanded(
      flex: 15,
      child: Container(
        decoration: kBoxFill,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Prêts  en cours',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: DashboardController.to.debts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final debt = DashboardController.to.debts[index];
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Color(0xff30538C),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  buildContainer('Initial = '),
                                  buildContainer('${debt.total_amount}€'),
                                  buildContainer(
                                      '${debt.total_amount! / ((debt.days_number! / 30).round())}€ par mois'),
                                  buildContainer(
                                      '${(debt.days_number! / 30).round()} mois'),
                                ],
                              ),
                              Row(
                                children: [
                                  buildContainer('Reste = '),
                                  buildContainer(
                                      '${debt.total_amount! - debt.total_refunded!}€'),
                                  buildContainer(' - '),
                                  buildContainer(
                                      '${(debt.days_remaining! / 30).round()} mois'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  StatusIndicator(status: debt.debt_status!),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Image.asset('assets/banque.png')),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Monnaie nationale (EURO) €',
                      style: TextStyle(
                          color: Color(0xffBFD6FF),
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Color.fromRGBO(35, 71, 138, 0.00),
                        width: 2.0,
                      ),
                      color: Color.fromRGBO(255, 255, 255, 0.10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Taux de change',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFBFD6FF),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Color(0xff233c6a),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF254272),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Color(0xFF30538C), width: 2),
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
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Pays',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Monnaie',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Text(
                                'Valeur',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount:
                                DashboardController.to.allcountries.length,
                            itemBuilder: (BuildContext context, int index) {
                              final country =
                                  DashboardController.to.allcountries[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color(0xff233c6a),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF254272),
                                            borderRadius:
                                                BorderRadius.circular(100),
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
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFFFFFFF),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                          country.flag_img_path,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          country.name,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      country.currency,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                    Text(
                                      '${country.currency_taux * country.currency_reference_taux}',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFFFFFFFF),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget organizations() {
    return Expanded(
      flex: 15,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: kBoxFill,
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: DashboardController.to.organizations.length,
                      itemBuilder: (BuildContext context, int index) {
                        final org = DashboardController.to.organizations[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedOrgan = index;
                            });
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
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
              flex: 2,
              child: selectedOrgan != -1
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      width: double.infinity,
                      decoration: kBoxFill,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                        DashboardController
                                                .to.organizations[selectedOrgan]
                                            ['image_path'],
                                        width: 70,
                                      ),
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 160),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff0F2140),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${DashboardController.to.organizations[selectedOrgan]['first_name']} ${DashboardController.to.organizations[selectedOrgan]['last_name']}',
                                          style: TextStyle(
                                              fontSize: 12,
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
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /* Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              width: 500,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                ),
                                                color: Color(0xFF30538C),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      'Demander un don',
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xffffffff)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF30538C),
                                                            width: 2,
                                                          ),
                                                          color:
                                                              Color(0xFF0CA0F3),
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
                                                        child: Text(
                                                          'Faire la demande',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff0F2140)),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),*/

                          Expanded(
                            flex: 3,
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 60),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                                color: Color(0xFF30538C),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Demande de pret',
                                      style: TextStyle(
                                          color: Color(0xffffffff),
                                          fontSize: 18),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF30538C),
                                                  width: 2,
                                                ),
                                                color: Color(0xFF254272),
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
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: TextFormField(
                                                        onChanged: (value) {
                                                          setState(() {
                                                            loan = num.parse(
                                                                value);
                                                          });
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'[0-9]')),
                                                        ],
                                                        controller:
                                                            DashboardController
                                                                .to.debt_amount,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0XFFBFD6FF),
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              const Color(
                                                                  0XFF254272),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide.none,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text('€',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffffffff),
                                                                fontSize: 16))),
                                                  ],
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF30538C),
                                                  width: 2,
                                                ),
                                                color: Color(0xFF254272),
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
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    DropdownButton<String>(
                                                      value: selectedOption,
                                                      items: [
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: '1 an',
                                                          child: Text('1 an',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffBFD6FF),
                                                                  fontSize:
                                                                      16)),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: '2 ans',
                                                          child: Text('2 ans',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffBFD6FF),
                                                                  fontSize:
                                                                      16)),
                                                        ),
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: '3 ans',
                                                          child: Text('3 ans',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffBFD6FF),
                                                                  fontSize:
                                                                      16)),
                                                        ),
                                                      ],
                                                      underline: Container(),
                                                      dropdownColor:
                                                          Color(0xFF254272),
                                                      icon: Icon(Icons
                                                          .arrow_drop_down_outlined),
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selectedOption =
                                                              value!;
                                                        });
                                                        if (selectedOption ==
                                                            '1 an') {
                                                          setState(() {
                                                            years = 1;
                                                            interest = 5;
                                                          });
                                                        } else if (selectedOption ==
                                                            '2 ans') {
                                                          setState(() {
                                                            years = 2;
                                                            interest = 8;
                                                          });
                                                        } else if (selectedOption ==
                                                            '3 ans') {
                                                          setState(() {
                                                            years = 3;
                                                            interest = 15;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF30538C),
                                                  width: 2,
                                                ),
                                                color: Color(0xFF254272),
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
                                              child: Center(
                                                child: Text(
                                                  '${calculateDebt(loan, years)}',
                                                  style: TextStyle(
                                                      color: Color(0xffBFD6FF),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Taux d’intêret : ${interest}%',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: InkWell(
                                      onTap: () async {
                                        await CountryDebtsRepo().insertDebt(
                                            DashboardController.to
                                                    .organizations[selectedOrgan]
                                                ['country_id'],
                                            DashboardController.to
                                                    .organizations[selectedOrgan]
                                                ['id'],
                                            loan,
                                            years);
                                  
                                        await DashboardController.to.fetchDebts();
                                        setState(() {
                                          selectedOption = '1 an';
                                          DashboardController
                                              .to.debt_amount.text = '';
                                          loan = 0;
                                        });
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
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Color(0xFF30538C),
                                                width: 2,
                                              ),
                                              color: Color(0xff19BE99),
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
                                            child: Text(
                                              'Faire la demande',
                                              style:
                                                  TextStyle(color: Color(0xff0F2140)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ))
                  : Container(
                      width: double.infinity,
                      decoration: kBoxFill,
                    )),
        ],
      ),
    );
  }

  Widget buildContainer(String text) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFF30538C),
              width: 2,
            ),
            color: Color(0xFF254272),
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
                  color: Color(0xffBFD6FF),
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          )),
    );
  }
}
