import 'package:flutter/material.dart';

class NewsDialog extends StatelessWidget {
  const NewsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    WidgetSpan(child: SizedBox(width: 15)),
                    TextSpan(text: '22.10.2022'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'Title',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Image.network(
              'https://s0.rbk.ru/v6_top_pics/media/img/3/07/756333321132073.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'Simple text',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
