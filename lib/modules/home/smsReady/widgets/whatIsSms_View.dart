import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class WhatIsSmsView extends StatelessWidget {
  const WhatIsSmsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            NavBar(),
            WhatIsSmsViewContent(),
            Divider(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class WhatIsSmsViewContent extends StatelessWidget {
  const WhatIsSmsViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _WhatIsSmsHero(),
        _PlatformsSection(),
        _WhySmsExistsSection(),
        _VersionSevenSection(),
        _ExploreSystemSection(),
      ],
    );
  }
}

class _WhatIsSmsHero extends StatelessWidget {
  const _WhatIsSmsHero();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isMobile
              ? Column(
                  children: [
                    _heroText(isMobile),
                    const SizedBox(height: 20),
                    _heroImage(),
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 12, child: _heroText(isMobile)),
                    const SizedBox(width: 40),
                    Expanded(flex: 11, child: _heroImage()),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _heroText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A Modern Colour\nSystem for a Multi-\nMedia World',
          style: TextStyle(
            fontSize: isMobile ? 36 : 48,
            fontWeight: FontWeight.w900,
            color: const Color(0xFF7A4A3A),
            height: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _heroImage() {
    return Image.asset('assets/images/mordenColorimg.png', fit: BoxFit.contain);
  }
}

class _PlatformsSection extends StatelessWidget {
  const _PlatformsSection();

  static const List<Map<String, dynamic>> _platforms = [
    {'label': 'Packaging', 'icon': Icons.inventory_2_outlined},
    {'label': 'Website', 'icon': Icons.web_outlined},
    {'label': 'Mobile', 'icon': Icons.smartphone_outlined},
    {'label': 'Social Media', 'icon': Icons.share_outlined},
    {'label': 'TV Graphics', 'icon': Icons.tv_outlined},
    {'label': 'Office Printer', 'icon': Icons.print_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'SMS ensures your colours look right on:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns = isMobile ? 2 : 4;
                  final gap = 16.0;
                  final itemWidth = (width - gap * (columns - 1)) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: _platforms
                        .map(
                          (p) => Container(
                            width: itemWidth,
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              color: const Color(0xFFEFF3F6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  p['icon'],
                                  color: const Color(0xFFE5876F),
                                  size: 32,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  p['label'],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 48),
              const Text(
                'SMS is the only colour system built for true 3C - CrossMedia Colour Consistency.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF8A5B4F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WhySmsExistsSection extends StatelessWidget {
  const _WhySmsExistsSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20),
      color: AppColors.background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Why SMS Exists',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 32 : 42,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Traditional spot ink systems were created for print-only workflows. Today, brands live everywhere.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 15 : 18,
                  color: const Color(0xFF4B5563),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The Problem:',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color(0xFF1F2937),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'How do you keep colour consistent across both print and digital media?',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _ProblemApproachCard(
                title: 'The SMS Approach',
                points: const [
                  'LAB-anchored colours',
                  'CMYK builds aligned with ISO standards',
                  'sRGB-based digital colours',
                  'Home & Office palettes for low-gamut displays',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProblemApproachCard extends StatelessWidget {
  final String title;
  final List<String>? points;

  const _ProblemApproachCard({required this.title, this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF1F2937),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 24),
          if (points != null)
            ...points!.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF4B5563),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _VersionSevenSection extends StatelessWidget {
  const _VersionSevenSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: const Color(0xFFEFF3F6),
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'Version 7 - Our Biggest Update Ever',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  color: const Color(0xFF1F2937),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'SMS v7 includes:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: const Color(0xFF4B5563)),
              ),
              const SizedBox(height: 48),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        value: '1.738',
                        label: 'Colours From v6',
                      ),
                    ),
                    _verticalDivider(),
                    Expanded(
                      child: _StatCard(value: '+869', label: 'New Colours'),
                    ),
                    _verticalDivider(),
                    Expanded(
                      child: _StatCard(value: '2.608', label: 'Total Colour'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(width: 0.5, color: const Color(0xFFD1D5DB));
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2937),
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 11 : 12,
            color: const Color(0xFF6B7280),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ExploreSystemSection extends StatelessWidget {
  const _ExploreSystemSection();

  static const _cards = [
    _ExploreCardData(
      title: 'SMS Standard (P20)',
      body:
          'Industrial, brand colours for retail, TV, and CMYK print workflows.',
    ),
    _ExploreCardData(
      title: 'SMS Max (P20x)',
      body: 'Vivid colours for retail print, packaging, signage, web, and TV.',
    ),
    _ExploreCardData(
      title: 'SMS Eco (P20e)',
      body: 'Eco-friendly colours for recycled and uncoated papers.',
    ),
    _ExploreCardData(
      title: 'SMS Max Home & Office (P20xo)',
      body: 'Optimised colours for low-gamut displays and office printing.',
    ),
    _ExploreCardData(
      title: 'SMS Standard Home & Office (P20o)',
      body: 'Standard colours optimised for laptop displays and printing.',
    ),
    _ExploreCardData(
      title: 'SMS Super Max (P20sx)',
      body: 'Super wide colour set for extended gamut printing.',
    ),
  ];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Explore the SMS System',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 36,
                    color: const Color(0xFF1F2937),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 32 : 44),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns;
                  if (width < 450) {
                    columns = 1;
                  } else if (width < 800) {
                    columns = 2;
                  } else {
                    columns = 3;
                  }
                  final gap = isMobile ? 12.0 : 16.0;
                  final cardWidth = (width - gap * (columns - 1)) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    children: _cards
                        .map(
                          (item) => SizedBox(
                            width: cardWidth,
                            child: _ExploreCard(item: item),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreCardData {
  final String title;
  final String body;

  const _ExploreCardData({required this.title, required this.body});
}

class _ExploreCard extends StatelessWidget {
  final _ExploreCardData item;

  const _ExploreCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item.body,
            style: TextStyle(
              fontSize: 13,
              color: const Color(0xFF4B5563),
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Learn more',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF8A5B4F),
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 14, color: Color(0xFF8A5B4F)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
