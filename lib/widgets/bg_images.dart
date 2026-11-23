import 'package:flutter/material.dart';

// ─────────────────────────────
//  全ページ共通の背景飾り画像（半透明）
//  配置はメニュー画面と同じ
// ─────────────────────────────
class BgImages extends StatelessWidget {
  const BgImages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: Stack(
        children: [
          _BgImage('bukitukaiIcon.png', Alignment.center, 360),
          _BgImage('chainGeyIcon.png', Alignment.bottomCenter, 220),
          _BgImage('kokoAtama.png', Alignment.centerRight, 160, angle: 0.35),
          _BgImage('kokobikkuri.png', Alignment.centerLeft, 240, angle: -0.35),
          _BgImage('kokowork.png', Alignment.bottomRight, 120, angle: 0.5),
          _BgImage('kokowork2.png', Alignment.topLeft, 220, angle: -0.5),
          _BgImage('pypeGeyIcon.png', Alignment(0.7, -1), 200),
          _BgImage(
            'Afileman.png',
            Alignment.bottomLeft,
            160,
            dir: 'assets/images/',
            angle: -0.2,
          ),
          _BgImage(
            'Attack.png',
            Alignment(-0.35, -1),
            140,
            dir: 'assets/images/',
            angle: 0.15,
          ),
          _BgImage(
            'ChaseBoss.png',
            Alignment(0.65, 0.55),
            140,
            dir: 'assets/images/',
            angle: -0.1,
          ),
          _BgImage(
            'DeadWius.png',
            Alignment(-0.65, 0.6),
            140,
            dir: 'assets/images/',
            angle: 0.2,
          ),
          _BgImage(
            'POnew1.png',
            Alignment(0.3, -0.75),
            130,
            dir: 'assets/images/',
            angle: 0.1,
          ),
          _BgImage(
            'AChara.png',
            Alignment(0.45, 1),
            130,
            dir: 'assets/images/',
            angle: -0.15,
          ),
          _BgImage(
            'HammerJump.png',
            Alignment(-0.95, -0.35),
            320,
            angle: -0.15,
          ),
        ],
      ),
    );
  }
}

class _BgImage extends StatelessWidget {
  final String file;
  final Alignment alignment;
  final double height;
  final double angle;
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
