import 'package:flutter/material.dart';
import 'package:furry_care/core/constants/colors.dart';
import 'package:furry_care/core/constants/strings.dart';
import 'package:furry_care/core/enums/view_state.dart';
import 'package:furry_care/core/model/onboarding.dart';
import 'package:furry_care/core/view_model/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel {
  int? currentIndexPage;
  PageController? onboardController;

  OnboardingViewModel() {
    currentIndexPage = 0;
    onboardController = PageController();
    // injectOnboardings();
  }

  setCurrentPageIndex(value) {
    currentIndexPage = value;
    setState(ViewState.idle);
  }

  animateToPage(int index) {
    onboardController!.animateToPage(index,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }

  List<Onboarding> onboardings = [
    Onboarding(
        image: '$staticAsset/onboarding1.png',
        buttonColor: borderColor,
        backgroundColor: const Color(0xFFF2A950),
        title: 'Tracking your daily diet.',
        description:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod sed tempor invidu nt ut labore et dolore magna aliquyam erat, sed diam voluptua.'),
    Onboarding(
        image: '$staticAsset/onboarding2.png',
        backgroundColor: Colors.white,
        buttonColor: const Color(0xFF362618),
        title: 'Monitor the consumption targets accordingly.',
        description:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod sed tempor invidu diam voluptua.'),
    Onboarding(
        image: '$staticAsset/onboarding3.png',
        backgroundColor: const Color(0xFF2D7366),
        buttonColor: Colors.white,
        title: 'Regular nutrition reports to set new diet targets.',
        description:
            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod sed tempor invidu diam voluptua.'),
  ];
}
