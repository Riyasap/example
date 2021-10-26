import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redteam_xperience/core/constants/assets.dart';
import 'package:redteam_xperience/core/style/custom_colors.dart';

class DropDownCustoms extends StatelessWidget {
  const DropDownCustoms({required this.hint,required this.itemList,});
  final String hint;
  final List<String> itemList;


  //String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          filled: true,
          hintStyle:Theme
              .of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: CustomColors.light2),
          hintText: hint,
          fillColor: Colors.white),
      //value: dropdownValue,
      icon: SvgPicture.asset(IconAssets.arrowdown,color: CustomColors.red,),
      iconSize: 24,
      elevation: 24,
      style: const TextStyle(color: CustomColors.light2),
      onChanged: (String? newValue) {

          //dropdownValue = newValue!;

      },
      items: itemList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,style: Theme
            .of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: CustomColors.light2,))
        );
      }).toList(),
    );

  }
}
