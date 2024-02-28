import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomCard extends StatelessWidget {
  final bool isEnabled;
  const CustomCard({
    super.key,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
