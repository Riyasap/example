import 'package:flutter/material.dart';

class AllMaterialScreen extends StatelessWidget {
  const AllMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24,),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.red,
                      child: Column(children: [
                        SizedBox(
                          height: 24,
                        ),
                      ]));
                }),
          ],
        ));
  }
}
