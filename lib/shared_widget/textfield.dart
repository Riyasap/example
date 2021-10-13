import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';


class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({Key? key, this.hint,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.errorText,
    this.keyboard,
  }) : super(key: key);

  final String? hint;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final ValueChanged<String>? onChanged;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  String num = "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              widget.hint.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: CustomColors.light2),
            ),
          ),
          fillColor: CustomColors.bglte,
          filled: true,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.bglte),
              borderRadius: BorderRadius.circular(16)),
          labelStyle: const TextStyle(fontSize: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: CustomColors.bglte),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: CustomColors.bglte),
          ),

        )
    );
  }
}