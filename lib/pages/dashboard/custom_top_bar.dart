import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/repositories/current_game_repo.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomTopBar extends StatefulWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    void showLoader() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    void hideLoader() {
      Navigator.pop(context);
    }

    return Container(
      decoration: kBoxFill,
      child: Padding(
        padding: kCardPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffBFD6FF)),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  SvgPicture.asset(Images.calendar),
                  SizedBox(
                    width: 5,
                  ),
                  Obx(
                    () => Text(
                      'Fin du mandat : ${DashboardController.to.currentGame.value.end_mandat}',
                      style: kP5,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    'Mr/Mme ${DashboardController.to.currentGame.value.first_name + DashboardController.to.currentGame.value.last_name}',
                    style: kP2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(Images.star),
                ),
                SizedBox(
                  width: 10,
                ),
                Obx(
                  () => Text(
                    '${DashboardController.to.currentGame.value.points}',
                    style: kSemiBold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(Images.calendar),
                Obx(
                  () => Column(
                    children: [
                      Text(
                        DashboardController.to.currentGame.value.current_date,
                        style: kP5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                      await CurrentGameRepo().nextRound(
                          DashboardController.to.currentGame.value.country_id, DashboardController.to.currentGame.value.id!);
                      await DashboardController.to.fetchGame();
                      await DashboardController.to.fetchCountryDatas(
                          DashboardController.to.currentGame.value.country_id);
                      await DashboardController.to.fetchRessorces(
                          DashboardController.to.currentGame.value.country_id);

                 

                      showLoader();
                      await Future.delayed(Duration(seconds: 2));
                      hideLoader();

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color(0XFF30538C),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2E7FCB)),
                    child: Row(
                      children: [
                        Text(
                          'Continuer',
                          style: TextStyle(color: Color(0xffBFD6FF)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff859FCA),
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
