import 'package:flutter/material.dart';

import '../../Utils/app_style.dart';

class HadethTextWidget extends StatelessWidget {

  final String text ;
  final TextStyle textStyle ;
   HadethTextWidget({super.key , required this.text , required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text( text , style: textStyle , textAlign: TextAlign.center,);
  }
}
