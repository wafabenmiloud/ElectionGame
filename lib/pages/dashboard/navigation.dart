import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/main.dart';
import 'package:gamev2/pages/home_screen/home_screen.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/images.dart';
import 'package:gamev2/utils/local_strings.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 170,
        decoration: BoxDecoration(
          color: const Color(0XFF26467B),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kStrokeColor,
            width: 2,
          ),
        ),
        child: Obx(() => Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              DashboardController
                                  .to.currentGame.value.country_flag_img_path,
                              width: 120,
                            ),
                            Text(
                              DashboardController
                                  .to.currentGame.value.country_name,
                              style: kP2,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 0.2,
                        color: kWhiteBlueishColor,
                      ),
                      _buildNavItem(
                          Images.palaisNavigation, 'Palais Présidentiel', 0),
                      _buildNavItem(
                          Images.ministersNavigation, 'Gouvernement', 1),
                      _buildNavItem(
                          Images.parliamentNavigation, 'Mon conseiller', 2),
                      Divider(
                        thickness: 0.2,
                        color: kWhiteBlueishColor,
                      ),
                      _buildNavItem(
                          Images.governmentNavigation, 'Boîte de réception', 3),
                      _buildNavItem(Images.homeNavigation, 'Actualités', 4),
                      Divider(
                        thickness: 0.2,
                        color: kWhiteBlueishColor,
                      ),
                      _buildNavItem(
                          Images.parliamentNavigation, 'Parlement', 5),
                      Divider(
                        thickness: 0.2,
                        color: kWhiteBlueishColor,
                      ),
                      _buildNavItem(Images.bankNavigation, 'Banque', 6),
                      _buildNavItem(Images.airplaneNavigation, 'Diplomatie', 7),
                      _buildNavItem(Images.polNavigation, 'Politique', 8),
                      Divider(
                        thickness: 0.2,
                        color: kWhiteBlueishColor,
                      ),
                      _buildNavItem(Images.resNavigation, 'Ressources', 9),
                      _buildNavItem(Images.indusNavigation, 'Industries', 10),
                      _buildNavItem(Images.marcheNavigation, 'Marché', 11),
                      _buildNavItem(Images.demogNavigation, 'Démographie', 12),
                      /* _buildNavItem(
                          Images.parliamentNavigation, 'Calendrier', 13),
                      _buildNavItem(Images.statNavigation, 'Statistiques', 14),
                      _buildNavItem(
                          Images.statNavigation, 'Attente du peuple', 15),*/
                      InkWell(
                        onTap: () {
                          CreateNewGameController.to.reset();
                          DashboardController.to.selectedIndex.value = 0;
                          initGetx();
                          _navigateToDashboard(context);
                        },
                        child: _NavigationIcon(
                          icon: Images.exitNavigation,
                          isSelected: false,
                          label: 'quitter',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  Widget _buildNavItem(String icon, String label, int index) {
    return GestureDetector(
      onTap: () => DashboardController.to.navigate(index),
      child: _NavigationIcon(
        icon: icon,
        isSelected: index == DashboardController.to.selectedIndex.value,
        label: label,
      ),
    );
  }

  _navigateToDashboard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }
}

class _NavigationIcon extends StatefulWidget {
  final bool isSelected;
  final String icon;
  final String label;

  const _NavigationIcon({
    required this.isSelected,
    required this.icon,
    required this.label,
  });

  @override
  State<_NavigationIcon> createState() => _NavigationIconState();
}

class _NavigationIconState extends State<_NavigationIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: isHovered
              ? Matrix4.diagonal3Values(1.1, 1.1, 1)
              : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
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
          child: Row(
            children: [
              widget.isSelected
                  ? SvgPicture.asset(
                      widget.icon,
                      width: 20,
                      colorFilter:
                          ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
                    )
                  : SvgPicture.asset(
                      widget.icon,
                      width: 20,
                    ),
              SizedBox(width: 5),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.isSelected ? kPrimaryColor : Color(0xffBFD6FF),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
