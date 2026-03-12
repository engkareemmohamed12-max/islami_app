import 'package:flutter/material.dart';
import 'package:islami_app/Ui/tabs/radio/radio_tab.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  bool showRadioList = true; // لتحديد أي قائمة تظهر

  @override
  Widget build(BuildContext context) {
    // القوائم
    final radioList = [
      "Radio Ibrahim Al-Akdar",
      "Radio Al-Qaria Yassen",
      "Radio Ahmed Al-Trabulsi",
      "Radio Addokali Mohammad",
      "Radio Majed Al-Enezi",
    ];

    final recitersList = [
      "Ibrahim Al-Akdar",
      "Akram Alalaqmi",
      "Majed Al-Enezi",
      "Malik shaibat Alhamed",
    ];

    return Column(
      children: [

        const SizedBox(height: 20),

        /// Tabs
        Row(
          children: [

            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showRadioList = true;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: showRadioList ? const Color(0xffE2BE7F) : Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Radio",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: showRadioList ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showRadioList = false;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: showRadioList ? Colors.black45 : const Color(0xffE2BE7F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Reciters",
                      style: TextStyle(
                        color: showRadioList ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),

        const SizedBox(height: 20),

        /// List
        Expanded(
          child: ListView(
            children: (showRadioList ? radioList : recitersList)
                .map((title) => RadioCard(title: title))
                .toList(),
          ),
        ),

      ],
    );
  }
}