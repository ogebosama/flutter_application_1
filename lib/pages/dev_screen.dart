import 'package:flutter/material.dart';
import '../portfolio_home_screen.dart';
import '../widgets/bg_images.dart';

// ─────────────────────────────
//  開発中！ページ
// ─────────────────────────────
class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  static const _video = FeaturedVideo(
    title: 'Rollback（開発中）',
    description: '現在開発中のゲームです。',
    clips: [
      VideoClip(
        label: 'プレイ動画',
        videoUrl:
            'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/RollBackkakuge.mp4',
      ),
    ],
  );

  static const _images = <String>[
    'assets/images/Grafana.jpg',
    'assets/images/Linux.jpg',
    'assets/images/2daiPC.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF81D4FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF81D4FA),
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          '開発中！',
          style: TextStyle(
            letterSpacing: 4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          const BgImages(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PortfolioHomeScreen.cardFor(_video),
                      const SizedBox(height: 8),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          const spacing = 12.0;
                          final isWide = constraints.maxWidth > 700;
                          final w = isWide
                              ? (constraints.maxWidth - spacing * 2) / 3
                              : constraints.maxWidth;
                          return Wrap(
                            spacing: spacing,
                            runSpacing: spacing,
                            children: [
                              for (final path in _images)
                                SizedBox(
                                  width: w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(path, fit: BoxFit.cover),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
