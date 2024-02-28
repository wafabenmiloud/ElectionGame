// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/pages/create_new_game/select_continent.dart';
import 'package:gamev2/pages/programs.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:gamev2/widgets/page_padding.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'custom_form_field.dart';

class CreateNewGameScreen extends StatelessWidget {
  const CreateNewGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagePadding(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _LeftColumn(),
                  SizedBox(
                    width: kHorizontalPadding,
                  ),
                  _RightColumn(),
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
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CreateNewGameController.to.selectedpromises.clear();
                      CreateNewGameController.to.fetchPromises();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Programs()));
                    },
                    child: const Text('Confirmer'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LeftColumn extends StatelessWidget {
  const _LeftColumn();

  @override
  Widget build(BuildContext context) {
    const selectedFlagSize = 100.0;
    const unSelectedFlagSize = 70.0;
    return Expanded(
      child: Column(
        children: [
          _FirstPart(),
          SizedBox(
            height: kHorizontalPadding / 2,
          ),
          Expanded(
            child: Container(
              decoration: kBoxFill,
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 0,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Selectionner Le pays',
                    style: kP2,
                  ),
                  const SizedBox(
                    height: kHorizontalPadding / 2,
                  ),
                  Obx(
                    () => Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  CreateNewGameController.to
                                      .changeCountry(index);
                                },
                                child: Obx(
                                  () => Container(
                                    height: index ==
                                            CreateNewGameController
                                                .to.selectedCountryIndex.value
                                        ? selectedFlagSize
                                        : unSelectedFlagSize,
                                    width: index ==
                                            CreateNewGameController
                                                .to.selectedCountryIndex.value
                                        ? selectedFlagSize
                                        : unSelectedFlagSize,
                                    child: SvgPicture.asset(
                                      CreateNewGameController
                                          .to.countries[index].flag_img_path,
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => Expanded(
                                  child: Text(
                                    CreateNewGameController
                                        .to.countries[index].name,
                                    style: index ==
                                            CreateNewGameController
                                                .to.selectedCountryIndex.value
                                        ? kP4
                                        : kP4.copyWith(
                                            color: Colors.transparent,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          width: kHorizontalPadding,
                        ),
                        itemCount: CreateNewGameController.to.countries.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: kHorizontalPadding / 2,
          ),
          _ThirdPart(),
        ],
      ),
    );
  }
}

class _FirstPart extends StatelessWidget {
  const _FirstPart();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: kBoxFill,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: const SelectContinent(),
      ),
    );
  }
}

class _ThirdPart extends StatefulWidget {
  const _ThirdPart();

  @override
  State<_ThirdPart> createState() => _ThirdPartState();
}

class _ThirdPartState extends State<_ThirdPart> {
  final List<String> imageUrls = [
    "assets/presidents/1.png",
    "assets/presidents/2.png",
    "assets/presidents/3.png",
    "assets/presidents/4.png",
    "assets/presidents/5.png",
    "assets/presidents/6.png",
    "assets/presidents/7.png",
    "assets/presidents/8.png",
    "assets/presidents/9.png",
    "assets/presidents/10.png",
    "assets/presidents/11.png",
    "assets/presidents/12.png",
    "assets/presidents/13.png",
    "assets/presidents/14.png",
    "assets/presidents/15.png",
  ];
  int _currentIndex = 0;
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: kBoxFill,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: CustomFormField()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 200,
                      height: 40,
                      child: TextFormField(
                        controller: CreateNewGameController.to.prenom,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0XFFBFD6FF),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Taper votre prénom',
                          hintStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0XFFBFD6FF),
                          ),
                          filled: true,
                          fillColor: const Color(0XFF254272),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(width: 2, color: kStrokeColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: Color(0xff0F2140),
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: controller,
                            options: CarouselOptions(
                              height: 300,
                              initialPage: 0,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex = index;
                                });
                                CreateNewGameController.to.imageUrl.value =
                                    imageUrls[_currentIndex];
                               
                              },
                            ),
                            itemCount: imageUrls.length,
                            itemBuilder: (context, index, realIndex) {
                              final img = imageUrls[index];
                              return Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Image.asset(
                                    img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                          Align(
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
                          Align(
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: () =>
                                CreateNewGameController.to.changeSexe(0),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: SvgPicture.asset(
                                  CreateNewGameController.to.isMale.value == 0
                                      ? Images.maleSelected
                                      : Images.maleUnselected),
                            ),
                          ),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () =>
                                CreateNewGameController.to.changeSexe(1),
                            child: Container(
                              width: 40,
                              height: 40,
                              child: SvgPicture.asset(
                                  CreateNewGameController.to.isMale.value == 0
                                      ? Images.femaleUnselected
                                      : Images.femaleSelected),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: TextFormField(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                dateformat.format(pickedDate);

                            CreateNewGameController.to.dateN.text =
                                formattedDate;
                          } else {}
                        },
                        controller: CreateNewGameController.to.dateN,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0XFFBFD6FF),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Date de naissance',
                          hintStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0XFFBFD6FF),
                          ),
                          filled: true,
                          fillColor: const Color(0XFF254272),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(width: 2, color: kStrokeColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void next() {
    controller.nextPage(duration: Duration(milliseconds: 500));
  }

  void prev() {
    controller.previousPage(duration: Duration(milliseconds: 500));
  }
}

