import 'package:flutter/material.dart';
import 'package:food_delivery/utills/dimension.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utills/colors.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) {
                  return Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  );
                },
              ),
            ),
            SizedBox(width: 5),
            SmallText(text: "4.5"),
            SizedBox(width: 10),
            SmallText(text: '1248'),
            SizedBox(width: 10),
            SmallText(text: "Commens"),
          ],
        ),
        SizedBox(height: Dimensions.height10),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1,
              ),
              IconTextWidget(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: AppColors.mainColor,
              ),
              IconTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppColors.iconColor2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
