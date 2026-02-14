import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';
import '../../../../routes/app_routes.dart';

class SystemColor extends StatelessWidget {
  const SystemColor({super.key});

  @override
  Widget build(BuildContext context) {
    return const HeroSection();
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: isMobile ? 40 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              if (isMobile)
                Column(
                  children: [
                    const _HeroText(),
                    const SizedBox(height: 40),
                    Image.asset(
                      'assets/images/spotbgimage.png',
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(flex: 12, child: _HeroText()),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 11,
                      child: Image.asset(
                        'assets/images/spotbgimage.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Spot\nMatching\nSystem v7',
          style: TextStyle(
            fontSize: isMobile ? 42 : 64,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF7A4A3A),
            height: 1.0,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'The world\'s only 3C colour palette - CrossMedia Colour Consistency.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '2,607 CMYK-based colours designed for modern branding, printing, digital media, and real-world screens.',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(AppRoutes.shopView),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8A5B4F),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Shop SMS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              onPressed: () {
                _launchURL(
                  'https://www.linkedin.com/company/spot-matching-system/',
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFE5876F),
                side: const BorderSide(color: Color(0xFFD1CBC8)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Follow us on Linkedin',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class WhatIsSmsSection extends StatelessWidget {
  const WhatIsSmsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isMobile
              ? Column(
                  children: [
                    const _WhatIsSmsText(),
                    const SizedBox(height: 48),
                    const _WhatIsSmsGraphic(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 12,
                      child: _WhatIsSmsText(),
                    ), // Increased flex for text
                    const SizedBox(width: 80),
                    const Expanded(
                      flex: 11,
                      child: _WhatIsSmsGraphic(),
                    ), // Decreased relative flex for image
                  ],
                ),
        ),
      ),
    );
  }
}

class _WhatIsSmsText extends StatelessWidget {
  const _WhatIsSmsText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What is SMS?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'The Spot Matching System (SMS) is a modern colour system built for the world we live in today — where brands must look consistent on print, web, mobile, social media, packaging, and even low-gamut customer laptops.',
          style: TextStyle(fontSize: 16, color: AppColors.black, height: 1.6),
        ),
        const SizedBox(height: 24),
        const Text(
          'Traditional spot ink systems rely on special inks. '
          'SMS doesn\'t. Every SMS colour is defined by a fixed CIELAB value, so your colours stay consistent across print, digital, and real-world screens.',
          style: TextStyle(fontSize: 16, color: AppColors.black, height: 1.6),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Learn more about SMS',
                style: TextStyle(
                  color: Color(0xFFE5876F),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward, size: 16, color: Color(0xFFE5876F)),
            ],
          ),
        ),
      ],
    );
  }
}

class _WhatIsSmsGraphic extends StatelessWidget {
  const _WhatIsSmsGraphic();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: Image.asset("assets/images/whatissms.png", fit: BoxFit.contain),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
