import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {

  int count = 0;
  int tasbeehIndex = 0;

  List<String> tasbeeh = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void onTapSebha() {

    controller.forward(from: 0);

    setState(() {

      count++;

      if (count == 33) {
        count = 0;

        tasbeehIndex++;

        if (tasbeehIndex == tasbeeh.length) {
          tasbeehIndex = 0;
        }
      }

    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى " , style: AppStyle.bold32white),

            Transform.translate(
              offset: const Offset(0, 30),
              child: Image.asset(
                'assets/images/sebha12.png',
                width: 120,
              ),
            ),

            const SizedBox(height: 20),

            Stack(
              alignment: Alignment.center,
              children: [

                GestureDetector(
                  onTap: onTapSebha,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.05).animate(controller),
                    child: Image.asset(
                      "assets/images/SebhaBody 1.png",
                      width: 260,
                    ),
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tasbeeh[tasbeehIndex],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "$count",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ],
                )

              ],
            ),

          ],
        ),
      ),
    );
  }
}