import 'package:flutter/material.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/app_textstyle.dart';
import '../../../../utills/responsive.dart';
import '../../views/widgets/footer_dart.dart';
import '../../views/widgets/navbar.dart';

class SmsReadyExpertView extends StatelessWidget {
  const SmsReadyExpertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [NavBar(), SmsReadyExpertContent(), Footer()],
        ),
      ),
    );
  }
}

class SmsReadyExpertContent extends StatelessWidget {
  const SmsReadyExpertContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ExpertHeroSection(),
        _RequiredForSection(),
        _WhatYouWillLearnSection(),
        _CertificateSection(),
      ],
    );
  }
}

class _ExpertHeroSection extends StatelessWidget {
  const _ExpertHeroSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

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
          child: isMobile
              ? Column(
                  children: [
                    _HeroText(),
                    const SizedBox(height: 40),
                    const _ExpertHeroIllustration(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 12, child: _HeroText()),
                    const Expanded(flex: 10, child: _ExpertHeroIllustration()),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Become an\nSMS READY\nExpert',
          style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h1).copyWith(
            fontSize: isMobile ? 36 : 56,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'The SMS READY Expert certification ensures that designers, prepress operators, print technicians, and colour responsible staff know how to use SMS colours correctly across all media.',
          style: AppTextStyles.body.copyWith(
            fontSize: isMobile ? 15 : 17,
            color: AppColors.textPrimary.withOpacity(0.85),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _ExpertHeroIllustration extends StatelessWidget {
  const _ExpertHeroIllustration();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final width = isMobile ? 320.0 : 440.0;
    final height = width * 0.8;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Blobs
          Positioned(
            right: 0,
            bottom: 0,
            child: _FluidBlob(
              width: width * 0.9,
              height: height * 0.9,
              color: AppColors.primary.withOpacity(0.08),
            ),
          ),

          // Books Stack
          Positioned(
            left: width * 0.1,
            bottom: height * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BookWidget(
                  width: width * 0.35,
                  color: const Color(0xFF8A3D2B),
                ),
                _BookWidget(
                  width: width * 0.45,
                  color: const Color(0xFFC46A54),
                ),
                _BookWidget(
                  width: width * 0.4,
                  color: Colors.white,
                  isWhite: true,
                ),
              ],
            ),
          ),

          // Person Illustration
          Positioned(
            left: width * 0.25,
            bottom: height * 0.25,
            child: SizedBox(
              width: width * 0.4,
              height: height * 0.6,
              child: CustomPaint(painter: _PersonPainter()),
            ),
          ),

          // Large Phone/Tablet
          Positioned(
            right: width * 0.05,
            top: height * 0.1,
            child: Container(
              width: width * 0.35,
              height: height * 0.85,
              decoration: BoxDecoration(
                color: const Color(0xFFC46A54),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Color(0xFFC46A54),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2),
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

class _FluidBlob extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const _FluidBlob({
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.5),
          topRight: Radius.circular(width * 0.4),
          bottomLeft: Radius.circular(width * 0.6),
          bottomRight: Radius.circular(width * 0.45),
        ),
      ),
    );
  }
}

class _PersonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;

    // Head
    canvas.drawOval(Rect.fromLTWH(w * 0.6, 0, w * 0.25, h * 0.2), paint);

    // Body (Suit)
    final bodyPath = Path()
      ..moveTo(w * 0.5, h * 0.2)
      ..lineTo(w * 0.9, h * 0.2)
      ..lineTo(w * 1.0, h * 0.7)
      ..lineTo(w * 0.4, h * 0.7)
      ..close();
    canvas.drawPath(bodyPath, paint);

    // Arm pointing
    canvas.drawLine(
      Offset(w * 0.7, h * 0.3),
      Offset(w * 1.1, h * 0.25),
      Paint()
        ..color = AppColors.primary
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );

