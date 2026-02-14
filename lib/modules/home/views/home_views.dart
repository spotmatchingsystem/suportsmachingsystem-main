import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/status_section.dart';
import 'widgets/why_choosesection.dart';
import 'widgets/explore_section.dart';
import 'widgets/pricing_section.dart';
import 'widgets/footer_dart.dart';
import '../../../themes/app_colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(children: const [NavBar(), HomeContent(), Footer()]),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SystemColor(),
        StatsSection(),
        WhatIsSmsSection(),
        WhyChooseSection(),
        ExploreSection(),
        PricingSection(),
      ],
    );
  }
}
