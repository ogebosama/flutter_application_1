import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:simple_icons/simple_icons.dart';

// ─────────────────────────────
//  アプリのルート
// ─────────────────────────────
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PortfolioHomeScreen(),
    );
  }
}

// ─────────────────────────────
//  動画クリップ(1本ぶん)
// ─────────────────────────────
class VideoClip {
  final String label; // タブに表示する名前
  final String? asset; // ローカル動画ファイルのパス（assets/videos/～）
  final String? videoUrl; // ネットワーク動画のURL（GitHub Releases など）
  final int rotationQuarterTurns;

  const VideoClip({
    required this.label,
    this.asset,
    this.videoUrl,
    this.rotationQuarterTurns = 0,
  }) : assert(
         asset != null || videoUrl != null,
         'asset または videoUrl のどちらかは必須です',
       );
}

// ─────────────────────────────
//  注目動画データ
// ─────────────────────────────
class FeaturedVideo {
  final String title;
  final String description;
  final List<VideoClip> clips;
  final List<String>? images;
  final String? award;
  final Color? awardColor;

  const FeaturedVideo({
    required this.title,
    required this.description,
    this.clips = const [],
    this.images,
    this.award,
    this.awardColor,
  });
}

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
//  ホーム画面
// ─────────────────────────────
class PortfolioHomeScreen extends StatelessWidget {
  const PortfolioHomeScreen({super.key});

  //  自分の名前・肩書きをここで変える
  static const String myName = '鍋坂 明穂（ナベサカ アキホ）';
  static const String mySubtitle = 'ゲームプログラマー志望';

  static const String aboutText =
      'はじめまして、鍋坂 明穂です。\n'
      'C++やDirectX11を用いたゲーム制作を個人や、グループで制作しています。\n'
      'どうしたらプレイヤーは楽しんでくれるのか、どうしたら面白いゲームになるのかを日々考えながら制作しています。\n';

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

  //  注目動画リスト（自由に追加する）
  static const List<FeaturedVideo> featuredVideos = [
    FeaturedVideo(
      title: 'ステレスアクションゲーム ブラッシュアップ後「Go!Stoal!」（個人制作）\n2025年2月制作',
      description:
          'UnityとC#で制作したステルスアクションゲームです。テーマは、「ほっと」というキーワードから連想し、いたずらなお化けがものを盗んだ時NPCのキャラクターに取りついて、追いかける警察からやり過ごした後に「ホッとする」や、ギミックを解いて「ホッとする」というプレイヤーに緊張感と安心感を交互に味わってもらえるようなゲームを目指して制作しました。\nこだわりポイント：敵や、NPCに取りついたときのアニメーションの切り替えや、フラグの管理',
      clips: [
        VideoClip(
          label: 'プレイ動画',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/Go_StoleB.mp4',
        ),
      ],
    ),

    FeaturedVideo(
      title: 'ステレスゲーム 「SPY」（個人制作）\n2025年8月制作',
      description:
          'Nintendo Switch での実装に挑戦。敵の挙動とステルス要素にこだわった作品です。\n壁に隠れるときの当たり判定や、ぞれぞれのキャラクターのアニメーションの切り替えなど、細かい部分までこだわって制作しました。\nまた、イージングを駆使してちょっとした演出にもこだわって作りました。テーマがコンピューターウイルスなので、ノイズや、グリッチを活かした演出も入れています。',
      clips: [
        VideoClip(
          label: 'プレイ動画',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/XAL02100133954-20250911-0002.mp4',
        ),
      ],
    ),

    FeaturedVideo(
      title: 'レースゲーム「あにまリズム♪」（グループ制作）\n2025年10月制作',
      description:
          '自作のボタンとフットペダルを使って色んな動物になりきってタイミングよく順番通りに押していくゲームです。テーマは「変身」で、プレイヤーが色んな動物になりきって楽しめるようなゲームを目指して制作しました。UI部分を担当し、細かなイージングアニメーションや、どうしたら分かりやすい表示の仕方をしたらいいか、どうしたらプレイヤーにゲームの楽しさを伝えることができるかを考えて制作しました。\nまた、グループ制作だったので、GitHubを使ってのバージョン管理や、定期的なミーティングなど、チームでの開発フローも経験できました。\n母にプレイしてもらいました。',
      clips: [
        VideoClip(
          label: 'プレイ動画',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/animarizumu.mp4',
        ),
      ],
      award: '銅賞受賞',
    ),

    FeaturedVideo(
      title: '格闘ゲーム 「角ゲー」(自主学習個人制作)\n2026年3月制作',
      description:
          '日ごろのストレス発散がしたくて、サンドバッグ替わりに初めての挑戦、'
          '格闘ゲームとネットワークプログラミングを兼ね合わせたゲームを作ってみました。\n'
          '使用技術はC++で、クライアント・サーバー方式でプレイヤー情報を同期する'
          'ローカル対戦システムを実装しました。\n'
          'こだわりポイント\n'
          '    通信モジュールのクラス化\n'
          '    プレイヤー座標の同期処理\n'
          '    キャラクター情報の同期処理',
      clips: [
        VideoClip(
          label: 'ボット対決',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/Kakuge.mp4',
        ),
        VideoClip(
          label: 'ローカル対戦',
          asset:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/KakugeNet.mp4',
          rotationQuarterTurns: 3,
        ),
      ],
    ),

    FeaturedVideo(
      title: 'タワーディフェンス「浸食！インクウォーズ」（グループ制作）\n2025年10月制作',
      description:
          'このゲームは、テーマが「シン」となっていて、それにちなんだ「シン」つまり、浸食という単語を使い、赤と青のインクが浸食しあうという表現で作りました。\n'
          'こだわったところは、インクの染まった濃さの段階や、武器の種類、ゲームバランスにこだわりました。',
      clips: [
        VideoClip(
          label: 'メインクリップ',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/inkwors.mp4',
        ),
      ],
      award: 'Siv3Dバンダイナムコ杯2025審査員賞受賞',
      awardColor: Color(0xFF1565C0),
    ),

    FeaturedVideo(
      title: 'アクションゲーム 「NEOZIP」（グループ制作）※現在制作中※\n2026年3月制作',
      description:
          'ジッパーを使ったアクションゲームで、ジッパーを開けることで、敵を倒したり、塞いでいる壁が通れたり、移動手段として作りました。\n'
          '私は、プレイヤーのアニメーション管理、ジッパーのギミックにこだわりました。原案は私が考えました。\nそのほかにも、定期的のミーティングを欠かさず参加し、どのようにしたら面白くなるか、作業感をなくせるかなど積極的に話し合い、ギミックの拡張や修正を行いました。',
      clips: [
        VideoClip(
          label: 'メインクリップ',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/NEOZIP.mp4',
        ),
      ],
    ),
  ];

