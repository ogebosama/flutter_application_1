import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import '../widgets/bg_images.dart';
import '../widgets/onpu_line.dart';

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
    Skill(
      name: 'Go言語（さわりだけ）',
      icon: SimpleIcons.go,
      iconColor: Color(0xFF00ADD8),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1565C0), Colors.black],
          ),
        ),
        child: Stack(
          children: [
            const BgImages(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _NameHeader(),
                    const SizedBox(height: 32),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final content = Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (final section in sections) ...[
                              _TextSection(section: section),
                              const SizedBox(height: 32),
                            ],
                            const _SkillsSection(),
                          ],
                        );
                        const gif = _ProfilePhoto();
                        // 狭い画面では縦に並べる
                        if (constraints.maxWidth < 800) {
                          return Column(
                            children: [
                              content,
                              const SizedBox(height: 24),
                              gif,
                            ],
                          );
                        }
                        // 広い画面: 左の空きスペースにgif、右側にABOUT/SKILLS
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: Center(child: gif)),
                            Expanded(child: content),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
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
//  名前ヘッダー
// ─────────────────────────────
class _NameHeader extends StatelessWidget {
  const _NameHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 48),
      color: const Color(0xFF81D4FA),
      child: Row(
        children: [
          // 左: 顔写真
          const SizedBox(width: 160, child: _KawaiiGif(height: 160)),
          // 真ん中: 名前・肩書き
          const Expanded(
            child: Column(
              children: [
                Text(
                  ProfileScreen.myName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                    letterSpacing: -1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  ProfileScreen.mySubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                OnpuLine(),
              ],
            ),
          ),
          // 右: gif（左と対称）
          const SizedBox(width: 160, child: _KawaiiGif(height: 160)),
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
              fontSize: 20,
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

// ─────────────────────────────
//  空きスペースのgif（GitHub Releases から読み込み）
// ─────────────────────────────
class _KawaiiGif extends StatelessWidget {
  final double height;
  const _KawaiiGif({this.height = 240});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/kawaiiAnim.gif',
      height: height,
      fit: BoxFit.contain,
      webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
      errorBuilder: (_, _, _) => SizedBox(height: height),
    );
  }
}

// ─────────────────────────────
//  顔写真
// ─────────────────────────────
class _ProfilePhoto extends StatelessWidget {
  const _ProfilePhoto();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/Nabesaka_Akiho.jpg',
        height: 240,
        width: 240,
        fit: BoxFit.cover,
      ),
    );
  }
}
