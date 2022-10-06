import 'package:flutter/material.dart';
import 'package:food_delivery/utills/colors.dart';
import 'package:food_delivery/utills/dimension.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExandableTextWidget extends StatefulWidget {
  final String text;
  const ExandableTextWidget({super.key, required this.text});

  @override
  State<ExandableTextWidget> createState() => _ExandableTextWidgetState();
}

class _ExandableTextWidgetState extends State<ExandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;
  //i love flutter laravel and golang 30  50

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(color: AppColors.paraColor, text: firstHalf)
          : Column(
              children: [
                SmallText(
                  height: 1.8,
                  color: AppColors.paraColor,
                  size: Dimensions.font16,
                  text: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                          size: Dimensions.font16,
                          text: "Show more",
                          color: AppColors.mainColor),
                      Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