  static const List<FeaturedVideo> otherVideos = [
    FeaturedVideo(
      title: '落ち物ゲーム「BOMB CRUSHER」（個人製作）\n2025年9月制作',
      description:
          'このゲームは、テトリスをモチーフにした落ち物ゲームです。ごく普通のブロックが平らになったら消えるではなく、キャラクターのアニメーションの種類が3つ以上そろったら消えるという仕様で作ってみました。\n'
          'こだわったところは、３０秒経ったらランダムでシャッフルされ、その間にカメラ揺れ、ちょっとした間のアニメーション切り替えのところを頑張りました。',
      clips: [
        VideoClip(
          label: 'プレイ動画',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/otimono.mp4',
        ),
      ],
    ),

    FeaturedVideo(
      title: 'シューティングゲーム「Comi Cosmic」（個人製作）\n2024年8月制作',
      description:
          '初めてのUnityのスクリプトノードで作りました。\n落ちないようにジャンプ連打で敵の弾を交わしつつ敵を倒すゲームです。'
          'こだわったことろは、ジャンプするときと通常状態のアニメーション切り替えや、ジャンプの軌道や操作感を調節しながら作りました。',
      clips: [
        VideoClip(
          label: 'プレイ動画',
          videoUrl:
              'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/comicosmic.mp4',
        ),
      ],
    ),

    FeaturedVideo(
      title: 'ステレスアクションゲーム ブラッシュアップ前「Go!Stoal!」(個人製作)\n2024年12月制作',
      description:
          'ブラッシュアップ前の作品は、初めてのUnityのC#で、取りつくか否か、アニメーションが切り替わるか否かを全てboolフラグで管理していました。（まだ当時はステート管理の存在を知りませんでした。。。）'
          'また、ボスの部屋に入ると、イベントのカメラ遷移や、そのステートの管理的に取りつくと襲われなくなるというフラグ管理、警察に取りつくと攻撃されなくなるというフラグ管理をしました。\nアイテムを50個集めるとクリアという仕様になっています。',
      images: [
        'assets/images/torituku.png',
        'assets/images/totrituita.png',
        'assets/images/toritukuIdle.png',
        'assets/images/torituitaWoak.png',
        'assets/images/toritukuPolice.png',
        'assets/images/bossMove1.png',
        'assets/images/MoveCam.png',
        'assets/images/BossTaima.png',
      ],
    ),
  ];

