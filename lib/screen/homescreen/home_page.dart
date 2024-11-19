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
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              SizedBox(height: 30.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: size.height - 160.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20.h),
                          frosted_Containers(
                            height: 450.h,
                            width: 350.w,
                            child: Center(
                              child: Text(
                                'WELCOME,',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AutofillHints.addressCity,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 34.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          frosted_Containers(
                            padding: EdgeInsets.all(20.sp),
                            height: 300.h,
                            width: 350.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.connect_without_contact,
                                  size: 80.sp,
                                  color: Colors.red.shade200,
                                  shadows: [
                                    const Shadow(
                                        offset: Offset(0, 3),
                                        color: Colors.white),
                                  ],
                                ),
                                Text(
                                  "Let's Connect",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Consumer<CurrentState>(builder: (context, _, __) {
                        return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: currentState.currentscreen,
                        );
                      }),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        children: [
                          SizedBox(height: 20.h),
                          frosted_Containers(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            height: 450.h,
                            width: 350.w,
                            child: Center(
                              child: Wrap(
                                children: List.generate(
                                  colorPalette.length,
                                  (index) => CustomButton(
                                    mainAxis: MainAxisAlignment.center,
                                    margin: EdgeInsets.all(16.sp),
                                    onPressed: () {
                                      currentState.ChangeGradient(index);
                                    },
                                    pressed: currentState.knobSelected == index
                                        ? Pressed.pressed
                                        : Pressed.notPressed,
                                    animate: true,
                                    isThreeD: true,
                                    borderRadius: 100.r,
                                    height: 52.sp,
                                    width: 52.sp,
                                    backgroundColor: colorPalette[index].color,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Consumer<CurrentState>(
                            builder: (context, currentstate, child) {
                              return frosted_Containers(
                                padding: EdgeInsets.all(16.sp),
                                height: 300.h,
                                width: 350.w,
                                child: PageView.builder(
                                  controller: currentState.pageController,
                                  itemCount: currentState.quotes.length,
                                  itemBuilder: (context, index) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.all(20.sp),
                                      child: Center(
                                        child: SizedBox(
                                          height: 200.h,
                                          width: 200.w,
                                          child: Text(
                                            currentState.quotes[index],
                                            textAlign: TextAlign.start,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
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
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
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
                          height: 87.h,
                          width: 94.w,
                          borderRadius: 100.r,
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
