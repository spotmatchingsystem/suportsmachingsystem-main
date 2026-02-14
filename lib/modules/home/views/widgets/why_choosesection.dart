import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class WhyChooseSection extends StatelessWidget {
  const WhyChooseSection({super.key});

  static const List<Map<String, dynamic>> _items = [
    {
      'title': '3C: Cross Media Colour Consistency',
      'icon': Icons.brightness_6_outlined,
      'iconColor': Colors.orange,
    },
    {
      'title': 'Works across print, web, mobile and TV',
      'icon': Icons.devices_outlined,
      'iconColor': Colors.orangeAccent,
    },
    {
      'title': 'No proprietary links or subscriptions',
      'icon': Icons.link_off_outlined,
      'iconColor': Colors.deepOrangeAccent,
    },
    {
      'title': 'Accurate on both high-end and low-gamut displays',
      'icon': Icons.laptop_outlined,
      'iconColor': Colors.redAccent,
    },
    {
      'title': 'The most eco-friendly colour system in the world',
      'icon': Icons.eco_outlined,
      'iconColor': Colors.red,
    },
    {
      'title': '2607 colour per system our biggest palette ever',
      'icon': Icons.palette_outlined,
      'iconColor': Colors.brown,
    },
    {
      'title': 'Future-proof for modern branding',
      'icon': Icons.language_outlined,
      'iconColor': Colors.redAccent,
    },
    {
      'title': 'Built for global ISO printing standards',
      'icon': Icons.print_outlined,
      'iconColor': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background, // Match overall bg
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'Why Designers & Brands Choose\nSMS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns = isMobile ? 1 : 3;
                  final gap = 20.0;
                  final itemWidth = (width - (columns - 1) * gap) / columns;

                  return Wrap(
                    spacing: gap,
                    runSpacing: gap,
                    alignment: WrapAlignment.center,
                    children: _items
                        .map(
                          (e) => SizedBox(
                            width: itemWidth,
                            child: _WhyChooseCard(
                              title: e['title']!,
                              icon: e['icon']!,
                              iconColor: e['iconColor']!,
                            ),
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

class _WhyChooseCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;

  const _WhyChooseCard({
    required this.title,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