class _RightColumn extends StatelessWidget {
  const _RightColumn();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: kBoxFill,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Obx(() => Text(
                        CreateNewGameController
                            .to
                            .countries[CreateNewGameController
                                .to.selectedCountryIndex.value]
                            .name,
                        style:
                            TextStyle(color: Color(0xffBFD6FF), fontSize: 20),
                      )),
                  Obx(
                    () => Expanded(
                      child: Container(
                        child: SvgPicture.asset(CreateNewGameController
                            .to
                            .countries[CreateNewGameController
                                .to.selectedCountryIndex.value]
                            .flag_img_path),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Salaire median : ',
                              style: kP5,
                            ),
                            Obx(
                              () => Text(
                                '${CreateNewGameController.to.median_salary.value}',
                                style: kP5,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Puissance militaire : ',
                              style: kP5,
                            ),
                            Obx(
                              () => Text(
                                '${CreateNewGameController.to.military_number.value}',
                                style: kP5,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PIB : ',
                              style: kP5,
                            ),
                            Obx(
                              () => Text(
                                '${CreateNewGameController.to.pib_amount.value}',
                                style: kP5,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Puissance Economique : ',
                              style: kP5,
                            ),
                            Obx(
                              () => Text(
                                '${CreateNewGameController.to.total_economy_amount.value}',
                                style: kP5,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Dettes : ',
                              style: kP5,
                            ),
                            Obx(
                              () => Text(
                                '${CreateNewGameController.to.dettes.value}',
                                style: kP5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Expanded(
                flex: 2,
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: SvgPicture.asset(CreateNewGameController
                      .to
                      .countries[
                          CreateNewGameController.to.selectedCountryIndex.value]
                      .map_img_path),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      'Capitale:',
                      style: kP2,
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      child: Text(
                        CreateNewGameController
                            .to
                            .countries[CreateNewGameController
                                .to.selectedCountryIndex.value]
                            .capital_name,
                        style: kP1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Population:',
                      style: kP2,
                    ),
                  ),
                  Obx(
                    () => Expanded(
                      child: Text(
                        CreateNewGameController.to.population.value,
                        style: kP1,
                      ),
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
}

class _InfoBox extends StatelessWidget {
  final bool isActive;
  final String text;
  const _InfoBox({
    required this.isActive,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? const Color(0XFF172F5C) : kSecondaryColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: kStrokeColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Center(
                child: Text(
                  text,
                  style: isActive
                      ? kP2
                      : kP2.copyWith(
                          color: const Color(0XFF435678),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
