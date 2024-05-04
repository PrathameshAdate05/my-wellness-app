import 'package:flutter/material.dart';
import 'package:my_wellness_mobile/utils/colors.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.image,
    required this.onPressed,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  final String image;
  final GestureTapCallback onPressed;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: GestureDetector(
          onTap: onPressed,
          child: Column(
            children: [
              Image.asset(
                image,
                color: isSelected ? CustomColor.lightGreen : Colors.grey,
                height: 25,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(title,
                  style: TextStyle(
                      color: isSelected ? CustomColor.lightGreen : Colors.grey,
                      fontSize: 11,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400))
            ],
          )),
    );
  }
}
