import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/screens/register/register_screen.dart';
import 'package:task1/shared/utils.dart';
import 'package:task1/shared/widgets/default_button.dart';

import '../../models/boarding_model.dart';
import '../../shared/constants.dart';
import '../../shared/network/cashe_helper.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  PageController boardControler = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/Online_shopping_pana.svg',
        title: 'Online Shopping',
        body: 'A shopping app that makes you feel at home with each experience carefully selected to satisfy you.'),
    BoardingModel(
        image: 'assets/images/Credit_Card_Payment_cuate.svg',
        title: 'Easy Payment',
        body: 'We have various methods of payments available for you.'),
    BoardingModel(
        image: 'assets/images/Refund-pana.svg',
        title: 'Return',
        body: 'On Board 3 Body'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                submit();
              },
              child: Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(children: [
                TextSpan(
                    text: '7',
                    style: TextStyle(color: kPrimaryColor, fontSize: 30)),
                TextSpan(
                    text: 'Krave',
                    style: TextStyle(color: accentColor, fontSize: 30)),
              ]),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: boardControler,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                     // navigateAndFinish(context, LoginScreen());
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(boarding[index], context),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SmoothPageIndicator(
                controller: boardControler,
                effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    expansionFactor: 4,
                    activeDotColor: kPrimaryColor),
                count: boarding.length),
            const SizedBox(
              height: 16,
            ),
            DefaultButton(text: 'Get Started', onPressed: submit),
            Row(
              children: [
                const Text('Dont\'t have an account?'),
                TextButton(
                    onPressed: () {
                      navigateAndFinish(context, RegiserScreen());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: accentColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    CasheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  Widget buildOnBoardingItem(BoardingModel model, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset(model.image)),
          const SizedBox(
            height: 16,
          ),
          Text(
            model.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            model.body,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      );
}
