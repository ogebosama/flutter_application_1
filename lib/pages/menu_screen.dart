import 'package:flutter/material.dart';
import '../portfolio_home_screen.dart';
import 'profile_screen.dart';

// ─────────────────────────────
//  メニュー画面（最初に表示される画面）
// ─────────────────────────────
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A0533), Color(0xFF0D0D0D)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PORTFOLIO',
                      style: TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 11,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 大きな見出し
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.white, Color(0xFFBB86FC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: const Text(
                        'ようこそ！\nここは鍋坂明穂の\nポートフォリオです',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          height: 1.25,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: 48,
                      height: 3,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBB86FC),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 48),
                    // ボタン（横並び）
                    Row(
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
                                builder: (_) => const PortfolioHomeScreen(),
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
                  ],
                ),
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
