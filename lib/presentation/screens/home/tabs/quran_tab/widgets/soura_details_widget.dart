import 'package:flutter/material.dart';
import 'package:islamic_app/core/color_manager.dart';

class SuraDetailsWidget extends StatelessWidget {
  String verses;
  int index;

  SuraDetailsWidget({super.key, required this.verses, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManger.goldColor,
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Text(
          ' $verses   (  ${index + 1}  ) ',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
