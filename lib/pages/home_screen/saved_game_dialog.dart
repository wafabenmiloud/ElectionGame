import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/models/games_model.dart';
import 'package:gamev2/pages/dashboard/dashboard.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:get/get.dart';

class SavedGamesDialog extends StatelessWidget {
  const SavedGamesDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 450,
            width: 800,
            decoration: kBoxFill,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding / 2,
                vertical: kHorizontalPadding / 2,
              ),
              child: Obx(
                () => ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final game = CreateNewGameController.to.savedGames[index];
                      return InkWell(
                        onTap: () => _loadGame(context, game),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFF254272),
                            border: Border.all(
                              color: kStrokeColor,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  game.name_database_game,
                                  style: kP2,
                                ),
                                // SvgPicture.asset(Images.franceFlag),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: CreateNewGameController.to.savedGames.length),
              ),
            ),
          ),
          Positioned(
            top: -15,
            left: -15,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                height: 30,
                width: 30,
                child: SvgPicture.asset(Images.exit),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_loadGame(BuildContext context, GamesModel game) {
  // Load the current game database
  CreateNewGameController.to.loadSaveGame(game.name_database_game);

  // Push to Dashboard
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => Dashboard()),
  );
}
