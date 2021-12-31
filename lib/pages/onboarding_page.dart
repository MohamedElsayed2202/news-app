import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:news_app/pages/news_screens.dart';
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Be the first to know the news',
          body: 'Get latest news on your country and around the world',
          image: buildImage('images/news-logo.png'),
          decoration: getPageDecoration()
        ),
        PageViewModel(
            title: 'Simple UI',
            body: 'Home page',
            footer: buildImage('images/home_page.png'),
            decoration: getPageDecoration()
        ),
        PageViewModel(
            title: 'Simple UI',
            body: 'Category page',
            footer: buildImage('images/category_page.png'),
            decoration: getPageDecoration()
        )
      ],
      isTopSafeArea: true,
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      showNextButton: true,
      done: const Text('Get start',style: TextStyle(fontWeight: FontWeight.bold),),
      onDone: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const NewsScreen()));
      },
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 350,),);

  PageDecoration getPageDecoration()=> const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    bodyTextStyle: TextStyle(fontSize: 20),
    descriptionPadding: EdgeInsets.all(16),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white12
  );

  DotsDecorator getDotDecoration() =>  DotsDecorator(
    color: const Color(0xFFBDBDBD),
    activeSize: const Size(22,10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24)
    )
  );
}
