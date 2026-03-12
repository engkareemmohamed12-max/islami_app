import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';

class SuraContent extends StatefulWidget {
  final String content;
  final int index;

  const SuraContent({
    super.key,
    required this.content,
    required this.index,
  });

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppMediaQuery.height(context) * 0.02,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppMediaQuery.width(context) * 0.02,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        child: Text(
          '${widget.content} [${widget.index + 1}]',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: AppStyle.bold20primary.copyWith(
            color: isSelected ? Colors.black : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}