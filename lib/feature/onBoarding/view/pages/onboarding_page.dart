import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/feature/login/presentation/pages/signup_page.dart';
import 'package:majeat/feature/onBoarding/view/widgets/Indecatror.dart';
import 'package:majeat/feature/onBoarding/view/widgets/center_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  int currentIndex = 0;

  nextFunction() {
    _pageController.nextPage(
        duration: OnboardingPage._kDuration, curve: OnboardingPage._kCurve);
  }

  previousFunction() {
    _pageController.previousPage(
        duration: OnboardingPage._kDuration, curve: OnboardingPage._kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              Container(
                child: center_content(
                    iconData: Icons.book,
                    description:
                        'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                    image_url: 'https://images.pexels.com/photos/20655113/pexels-photo-20655113/free-photo-of-men-standing-by-a-food-stand-in-the-evening.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    title: 'Order for Food'),
              ),
              Container(

                child: center_content(
                    iconData: Icons.delivery_dining,
                    description:
                        'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                    image_url: 'https://images.pexels.com/photos/17391588/pexels-photo-17391588/free-photo-of-woman-eating-fish-in-restaurant.jpeg?auto=compress&cs=tinysrgb&w=300',
                    title: 'Delivery for Food'),
              ),
              Container(
                child: center_content(
                    iconData: Icons.payment,
                    description:
                        'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                    image_url: 'https://media.istockphoto.com/id/1363074251/photo/vegetarian-injera-meal-with-shiro-lentils-and-egg.jpg?b=1&s=612x612&w=0&k=20&c=1x7l5GkUyep01ADHxiQxQtLhLqxtF3plRCR0wm_JNjU=',
                    title: 'Order for Food',
                    child: BlurredContainer(
                      margin: const EdgeInsets.only(top: 20),
                      backgroundColor: const Color.fromARGB(255, 241, 210, 13),
                      child: InkWell(onTap: (){
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const SignupPage(),
                    ),
                  );
                      },child: const Text('Continue',style: AppConstant.bodyStyle,),)),),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () => previousFunction(),
                        child: const Text("Previous")),
                    const SizedBox(
                      width: 50,
                    ),
                    InkWell(onTap: () => nextFunction(), child: const Text("Next"))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
