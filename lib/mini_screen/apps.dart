import 'dart:async';
import 'package:awesome_portfolio/mini_screen/app_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../providers/current_state.dart';

class Apps extends StatefulWidget {
  const Apps({super.key, required this.title});
  final String title;

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  late PageController controller;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    controller = PageController();

    // Start a timer that changes the page every 2 seconds.
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (controller.hasClients) {
        int nextPage = controller.page!.toInt() + 1;
        if (nextPage >= images.length) {
          nextPage = 0; // Loop back to the first page.
        }
        controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Stop the timer when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  late List<String> images;

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    // Set AppBar color based on the title.
    Color appBarColor;
    switch (widget.title) {
      case 'SMS Generate App':
        appBarColor = Colors.green;
        break;
      case 'GNM Analytics App':
        appBarColor = Colors.purple;
        break;
      case 'Shopping App':
        appBarColor = Colors.blue;
        break;
      default:
        appBarColor = Colors.black;
    }

    // Assign images based on the app title.
    images = [];
    switch (widget.title) {
      case 'SMS Generate App':
        images = [
          'assets/images/sms_generate_app/2.png',
          'assets/images/sms_generate_app/3.png',
          'assets/images/sms_generate_app/3_2.png',
          'assets/images/sms_generate_app/4.png',
          'assets/images/sms_generate_app/5.png',
          'assets/images/sms_generate_app/6.png',
          'assets/images/sms_generate_app/7.png',
          'assets/images/sms_generate_app/8.png',
          'assets/images/sms_generate_app/9.png',
          'assets/images/sms_generate_app/10.png',
          'assets/images/sms_generate_app/11.png'
        ];
        break;
      case 'GNM Analytics App':
        images = [
          'assets/images/gnm_app/1_2.png',
          'assets/images/gnm_app/2.png',
          'assets/images/gnm_app/3.png',
          'assets/images/gnm_app/4.png',
        ];
        break;
      case 'Shopping App':
        images = [
          'assets/images/shopping_app/1_2.png',
          'assets/images/shopping_app/2.png',
          'assets/images/shopping_app/3.png',
          'assets/images/shopping_app/4.png',
          'assets/images/shopping_app/5.png',
          'assets/images/shopping_app/6.png',
          'assets/images/shopping_app/7.png',
          'assets/images/shopping_app/8.png'
        ];
        break;
      case 'NFC Inventory App':
        images = [
          'assets/images/nfc_inventory_app/1_2.png',
          'assets/images/nfc_inventory_app/2.png',
          'assets/images/nfc_inventory_app/3.png',
          'assets/images/nfc_inventory_app/4.png',
          'assets/images/nfc_inventory_app/5.png',
          'assets/images/nfc_inventory_app/6.png'
        ];
        break;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: InkWell(
          onTap: () {
            currentState.ChangePhoneScreen(const AppImages());
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(
                    child: Image.asset(
                      images[index],
                      width: 350,
                      height: 900,
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: images.length,
              effect: WormEffect(
                dotWidth: 10,
                dotHeight: 5,
                activeDotColor: Colors.blue.shade200,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
