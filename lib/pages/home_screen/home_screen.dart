import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/language_mode.dart';
import 'package:gamev2/pages/create_new_game/create_new_game_screen.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:gamev2/widgets/page_padding.dart';
import 'package:get/get.dart';

import 'saved_game_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Images.bg),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            LanguageDropdown(),
            Container(child: Image.asset(Images.logo)),
            Row(
              children: [
                Expanded(
                    flex: 1, child: Container(child: Image.asset(Images.bgL))),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: kBigSpace),
                        _Button(
                          function: () => _createNewGame(context),
                          title: 'new_game'.tr,
                        ),
                        const SizedBox(height: kBigSpace),
                        _Button(
                          function: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const SavedGamesDialog(),
                            );
                          },
                          title: 'load_game'.tr,
                        ),
                        const SizedBox(height: kBigSpace),
                        _Button(
                          function: () {},
                          title: 'settings'.tr,
                        ),
                        const SizedBox(height: kBigSpace),
                        _Button(
                          function: _exit,
                          title: 'exit'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1, child: Container(child: Image.asset(Images.bgR))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageColumn extends StatelessWidget {
  const LanguageColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          SizedBox(
            height: 75,
            width: 75,
            child: InkWell(
              onTap: () => Get.updateLocale(const Locale('fr')),
              child: SvgPicture.asset(Images.france),
            ),
          ),
          InkWell(
            onTap: () => Get.updateLocale(const Locale('en')),
            child: SvgPicture.asset(Images.uk),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatefulWidget {
  final String title;
  final VoidCallback function;

  const _Button({
    required this.title,
    required this.function,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: isHovered
            ? Matrix4.diagonal3Values(1.02, 1.02, 1.0)
            : Matrix4.identity(),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
        decoration: BoxDecoration(
          color: Color(0xff80A1E5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0XFF30538C),
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ]
              : [],
        ),
        width: 400,
        child: InkWell(
          onTap: widget.function,
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Color(0XFF0F2140),
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_createNewGame(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => const CreateNewGameScreen()),
  );
}

_exit() {
  if (Platform.isWindows || Platform.isMacOS) {
    exit(0);
  }
}

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      LanguageModel(
          imagePath: 'assets/france.svg',
          title: 'Français',
          languageCode: 'fr'),
      LanguageModel(
          imagePath: 'assets/uk.svg', title: 'English', languageCode: 'en'),
    ];
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: 80,
        width: 220,
        child: DropdownButtonHideUnderline(
          child: Obx(
            () => DropdownButton2(
              isExpanded: true,
              items: languages
                  .map((item) => DropdownMenuItem<LanguageModel>(
                      value: item,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            SvgPicture.asset(item.imagePath),
                          ],
                        ),
                      )))
                  .toList(),
              value: CreateNewGameController.to.currentLanguage.value,
              onChanged: (value) {
                CreateNewGameController.to.currentLanguage.value = value!;
                Get.updateLocale(Locale(value.languageCode));
              },
              icon: Container(),
              buttonHeight: 50,
              buttonPadding: const EdgeInsets.only(left: 0, right: 0),
              buttonElevation: 0,
              itemHeight: 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: 400,
              dropdownWidth: 220,
              dropdownPadding: null,
              dropdownDecoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: kStrokeColor,
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(10),
              scrollbarThickness: 6,
              scrollbarAlwaysShow: true,
              offset: const Offset(0, 5),
            ),
          ),
        ),
      ),
    );
  }
}
