import 'package:flutter/material.dart';

const onpuGifUrl =
    'https://github.com/ogebosama/flutter_application_1/releases/download/v1.0-videos/onpu.gif';

// 見出し下の音符ライン。onpu.gif を横に並べて長い線にする。
// webHtmlElementStrategy.prefer で <img> として表示するので gif が再生される。
// （ImageRepeat だとデコードが必要になり、アニメーションしない／CORSで失敗する）
class OnpuLine extends StatelessWidget {
  final int count;
  final double height;

  const OnpuLine({super.key, this.count = 14, this.height = 40});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          count,
          (_) => Image.network(
            onpuGifUrl,
            height: height,
            fit: BoxFit.contain,
            webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
            errorBuilder: (_, _, _) =>
                Image.asset('assets/gif/onpu.gif', height: height),
          ),
        ),
      ),
    );
  }
}
