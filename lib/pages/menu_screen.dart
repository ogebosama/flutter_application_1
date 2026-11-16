import 'dart:async';
import 'package:flutter/material.dart';
import '../portfolio_home_screen.dart';
import 'profile_screen.dart';

// ─────────────────────────────
//  メニュー画面（最初に表示される画面）
// ─────────────────────────────
class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  static const _titleColors = [
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.pink,
  ];
  int _colorIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      setState(() => _colorIndex = (_colorIndex + 1) % _titleColors.length);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,
        child: Stack(
          children: [
            // 背景の飾り画像（半透明）
            const _BgImage('bukitukaiIcon.png', Alignment.center, 360),
            const _BgImage('chainGeyIcon.png', Alignment.bottomCenter, 220),
            const _BgImage(
              'kokoAtama.png',
              Alignment.centerRight,
              160,
              angle: 0.35,
            ),
            const _BgImage(
              'kokobikkuri.png',
              Alignment.centerLeft,
              240,
              angle: -0.35,
            ),
            const _BgImage(
              'kokowork.png',
              Alignment.bottomRight,
              120,
              angle: 0.5,
            ),
            const _BgImage(
              'kokowork2.png',
              Alignment.topLeft,
              220,
              angle: -0.5,
            ),
            const _BgImage('pypeGeyIcon.png', Alignment(0.7, -1), 200),
            const _BgImage(
              'Afileman.png',
              Alignment.bottomLeft,
              160,
              dir: 'assets/images/',
              angle: -0.2,
            ),
            const _BgImage(
              'Attack.png',
              Alignment(-0.35, -1),
              140,
              dir: 'assets/images/',
              angle: 0.15,
            ),
            const _BgImage(
              'ChaseBoss.png',
              Alignment(0.65, 0.55),
              140,
              dir: 'assets/images/',
              angle: -0.1,
            ),
            const _BgImage(
              'DeadWius.png',
              Alignment(-0.65, 0.6),
              140,
              dir: 'assets/images/',
              angle: 0.2,
            ),
            const _BgImage(
              'POnew1.png',
              Alignment(0.3, -0.75),
              130,
              dir: 'assets/images/',
              angle: 0.1,
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PORTFOLIO',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            letterSpacing: 6,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // 大きな見出し（色が順番に切り替わる）
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 500),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _titleColors[_colorIndex],
                            fontSize: 44,
                            fontWeight: FontWeight.w900,
                            height: 1.25,
                            letterSpacing: -1,
                          ),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'ようこそ！\nここは鍋坂明穂のポートフォリオです',
                              textAlign: TextAlign.center,
                              softWrap: false,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: 48,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(height: 48),
                        // ボタン（横並び）
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 720),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: _IconMenuButton(
                                  asset: 'assets/images/icons/RedguyIcon.png',
                                  label: '今までの作品を見る',
                                  bubbleText: '今までの作品を見るときは私をクリック',
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const PortfolioHomeScreen(),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _IconMenuButton(
                                  asset: 'assets/images/icons/BlueguyIcon.png',
                                  label: 'プロフィール',
                                  bubbleText: 'プロフィールを見るときは私をクリック',
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ProfileScreen(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

// ─────────────────────────────
//  背景の半透明画像
// ─────────────────────────────
class _BgImage extends StatelessWidget {
  final String file;
  final Alignment alignment;
  final double height;
  final double angle; // ラジアン
  final String dir;

  const _BgImage(
    this.file,
    this.alignment,
    this.height, {
    this.angle = 0,
    this.dir = 'assets/images/icons/',
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Align(
          alignment: alignment,
          child: Transform.rotate(
            angle: angle,
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                '$dir$file',
                height: height,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────
//  アイコンボタン（吹き出し付き・ホバーで色反転）
// ─────────────────────────────
class _IconMenuButton extends StatefulWidget {
  final String asset;
  final String label;
  final String bubbleText;
  final VoidCallback onTap;

  const _IconMenuButton({
    required this.asset,
    required this.label,
    required this.bubbleText,
    required this.onTap,
  });

  @override
  State<_IconMenuButton> createState() => _IconMenuButtonState();
}

class _IconMenuButtonState extends State<_IconMenuButton> {
  bool _hover = false;

  static const _invert = ColorFilter.matrix(<double>[
    -1, 0, 0, 0, 255, //
    0, -1, 0, 0, 255,
    0, 0, -1, 0, 255,
    0, 0, 0, 1, 0,
  ]);
  static const _normal = ColorFilter.mode(Colors.transparent, BlendMode.dst);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 吹き出し
        SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/icons/fukidasi.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 70),
                child: Center(
                  child: Text(
                    widget.bubbleText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // アイコン（クリックで遷移・ホバーで色反転）
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _hover = true),
          onExit: (_) => setState(() => _hover = false),
          child: GestureDetector(
            onTap: widget.onTap,
            child: Semantics(
              button: true,
              label: widget.label,
              child: ColorFiltered(
                colorFilter: _hover ? _invert : _normal,
                child: Image.asset(
                  widget.asset,
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
