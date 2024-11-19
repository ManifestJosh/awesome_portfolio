import 'dart:async';
import 'package:awesome_portfolio/screen/homescreen/phone_screen.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currentDevice = Devices.android.samsungGalaxyNote20;
  int knobSelected = 2;
  final PageController pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> quotes = [
    'First, solve the problem. Then, write the code. – John Johnson',
    'Code is like humor. When you have to explain it, it’s bad. – Cory House',
    'Simplicity is the soul of efficiency. – Austin Freeman',
    'Before software can be reusable it first has to be usable. – Ralph Johnson',
  ];

  // Constructor to start the auto-scroll
  CurrentState() {
    _startAutoScroll();
  }

  void ChangeSelectedDevice(DeviceInfo device) {
    currentDevice = device;
    notifyListeners();
  }

  // Auto-scroll function with a periodic timer
  void _startAutoScroll() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < quotes.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      notifyListeners();
    });
  }

  void ChangeGradient(int index) {
    knobSelected = index;
    notifyListeners();
  }

  Widget currentscreen = const PhoneScreen();
  void ChangePhoneScreen(Widget change) {
    currentscreen = change;
    notifyListeners();
  }

  Future<void> LaunchInBrowser(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('Something went wrong');
    }
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose the PageController
    _timer?.cancel(); // Cancel the timer when no longer needed
    super.dispose();
  }
}
