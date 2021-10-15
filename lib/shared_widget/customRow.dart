import 'package:flutter/material.dart';


class CustomRow extends StatefulWidget {
  CustomRow({required this.child1,required this.child2}) : super();

  Widget child1;
  Widget child2;

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.child1,
          widget.child2
        ],

      ),
    );
  }
}
