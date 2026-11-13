import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

// ─────────────────────────────
//  スキルデータ
// ─────────────────────────────
class Skill {
  final String name;
  final IconData? icon;
  final Color? iconColor;

  const Skill({required this.name, this.icon, this.iconColor});
}

// ─────────────────────────────
//  プロフィールの文章セクション（見出し＋本文）
// ─────────────────────────────
class ProfileSection {
  final String title;
  final String body;

  const ProfileSection({required this.title, required this.body});
}

// ─────────────────────────────
//  プロフィール画面
// ─────────────────────────────
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  //  自分の名前・肩書きをここで変える
  static const String myName = '鍋坂 明穂（ナベサカ アキホ）';
  static const String mySubtitle = 'ゲームプログラマー志望';

  static const String aboutText =
      'はじめまして、鍋坂 明穂です。\n'
      'C++やDirectX11を用いたゲーム制作を個人や、グループで制作しています。\n'
      'どうしたらプレイヤーは楽しんでくれるのか、どうしたら面白いゲームになるのかを日々考えながら制作しています。\n';

  //  文章セクション（上から順に表示）
  //  項目を増やしたいときは ProfileSection(...) を追加するだけでOK
  //  例: ProfileSection(title: 'HOBBY', body: 'ゲーム、イラスト…'),
  static const List<ProfileSection> sections = [
    ProfileSection(title: 'ABOUT', body: aboutText),
  ];

  //  スキル一覧（Skill(...) を追加するだけで増える）
  static const List<Skill> skills = [
    Skill(
      name: 'C++',
      icon: SimpleIcons.cplusplus,
      iconColor: Color(0xFF00599C),
    ),
    Skill(
      name: 'DirectX11',
      icon: Icons.videogame_asset, // 公式アイコンが simple_icons になし
      iconColor: Color(0xFF76B900),
    ),
    Skill(name: 'ネットワークプログラミング(学習中)'), // アイコンなし
    Skill(name: 'Unity', icon: SimpleIcons.unity, iconColor: Colors.white),
    Skill(
      name: 'Flutter',
      icon: SimpleIcons.flutter,
      iconColor: Color(0xFF54C5F8),
    ),
    Skill(
      name: 'Eclipse',
      icon: SimpleIcons.eclipseide,
      iconColor: Colors.white,
    ),
    Skill(name: 'Git', icon: SimpleIcons.git, iconColor: Color(0xFFF05032)),
    Skill(
      name: 'Blender',
      icon: SimpleIcons.blender,
      iconColor: Color.fromARGB(255, 255, 116, 52),
    ),
    Skill(name: 'Maya'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0533),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'PROFILE',
          style: TextStyle(
            letterSpacing: 4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _NameHeader(),
              for (final section in sections) ...[
                _TextSection(section: section),
                const SizedBox(height: 32),
              ],
              const _SkillsSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────
//  名前ヘッダー
// ─────────────────────────────
class _NameHeader extends StatelessWidget {
  const _NameHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 48),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A0533), Color(0xFF0D0D0D)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Color(0xFFBB86FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              ProfileScreen.myName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.w900,
                height: 1.1,
                letterSpacing: -1.5,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            ProfileScreen.mySubtitle,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w300,
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
        ],
      ),
    );
  }
}

// ─────────────────────────────
//  セクション見出し
// ─────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white38,
        fontSize: 12,
        letterSpacing: 4,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

// ─────────────────────────────
//  文章セクション（ABOUT など）
// ─────────────────────────────
class _TextSection extends StatelessWidget {
  final ProfileSection section;
  const _TextSection({required this.section});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(section.title),
          const SizedBox(height: 16),
          Text(
            section.body,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────
//  SKILLS セクション
// ─────────────────────────────
class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionLabel('SKILLS'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ProfileScreen.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFBB86FC).withOpacity(0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // アイコンがあれば表示
                    if (skill.icon != null) ...[
                      Icon(
                        skill.icon,
                        size: 16,
                        color: skill.iconColor ?? const Color(0xFFBB86FC),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      skill.name,
                      style: const TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
