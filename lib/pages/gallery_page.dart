import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static const imagePaths = <String>[
    'assets/images/sample1.jpg',
    'assets/images/sample2.jpg',
    'assets/images/sample3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ギャラリー')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: imagePaths.isEmpty
            ? const Center(
                child: Text(
                  '画像が登録されていません。\nassets/images/ に画像を入れて pubspec.yaml を設定してください。',
                  textAlign: TextAlign.center,
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (_, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imagePaths[i], fit: BoxFit.cover),
                ),
              ),
      ),
    );
  }
}
