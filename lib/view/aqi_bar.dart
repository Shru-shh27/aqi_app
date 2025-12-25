import 'package:flutter/material.dart';


class AqiBar extends StatelessWidget {
  const AqiBar({super.key,
    required this.bgColor,
    required this.range,
  });

  final Color bgColor;
  final String range;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1),
      width: MediaQuery.widthOf(context) * 0.15,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Text( range,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}



