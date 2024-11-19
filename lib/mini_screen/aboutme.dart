import 'package:awesome_portfolio/providers/current_state.dart';
import 'package:awesome_portfolio/screen/homescreen/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentState currentState =
        Provider.of<CurrentState>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
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
          'About Me',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/image.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hi, I am Okeugo Joshua Chisom',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "I am a passionate Flutter developer with 1 year of hands-on experience in building cross-platform mobile applications. Throughout my journey, I've gained proficiency in Dart and Flutter's robust framework, allowing me to deliver responsive and visually appealing applications. My experience includes API integration, state management using GetX, and effective implementation of UI/UX designs that enhance user engagement and satisfaction.I excel in understanding client requirements and translating them into functional app features, ensuring that the final product aligns with their vision. My ability to communicate technical concepts clearly allows me to guide clients through project progress, fostering a collaborative environment. I am committed to delivering high-quality, scalable solutions that not only meet but exceed client expectations.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
