import 'package:flutter/material.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: TextFormField(
        controller: CreateNewGameController.to.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0XFFBFD6FF),
        ),
        decoration: InputDecoration(
          hintText: 'Taper votre nom',
          hintStyle: const TextStyle(
            decoration: TextDecoration.underline,
            color: Color(0XFFBFD6FF),
          ),
          filled: true,
          fillColor: const Color(0XFF254272),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 2, color: kStrokeColor),
          ),
        ),
      ),
    );
  }
}
