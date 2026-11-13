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
                      children: [
                        Expanded(
                          child: _MenuButton(
                            label: '今までの作品を見る',
                            icon: Icons.sports_esports_rounded,
                            filled: true,
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
                          child: _MenuButton(
                            label: 'プロフィール',
                            icon: Icons.person_rounded,
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
//  メニューボタン
// ─────────────────────────────
class _MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled; // true なら塗りつぶし（メインのボタン）

  const _MenuButton({
    required this.label,
    required this.icon,
    required this.onTap,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFFBB86FC);
    final fg = filled ? const Color(0xFF0D0D0D) : accent;

    return Material(
      color: filled ? accent : const Color(0xFF1A1A2E),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          constraints: const BoxConstraints(minHeight: 72),
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: accent.withOpacity(0.5), width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: fg, size: 22),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: fg,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
