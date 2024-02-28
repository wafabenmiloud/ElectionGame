import 'package:flutter/material.dart';

import 'package:gamev2/utils/constants.dart';

class PagePadding extends StatelessWidget {
  final Widget child;
  const PagePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: child,
    );
  }
}
