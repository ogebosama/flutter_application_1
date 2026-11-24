import 'package:flutter/material.dart';
import '../portfolio_home_screen.dart';
import '../widgets/bg_images.dart';

// ─────────────────────────────
//  開発中！ページ
// ─────────────────────────────
class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  static const _video = FeaturedVideo(
    title: 'C++によるオンライン対戦格闘ゲームの開発（個人開発中）',
    description:
     '現在開発中のゲームです。'
     'C++を使用し、オンラインで2人対戦ができる格闘ゲームを開発。'
     'Ubuntu Serverを利用してゲームサーバーを構築し、クライアント間の通信およびゲーム状態の同期を実装しました。\n'
     'また、通信遅延による操作感の悪化を抑えるため、ロールバックネットコードを導入しました。',
    clips: [
      VideoClip(
        label: 'プレイ動画',
        videoUrl:
            'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/RollBackkakuge.mp4',
      ),
    ],
  );

  static const _images = <String>[
    'assets/images/Grafana.png',
    'assets/images/Linux.jpg',
    'assets/images/2daiPC.jpg',
    'assets/images/Prometheus.png',
  ];

  static const _bodyStyle = TextStyle(
    fontSize: 16,
    height: 1.8,
    color: Colors.black87,
  );

  static const _techs = <(String, String)>[
    ('言語', 'C++'),
    ('グラフィックス', 'DirectX 11'),
    ('サーバーOS', 'Ubuntu Server 24.04 LTS'),
    ('通信', 'TCP / UDP'),
    ('同期技術', 'Rollback Netcode'),
    ('監視', 'Prometheus / Grafana'),
    ('開発環境', 'Visual Studio'),
  ];

  static Widget _techChip(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE1F5FE),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF0288D1)),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$label：',
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF01579B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4, right: 8),
            child: Icon(Icons.check_circle, size: 18, color: Color(0xFF0288D1)),
          ),
          Expanded(child: Text(text, style: _bodyStyle)),
        ],
      ),
    );
  }

  static Widget _section({
    required IconData icon,
    required String title,
    required Widget child,
    bool big = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF0288D1)),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: big ? 22 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          child,
        ],
      ),
    );
  }

  // (項目, TCP+UDP, ロールバック, 良い方: 0=TCP+UDP 1=ロールバック -1=なし)
  static const _rows = <(String, String, String, int)>[
    ('入力遅延', '3 f（50 ms）固定', 'なし（予測で進行）', 1),
    ('受信パケット / 秒', '240', '60〜62', -1),
    ('受信間隔 avg', '4.2 ms', '16.0〜16.1 ms', 0),
    ('ジッター', '6.2 ms', '5.9〜6.1 ms', -1),
    ('RTT', '1.1 / 9.7 ms', '7 / 9 ms（avg 12 / 11）', -1),
    ('Remote stall', '10.2 / 9.8 ms', '16.0 / 18.0 ms', 0),
    ('Frame time（max）', '16.9 / 17.1 ms', '651.9 / 696.5 ms', 0),
    ('Remote frame lag', '48 / -46', '2 / 1', 1),
    ('予測深度', '—', '3 / 1 f', -1),
    ('ロールバック回数', '—', '0', -1),
    ('パケットロス', '0.00 %', '—', -1),
    ('FPS', '60', '60', -1),
  ];

  static Widget _cell(String text,
      {bool header = false, bool good = false, Color? bg}) {
    return Container(
      color: bg,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: header ? 14 : 13,
          fontWeight: header || good ? FontWeight.bold : FontWeight.normal,
          color: header
              ? Colors.white
              : good
                  ? const Color(0xFF2E7D32)
                  : Colors.black87,
        ),
      ),
    );
  }

  static Widget _compareTable() {
    const headBg = Color(0xFF0288D1);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 560),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(1.4),
            1: FlexColumnWidth(1.3),
            2: FlexColumnWidth(1.6),
          },
          border: TableBorder.all(color: const Color(0xFFB3E5FC)),
          children: [
            TableRow(children: [
              _cell('項目', header: true, bg: headBg),
              _cell('TCP+UDP方式', header: true, bg: headBg),
              _cell('ロールバック方式', header: true, bg: headBg),
            ]),
            for (var i = 0; i < _rows.length; i++)
              TableRow(
                decoration: BoxDecoration(
                  color: i.isEven ? Colors.white : const Color(0xFFF1F8FE),
                ),
                children: [
                  _cell(_rows[i].$1, good: true),
                  _cell(_rows[i].$2, good: _rows[i].$4 == 0),
                  _cell(_rows[i].$3, good: _rows[i].$4 == 1),
                ],
              ),
          ],
        ),
      ),
    );
  }

  static Widget _shot(String label, String path) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _ZoomImage(path, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

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
                      _section(
                        icon: Icons.build_circle_outlined,
                        title: '開発環境・使用技術',
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            for (final t in _techs) _techChip(t.$1, t.$2),
                          ],
                        ),
                      ),
                      _section(
                        icon: Icons.dns_outlined,
                        title: 'システム構成',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _bullet('Ubuntu Server上でゲームサーバーを構築'),
                            _bullet('C++によるクライアント・サーバー間の通信処理'),
                            _bullet('プレイヤーの入力情報を利用したゲーム状態の同期'),
                            _bullet('ロールバックによる状態の巻き戻しと再シミュレーション'),
                          ],
                        ),
                      ),
                      _section(
                        icon: Icons.lightbulb_outline,
                        title: '技術的な工夫',
                        big: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ロールバックネットコード',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF01579B),
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '相手の入力が届くまで待つのではなく、入力を予測してゲームを進行させる仕組みを実装しました。',
                              style: _bodyStyle,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '予測と実際の入力に差があった場合は、過去のゲーム状態に戻して再計算することで、通信遅延の影響を抑える設計にしました。',
                              style: _bodyStyle,
                            ),
                            const SizedBox(height: 28),
                            const Text(
                              'サーバー監視',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF01579B),
                                height: 1.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'PrometheusとGrafanaを利用し、サーバーの状態やプレイヤー数などを可視化する監視環境を構築しました。',
                              style: _bodyStyle,
                            ),
                          ],
                        ),
                      ),
                      _section(
                        icon: Icons.compare_arrows,
                        title: 'TCP+UDP方式 と ロールバック方式の比較',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _compareTable(),
                            const SizedBox(height: 8),
                            const Text(
                              '※ 2台のクライアントでの計測値（左 / 右）。入力遅延 3f は固定の待ち時間、'
                              'ロールバック方式は入力遅延なしで予測して進行します。',
                              style: TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                            const SizedBox(height: 16),
                            LayoutBuilder(
                              builder: (context, c) {
                                final wide = c.maxWidth > 700;
                                final shots = [
                                  _shot('TCP+UDP方式', 'assets/images/TCPandUDP.png'),
                                  _shot('ロールバック方式', 'assets/images/Rollback.png'),
                                ];
                                return wide
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          for (final s in shots)
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: s,
                                              ),
                                            ),
                                        ],
                                      )
                                    : Column(children: shots);
                              },
                            ),
                          ],
                        ),
                      ),
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
                                    child: _ZoomImage(path, fit: BoxFit.cover),
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

// ─────────────────────────────
//  タップで拡大できる画像
// ─────────────────────────────
class _ZoomImage extends StatelessWidget {
  const _ZoomImage(this.path, {this.fit = BoxFit.cover});

  final String path;
  final BoxFit fit;

  void _open(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (ctx) => Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(ctx).pop(),
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 6,
                  child: Center(
                    child: Image.asset(path, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(ctx).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.zoomIn,
      child: GestureDetector(
        onTap: () => _open(context),
        child: Image.asset(path, fit: fit),
      ),
    );
  }
}
