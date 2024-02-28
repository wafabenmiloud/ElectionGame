import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:get/get.dart';

class SelectContinent extends StatelessWidget {
  const SelectContinent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Text(
            'Selectionner Le Continent',
            style: kP2,
          ),
          const SizedBox(
            height: kHorizontalPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [

              Expanded(
                child: _Continent(
                  image: Images.america,
                  text: 'America',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _Continent(
                  image: Images.europe,
                  text: 'Europe',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _Continent(
                  image: Images.africa,
                  text: 'Africa',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _Continent(
                  image: Images.asia,
                  text: 'Asia',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _Continent(
                  image: Images.australia,
                  text: 'Australia',
                ),
              ),
            ],
          )
        ],
      )
    ;
  }
}

class _Continent extends StatelessWidget {
  final String image;
  final String text;
  const _Continent({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    const enabledColor = Color(0XFF008BE8);
    const disabledColor = Color(0XFF001336);
    return Obx(
      () => InkWell(
        onTap: () {
          CreateNewGameController.to.changeContinent(text);
        },
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: SvgPicture.asset(
                image,
                colorFilter: ColorFilter.mode(
                  CreateNewGameController.to.selectedContinent.value == text
                      ? enabledColor
                      : disabledColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          
            Text(
              text,
              style: CreateNewGameController.to.selectedContinent.value == text
                  ? kP4
                  : kP4.copyWith(
                      color: disabledColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
