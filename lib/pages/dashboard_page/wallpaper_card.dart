import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/utils/constants.dart';

class WallpaperCard extends StatelessWidget {
  final String name;
  final double treasury;
  final String image;

  const WallpaperCard({
    super.key,
    required this.name,
    required this.treasury,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = treasury >= 0;
    final textLeading = isPositive ? '' : '-';
    return Container(
      decoration: BoxDecoration(
        color: kCardFill2,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: kStrokeColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: kCardPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(image),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: kP3,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: isPositive ? kGreenColor : kRedColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: kCardPadding / 2,
                child: Text(
                  '$textLeading${treasury}md \$',
                  style: kMouvStyle,
                ),
              ),
            ),
            const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
