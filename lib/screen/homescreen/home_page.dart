import 'dart:async';
import 'dart:ui';

import 'package:awesome_portfolio/consts/data.dart';
import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/screen/homescreen/phone_screen.dart';
import 'package:awesome_portfolio/widgets/frostedcontainers.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, __) {
              return Container(
                decoration: BoxDecoration(
                  gradient: colorPalette[currentState.knobSelected].gradient,
                ),
              );
            },
          ),
          Selector<CurrentState, int>(
            selector: (context, provider) => provider.knobSelected,
            builder: (context, _, __) {
              return SvgPicture.asset(
                colorPalette[currentState.knobSelected].svgPath,
                height: size.height,
                width: double.maxFinite,
                fit: BoxFit.fitWidth,
              );
            },
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: size.height - 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        const frosted_Containers(
                          height: 350,
                          width: 250,
                          child: Center(
                            child: Text(
                              'WELCOME,',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AutofillHints.addressCity,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 34),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        frosted_Containers(
                          padding: const EdgeInsets.all(20),
                          height: 200,
                          width: 250,
                          child: Column(
                            children: [
                              Icon(
                                Icons.connect_without_contact,
                                size: 80,
                                color: Colors.red.shade200,
                                shadows: [
                                  const Shadow(
                                      offset: Offset(0, 3),
                                      color: Colors.white),
                                ],
                              ),
                              const Text(
                                "Let's Connect",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Consumer<CurrentState>(builder: (context, _, __) {
                      return DeviceFrame(
                        device: currentState.currentDevice,
                        screen: currentState.currentscreen,
                      );
                    }),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        frosted_Containers(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 350,
                          width: 250,
                          child: Center(
                            child: Wrap(
                              children: List.generate(
                                colorPalette.length,
                                (index) => CustomButton(
                                  mainAxis: MainAxisAlignment.center,
                                  margin: const EdgeInsets.all(16),
                                  onPressed: () {
                                    currentState.ChangeGradient(index);
                                  },
                                  pressed: currentState.knobSelected == index
                                      ? Pressed.pressed
                                      : Pressed.notPressed,
                                  animate: true,
                                  isThreeD: true,
                                  borderRadius: 100,
                                  height: 52,
                                  width: 52,
                                  backgroundColor: colorPalette[index].color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Consumer<CurrentState>(
                          builder: (context, currentstate, child) {
                            return frosted_Containers(
                              padding: const EdgeInsets.all(16),
                              height: 200,
                              width: 250,
                              child: PageView.builder(
                                controller: currentState.pageController,
                                itemCount: currentState.quotes.length,
                                itemBuilder: (context, index) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      child: Text(
                                        currentState.quotes[index],
                                        textAlign: TextAlign.start,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    device.length,
                    (index) => Selector<CurrentState, DeviceInfo>(
                      selector: (context, provider) => provider.currentDevice,
                      builder: (context, _, __) {
                        return CustomButton(
                          backgroundColor: Colors.black,
                          onPressed: () {
                            currentState.ChangeSelectedDevice(
                                device[index].device);
                          },
                          pressed:
                              currentState.currentDevice == device[index].device
                                  ? Pressed.pressed
                                  : Pressed.notPressed,
                          shadowColor: Colors.transparent,
                          animate: true,
                          height: 28,
                          width: 28,
                          borderRadius: 100,
                          isThreeD: true,
                          child: Center(
                            child: Icon(
                              device[index].data,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
