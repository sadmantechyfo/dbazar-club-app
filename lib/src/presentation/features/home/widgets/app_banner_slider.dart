import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppBannerSlider extends StatefulWidget {
  const AppBannerSlider({super.key});

  @override
  State<AppBannerSlider> createState() => _AppBannerSliderState();
}

class _AppBannerSliderState extends State<AppBannerSlider> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          /// PAGE VIEW (IMAGES)
          PageView.builder(
            controller: _pageController,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFFFF7EC),
                      Color(0xFFFFF1D6),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          /// DOT INDICATOR (ON IMAGE)
          Positioned(
            bottom: 8,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: WormEffect(
                dotHeight: 6,
                dotWidth: 6,
                spacing: 6,
                activeDotColor: Color(0xFF4CAF50),
                dotColor: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
