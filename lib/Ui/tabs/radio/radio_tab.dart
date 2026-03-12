import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';


class RadioCard extends StatelessWidget {

  final String title;

  const RadioCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(vertical: AppMediaQuery.height(context)*0.01),
      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(
        color: const Color(0xffE2BE7F),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image:
        AssetImage('assets/images/Mask group.png'),
        ),
      ),

      child: Column(
        children: [

          /// Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          /// Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [

              Icon(Icons.play_arrow, size: 35),

              SizedBox(width: 20),

              Icon(Icons.volume_up, size: 30),

            ],
          )

        ],
      ),
    );
  }
}