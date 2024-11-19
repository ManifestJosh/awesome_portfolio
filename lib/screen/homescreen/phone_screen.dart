import 'dart:ui';

import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../consts/data.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: colorPalette[currentState.knobSelected].gradient,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ...List.generate(
              apps.length,
              (index) => Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            if (apps[index].link != null) {
                              currentState.LaunchInBrowser(apps[index].link!);
                            } else if (apps[index].screen != null) {
                              currentState.ChangePhoneScreen(
                                  apps[index].screen!);
                            }
                          },
                          height: 45,
                          borderRadius:
                              currentState.currentDevice == Devices.ios.iPhone13
                                  ? 8
                                  : 100,
                          backgroundColor: apps[index].color,
                          width: 45,
                          child: Center(
                            child: Icon(
                              apps[index].icon,
                              size: 25,
                            ),
                          ),
                        ),
                        Text(
                          apps[index].title,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}