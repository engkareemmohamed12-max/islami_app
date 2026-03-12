import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/tabs/time/widget/azkar_widget.dart' show AzkarCard;

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  int activeIndex = 2;

  final prayers = [
    {"name": "Fajr", "time": "04:04"},
    {"name": "Dhuhr", "time": "01:01"},
    {"name": "Asr", "time": "04:38"},
    {"name": "Maghrib", "time": "07:57"},
    {"name": "Isha", "time": "09:15"},
  ];

  @override
  Widget build(BuildContext context) {
    final cardHeight = AppMediaQuery.height(context) * 0.32;
    final carouselHeight = cardHeight * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xff2C2C2C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppMediaQuery.width(context) * 0.05,
              vertical: AppMediaQuery.height(context) * 0.01,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [

                        Image.asset(
                          "assets/images/Rectangle 138.png",
                          width: double.infinity,
                          height: cardHeight,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/images/Group 10.png",
                          width: double.infinity,
                          height: cardHeight,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: _dateCapsule("16 Jul,\n2024"),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: _dateCapsule("09 Muh,\n1446"),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppMediaQuery.width(context) * 0.14),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Pray Time",
                                    style: TextStyle(
                                      color: AppColors.blackBgColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: cardHeight * 0.02),
                                  const Text(
                                    "Tuesday",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                              SizedBox(height: cardHeight * 0.02),

                              SizedBox(
                                height: carouselHeight,
                                child: CarouselSlider.builder(
                                  itemCount: prayers.length,
                                  options: CarouselOptions(
                                    height: carouselHeight,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.28,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        activeIndex = index;
                                      });
                                    },
                                  ),
                                  itemBuilder: (context, index, realIdx) {
                                    final prayer = prayers[index];
                                    final active = index == activeIndex;

                                    return AnimatedContainer(
                                      duration:
                                      const Duration(milliseconds: 300),
                                      width: active ? 95 : 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Pray Time.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              prayer["name"]!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              prayer["time"]!,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              "PM",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: cardHeight * 0.22),

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next Pray - 02:32",
                                    style: TextStyle(
                                      color: AppColors.blackBgColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.volume_off,
                                    color: AppColors.blackColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // =================== Azkar Section ===================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Azkar",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Row(
                          children: const [
                            Expanded(
                              child: AzkarCard(
                                title: "Evening Azkar",
                                image: "assets/images/bell-icon 1.png",
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: AzkarCard(
                                title: "Morning Azkar",
                                image: "assets/images/bell-icon 2.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateCapsule(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}