  // クリップが空 & 画像があれば画像カード、そうでなければ動画カードを返す
  static Widget cardFor(FeaturedVideo featured) {
    if (featured.clips.isEmpty &&
        featured.images != null &&
        featured.images!.isNotEmpty) {
      return _ImageGalleryCard(featured: featured);
    }
    return _VideoCard(featured: featured);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NameHeader(),
              const _AboutSection(),
              const SizedBox(height: 32),
              const _SkillsSection(),
              const SizedBox(height: 40),
              const _HighlightSection(),

              const SizedBox(height: 24),
              const _OtherWorksButton(),

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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
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
          const Text(
            'PORTFOLIO',
            style: TextStyle(
              color: Color(0xFFBB86FC),
              fontSize: 11,
              letterSpacing: 5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Color(0xFFBB86FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              PortfolioHomeScreen.myName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 52,
                fontWeight: FontWeight.w900,
                height: 1.1,
                letterSpacing: -1.5,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            PortfolioHomeScreen.mySubtitle,
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
//  ABOUT セクション
// ─────────────────────────────
class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ABOUT',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
              letterSpacing: 4,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            PortfolioHomeScreen.aboutText,
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
          const Text(
            'SKILLS',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
              letterSpacing: 4,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: PortfolioHomeScreen.skills.map((skill) {
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
//  「これだけは見てほしい…！」セクション
// ─────────────────────────────
class _HighlightSection extends StatelessWidget {
  const _HighlightSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 小さいラベル
          const Text(
            'PICK UP',
            style: TextStyle(
              color: Color(0xFFBB86FC),
              fontSize: 11,
              letterSpacing: 5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          // 大きな見出し(グラデーション付き)
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.white, Color(0xFFBB86FC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              'これだけは\n見てほしい…！',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.w900,
                height: 1.2,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // 動画カード一覧
          ...PortfolioHomeScreen.featuredVideos.map(
            PortfolioHomeScreen.cardFor,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────
//  動画再生カード
// ─────────────────────────────
class _VideoCard extends StatefulWidget {
  final FeaturedVideo featured;
  const _VideoCard({required this.featured});

  @override
  State<_VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<_VideoCard> {
  late VideoPlayerController _controller;
  bool _initialized = false;
  int _currentClipIndex = 0;

  @override
  void initState() {
    super.initState();
    _initController(0);
  }

  // 動画コントローラーをセットアップ
  void _initController(int index) {
    final clip = widget.featured.clips[index];
    if (clip.videoUrl != null) {
      // ネットワーク動画（GitHub Releases など）
      _controller = VideoPlayerController.networkUrl(Uri.parse(clip.videoUrl!));
    } else {
      // ローカルアセット動画
      _controller = VideoPlayerController.asset(clip.asset!);
    }
    _controller.addListener(_onControllerUpdate);
    _controller.initialize().then((_) {
      if (!mounted) return;
      setState(() => _initialized = true);
      _controller.setLooping(true);
    });
  }

  // クリップを切り替える
  void _switchClip(int index) {
    if (index == _currentClipIndex) return;

    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();

    setState(() {
      _currentClipIndex = index;
      _initialized = false;
    });

    _initController(index);
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasAward = widget.featured.award != null;
    final awardColor = widget.featured.awardColor ?? const Color(0xFFCD7F32);
    final hasMultipleClips = widget.featured.clips.length > 1;

    final currentClip = widget.featured.clips[_currentClipIndex];
    final rotation = currentClip.rotationQuarterTurns;
    final isRotated = rotation % 2 == 1;
    final videoAspect = _controller.value.aspectRatio;
    final displayAspect = isRotated ? 1 / videoAspect : videoAspect;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasAward
              ? awardColor.withOpacity(0.6)
              : const Color(0xFFBB86FC).withOpacity(0.3),
          width: hasAward ? 2 : 1,
        ),
        boxShadow: hasAward
            ? [
                BoxShadow(
                  color: const Color(0xFFCD7F32).withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: -2,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── 動画再生領域 ───
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: _initialized
                ? AspectRatio(
                    aspectRatio: displayAspect,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _togglePlay,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          IgnorePointer(
                            child: RotatedBox(
                              quarterTurns: rotation,
                              child: VideoPlayer(_controller),
                            ),
                          ),
                          IgnorePointer(
                            child: AnimatedOpacity(
                              opacity: _controller.value.isPlaying ? 0.0 : 1.0,
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.55),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 48,
                                ),
                              ),
                            ),
                          ),
                          if (widget.featured.award != null)
                            Positioned(
                              top: 12,
                              left: 12,
                              child: IgnorePointer(
                                child: _AwardBadge(
                                  text: widget.featured.award!,
                                  color: awardColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 200,
                    color: Colors.black,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFBB86FC),
                      ),
                    ),
                  ),
          ),

          // ─── タイトル・タブ・説明 ───
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // クリップ切り替えタブ(2つ以上ある時だけ表示)
                if (hasMultipleClips) ...[
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(widget.featured.clips.length, (i) {
                      final clip = widget.featured.clips[i];
                      final isActive = i == _currentClipIndex;
                      return GestureDetector(
                        onTap: () => _switchClip(i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: isActive
                                ? const Color(0xFFBB86FC)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(
                                0xFFBB86FC,
                              ).withOpacity(isActive ? 1.0 : 0.4),
                            ),
                          ),
                          child: Text(
                            clip.label,
                            style: TextStyle(
                              color: isActive
                                  ? const Color(0xFF0D0D0D)
                                  : const Color(0xFFBB86FC),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 14),
                ],

                Text(
                  widget.featured.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.featured.description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AwardBadge extends StatelessWidget {
  final String text;
  final Color color;
  const _AwardBadge({required this.text, required this.color});

  // 色を明るく/暗くするヘルパー
  Color _lighten(Color c, double amount) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  Color _darken(Color c, double amount) {
    final hsl = HSLColor.fromColor(c);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    final light = _lighten(color, 0.15);
    final dark = _darken(color, 0.15);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [light, dark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────
//  その他作品ボタン
// ─────────────────────────────
class _OtherWorksButton extends StatelessWidget {
  const _OtherWorksButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const OtherWorksScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A2E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFBB86FC).withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'その他の作品を見る',
                style: TextStyle(
                  color: Color(0xFFBB86FC),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFFBB86FC),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────
//  その他作品画面
// ─────────────────────────────
class OtherWorksScreen extends StatelessWidget {
  const OtherWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D0D0D),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'OTHER WORKS',
          style: TextStyle(
            letterSpacing: 4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24, top: 8),
                child: Text(
                  'これまでに制作した作品の一覧',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
              ),
              ...PortfolioHomeScreen.otherVideos.map(
                PortfolioHomeScreen.cardFor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────
//  画像ギャラリーカード
// ─────────────────────────────
class _ImageGalleryCard extends StatefulWidget {
  final FeaturedVideo featured;
  const _ImageGalleryCard({required this.featured});

  @override
  State<_ImageGalleryCard> createState() => _ImageGalleryCardState();
}

class _ImageGalleryCardState extends State<_ImageGalleryCard> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.featured.images ?? [];
    final hasAward = widget.featured.award != null;
    final awardColor = widget.featured.awardColor ?? const Color(0xFFCD7F32);
    final hasDescription = widget.featured.description.trim().isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: hasAward
              ? awardColor.withOpacity(0.6)
              : const Color(0xFFBB86FC).withOpacity(0.3),
          width: hasAward ? 2 : 1,
        ),
        boxShadow: hasAward
            ? [
                BoxShadow(
                  color: awardColor.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: -2,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── 画像表示領域 ───
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // 画像本体(スワイプ可能)
                    PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (i) => setState(() => _currentIndex = i),
                      itemBuilder: (context, i) {
                        return Image.asset(images[i], fit: BoxFit.contain);
                      },
                    ),

                    // 左矢印
                    if (_currentIndex > 0)
                      Positioned(
                        left: 8,
                        child: _NavArrow(
                          icon: Icons.chevron_left_rounded,
                          onTap: () => _goTo(_currentIndex - 1),
                        ),
                      ),

                    // 右矢印
                    if (_currentIndex < images.length - 1)
                      Positioned(
                        right: 8,
                        child: _NavArrow(
                          icon: Icons.chevron_right_rounded,
                          onTap: () => _goTo(_currentIndex + 1),
                        ),
                      ),

                    // ページ数表示
                    Positioned(
                      right: 12,
                      bottom: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${_currentIndex + 1} / ${images.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // 受賞バッジ(あれば)
                    if (widget.featured.award != null)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: _AwardBadge(
                          text: widget.featured.award!,
                          color: awardColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // ─── ドットインジケーター ───
          if (images.length > 1)
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (i) {
                  final isActive = i == _currentIndex;
                  return GestureDetector(
                    onTap: () => _goTo(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: isActive ? 20 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: isActive
                            ? const Color(0xFFBB86FC)
                            : Colors.white24,
                      ),
                    ),
                  );
                }),
              ),
            ),

          // ─── タイトル・説明 ───
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.featured.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (hasDescription) ...[
                  const SizedBox(height: 6),
                  Text(
                    widget.featured.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 左右の矢印ボタン
class _NavArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _NavArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
