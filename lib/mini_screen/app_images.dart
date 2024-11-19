import 'package:awesome_portfolio/mini_screen/apps.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/screen/homescreen/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppImages extends StatelessWidget {
  const AppImages({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    Map<String, List<String>> apps = {
      'apps_Images': [
        'assets/images/gnm_app/1.png',
        'assets/images/shopping_app/1.png',
        'assets/images/sms_generate_app/1.png',
        'assets/images/nfc_inventory_app/1.png'
      ],
      'apps_names': [
        'GNM Analytics App',
        'Shopping App',
        'SMS Generate App',
        'NFC Inventory App'
      ]
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            currentState.ChangePhoneScreen(const PhoneScreen());
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'My Apps',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: apps['apps_Images']!.length,
                  itemBuilder: (context, index) {
                    List<String> app_images = apps['apps_Images']!;
                    List<String> app_names = apps['apps_names']!;

                    return InkWell(
                      onTap: () {
                        currentState.ChangePhoneScreen(Apps(
                          title: app_names[index],
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 150,
                        height: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(3, 8),
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 3.0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              app_images[index],
                              width: 100,
                              height: 70,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              app_names[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center, // Center the text
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
