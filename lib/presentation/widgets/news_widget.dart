import 'package:flutter/material.dart';

import 'news_dialog.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return NewsDialog();
        },
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Image.network(
              'https://s0.rbk.ru/v6_top_pics/media/img/3/07/756333321132073.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