    // Hair/Suit details
    paint.color = const Color(0xFF5A2A1A);
    canvas.drawRect(Rect.fromLTWH(w * 0.65, h * 0.2, w * 0.1, h * 0.1), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _BookWidget extends StatelessWidget {
  final double width;
  final Color color;
  final bool isWhite;
  const _BookWidget({
    required this.width,
    required this.color,
    this.isWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 20,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4),
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: isWhite
            ? Border.all(color: AppColors.border.withOpacity(0.5))
            : null,
      ),
      child: isWhite
          ? null
          : Container(
              margin: const EdgeInsets.only(left: 10, top: 4, bottom: 4),
              width: 20,
              color: Colors.white.withOpacity(0.3),
            ),
    );
  }
}

class _RequiredForSection extends StatelessWidget {
  const _RequiredForSection();

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
              Text(
                'The Certification is Required for',
                textAlign: TextAlign.center,
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 24 : 32,
                    ),
              ),
              const SizedBox(height: 32),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: const [
                  _TagWidget(label: 'SMS READY Agencies'),
                  _TagWidget(label: 'SMS READY Print Shops'),
                  _TagWidget(label: 'SMS READY Manufacturers'),
                  _TagWidget(label: 'SMS Dealers'),
                  _TagWidget(
                    label:
                        'Anyone responsible for colour accuracy in a professional workflow',
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

class _TagWidget extends StatelessWidget {
  final String label;
  const _TagWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhatYouWillLearnSection extends StatelessWidget {
  const _WhatYouWillLearnSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 60),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Text(
                'What You Will Learn',
                style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2)
                    .copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 30 : 36,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                'The SMS READY Expert Training Covers:',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  int columns = width < 600 ? 1 : (width < 900 ? 2 : 3);
                  double spacing = 20;
                  double itemWidth =
                      (width - (spacing * (columns - 1))) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: const [
                      _LearnCard(
                        type: 'lab',
                        title: 'LAB-> sRGB+CMYK',
                        body:
                            'Understand how SMS colour work and convert LAB->sRGB->CMYK.',
                      ),
                      _LearnCard(
                        type: 'convert',
                        title: 'Convert SMS Colours',
                        body:
                            'Convert SMS colours correctly for print, web & video.',
                      ),
                      _LearnCard(
                        type: 'control',
                        title: 'SMS READY Control Strip',
                        body: 'Learn how to use SMS Ready control strip.',
                      ),
                      _LearnCard(
                        type: 'measure',
                        title: 'Measure Colours',
                        body: 'Measure colours using a spectrophotometer.',
                      ),
                      _LearnCard(
                        type: 'iso',
                        title: 'Prepare ISO Print Files',
                        body:
                            'Learn how to prepare files for ISO standard printing.',
                      ),
                      _LearnCard(
                        type: 'de00',
                        title: 'Check dE00 Values',
                        body:
                            'Check dE00 values using the provided Excel sheet.',
                      ),
                      _LearnCard(
                        type: 'mistakes',
                        title: 'Avoiding Common Mistakes in Design',
                        body:
                            'Learn how to avoid common colour mistakes in design and prepress.',
                      ),
                    ],
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

class _LearnCard extends StatelessWidget {
  final String title;
  final String body;
  final String type;

  const _LearnCard({
    required this.title,
    required this.body,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 340),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
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
          SizedBox(
            height: 32,
            width: 32,
            child: CustomPaint(painter: _ModuleIconPainter(type: type)),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModuleIconPainter extends CustomPainter {
  final String type;
  _ModuleIconPainter({required this.type});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE56A54).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    if (type == 'lab') {
      canvas.drawPath(
        Path()
          ..moveTo(w * 0.5, 0)
          ..lineTo(w, h * 0.25)
          ..lineTo(w * 0.5, h * 0.5)
          ..lineTo(0, h * 0.25)
          ..close(),
        paint,
      );
      canvas.drawPath(
        Path()
          ..moveTo(w * 0.5, h * 0.3)
          ..lineTo(w, h * 0.55)
          ..lineTo(w * 0.5, h * 0.8)
          ..lineTo(0, h * 0.55)
          ..close(),
        paint,
      );
    } else if (type == 'convert') {
      canvas.drawArc(Rect.fromLTWH(0, 0, w, h), 0.5, 4.5, false, paint);
      canvas.drawPath(
        Path()
          ..moveTo(w, h * 0.5)
          ..lineTo(w * 0.8, h * 0.3)
          ..moveTo(w, h * 0.5)
          ..lineTo(w * 0.7, h * 0.6),
        paint,
      );
    } else if (type == 'control') {
      canvas.drawRect(Rect.fromLTWH(0, h * 0.3, w, h * 0.4), paint);
      for (int i = 0; i < 4; i++) {
        canvas.drawLine(
          Offset(i * w / 4, h * 0.3),
          Offset(i * w / 4, h * 0.7),
          paint,
        );
      }
    } else if (type == 'measure') {
      canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.4, paint);
      canvas.drawCircle(
        Offset(w * 0.5, h * 0.5),
        w * 0.2,
        paint..style = PaintingStyle.fill,
      );
    } else if (type == 'iso') {
      canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(w * 0.7, 0)
          ..lineTo(w, h * 0.3)
          ..lineTo(w, h)
          ..lineTo(0, h)
          ..close(),
        paint,
      );
      canvas.drawLine(
        Offset(w * 0.3, h * 0.5),
        Offset(w * 0.7, h * 0.5),
        paint,
      );
    } else if (type == 'de00') {
      canvas.drawRect(Rect.fromLTWH(0, 0, w, h), paint);
      canvas.drawPath(
        Path()
          ..moveTo(w * 0.3, h * 0.6)
          ..lineTo(w * 0.5, h * 0.8)
          ..lineTo(w * 0.8, h * 0.3),
        paint,
      );
    } else if (type == 'mistakes') {
      canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.45, paint);
      canvas.drawLine(
        Offset(w * 0.5, h * 0.2),
        Offset(w * 0.5, h * 0.6),
        paint
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
      canvas.drawCircle(
        Offset(w * 0.5, h * 0.75),
        1.5,
        paint..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _CertificateSection extends StatelessWidget {
  const _CertificateSection();

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.horizontalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      child: Center(
        child: Column(
          children: [
            Text(
              'Certificate',
              style: (isMobile ? AppTextStyles.h3 : AppTextStyles.h2).copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 42,
              ),
            ),
            const SizedBox(height: 48),
            Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: isMobile
                    ? Column(
                        children: [
                          _CertificateDetails(),
                          _CertificatePricing(),
                        ],
                      )
                    : IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(flex: 3, child: _CertificateDetails()),
                            Expanded(flex: 2, child: _CertificatePricing()),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CertificateDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Become SMS READY Expert',
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'After completing the training and demonstrating proficiency, participants receive:',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          _InfoList(
            title: 'Training Format',
            items: const [
              'Remote training (online)',
              'Approximately 45-60 minutes',
              'Language: English',
              'Includes Q&A',
              'Includes downloadable materials',
            ],
            isSecondary: true,
          ),
          const SizedBox(height: 32),
          _InfoList(
            title: 'Participants Receive',
            items: const [
              'SMS READY Expert Certificate',
              "Valid till duration of the employer's SMS READY certification",
              'Listed as official SMS Ready Expert (Optional)',
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoList extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool isSecondary;

  const _InfoList({
    required this.title,
    required this.items,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFE56A54),
            fontSize: 12,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF57AC6C),
                  size: 16,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      fontWeight: isSecondary
                          ? FontWeight.w500
                          : FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CertificatePricing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF9F7),
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '€180',
                style: AppTextStyles.h1.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 44,
                  color: AppColors.textPrimary,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 4),
                child: Text(
                  'Per Participant',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'How to Register',
            style: AppTextStyles.body.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Contact: support@spotmatchingsystem.com',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
