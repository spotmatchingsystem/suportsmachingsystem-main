import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFEFF3F6), // Match background color from screenshot
        border: Border(
          top: BorderSide(color: Color(0xFFD1D5DB), width: 0.5),
          bottom: BorderSide(color: Color(0xFFD1D5DB), width: 0.5),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: 24, // Tighter vertical padding as per screenshot
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _StatItem(
                    value: '359.000.000',
                    label: 'Company Registered',
                  ),
                ),
                _verticalDivider(),
                Expanded(
                  child: _StatItem(value: '15.000', label: 'SMS Colours'),
                ),
                _verticalDivider(),
                Expanded(
                  child: _StatItem(value: 'ISO 12647', label: 'Based Colour'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(width: 0.5, color: const Color(0xFFD1D5DB));
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 24 : 32,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1F2937), // Darker grey/black
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 11 : 12,
            color: const Color(0xFF6B7280), // Muted grey for label
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
