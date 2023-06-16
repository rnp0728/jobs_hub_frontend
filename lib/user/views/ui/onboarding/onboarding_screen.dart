import 'package:flutter/material.dart';
import 'package:jobs_hub/user/controllers/onboarding_provider.dart';
import 'package:jobs_hub/user/views/common/exports.dart';
import 'package:jobs_hub/user/views/ui/onboarding/widgets/page_one.dart';
import 'package:jobs_hub/user/views/ui/onboarding/widgets/page_three.dart';
import 'package:jobs_hub/user/views/ui/onboarding/widgets/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardNotifier>(
      builder: (context, onBoardNotifier, child) {
        return Center(
          child: Stack(
            children: [
              PageView(
                physics: onBoardNotifier.isLastPage
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (pageNo) {
                  onBoardNotifier.isLastPage = pageNo == 2;
                },
                children: const [
                  PageOne(),
                  PageTwo(),
                  PageThree(),
                ],
              ),
              Positioned(
                bottom: height * 0.12,
                left: 0,
                right: 0,
                child: onBoardNotifier.isLastPage
                    ? const SizedBox.shrink()
                    : Center(
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: WormEffect(
                              dotWidth: 12,
                              dotHeight: 12,
                              spacing: 10,
                              dotColor: Color(kDarkGrey.value).withOpacity(0.5),
                              activeDotColor: Color(kLight.value)),
                        ),
                      ),
              ),
              Positioned(
                child: onBoardNotifier.isLastPage
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => pageController.jumpToPage(2),
                                child: ReusableText(
                                  text: 'Skip',
                                  style: appstyle(
                                      16, Color(kLight.value), FontWeight.w500),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                                child: ReusableText(
                                  text: 'Next',
                                  style: appstyle(
                                      16, Color(kLight.value), FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
