import 'package:flutter/material.dart';

void main() {
  runApp(GroceryDeliveryApp());
}

class GroceryDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate loading tasks (e.g., fetching data, checking updates)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          OnboardingPage(
            title: 'Discover New Products',
            description:
            'Explore a wide range of fresh groceries and household items.',
            imagePath: 'assets/images/onboarding1.png',
          ),
          OnboardingPage(
            title: 'Enjoy Exclusive Offers',
            description:
            'Get access to exclusive discounts and deals on your favorite products.',
            imagePath: 'assets/images/onboarding2.png',
          ),
          OnboardingPage(
            title: 'Quick and Easy Delivery',
            description:
            'Place your order with a few taps and get your groceries delivered to your doorstep.',
            imagePath: 'assets/images/onboarding3.png',
            isLastPage: true,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isLastPage;

  const OnboardingPage({super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath, height: 300),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          if (!isLastPage)
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              child: const Text('Next'),
            ),
          if (isLastPage)
            ElevatedButton(
              onPressed: () {
                // Navigate to the main screen or login/register screen
              },
              child: const Text('Get Started'),
            ),
        ],
      ),
    );
  }
}
