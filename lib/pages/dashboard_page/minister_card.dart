import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gamev2/utils/constants.dart';

class MinisterCard extends StatelessWidget {
  final String name;
  final String image;
  final money;
  const MinisterCard({
    super.key,
    required this.name,
    required this.image,
    required this.money
  });

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image,width: 10,),
            Text(
              name,
              style: kP3,
            ),
              Container(
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: kCardPadding / 2,
                  child: Text(
                    '$money md \$',
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
