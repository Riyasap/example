import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';


class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({this.hint,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.errorText,
    this.keyboard,
    this.maxLine=1,
  });


  final String? hint;
  final String? errorText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final ValueChanged<String>? onChanged;
  final int maxLine;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  String num = "";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
        style: const TextStyle(color: CustomColors.light2),
        decoration: InputDecoration(
          hintText: widget.hint.toString(),
          hintStyle: Theme
              .of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: CustomColors.light2),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(16)),
          labelStyle: const TextStyle(fontSize: 30),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),

        )
    );
  }
}