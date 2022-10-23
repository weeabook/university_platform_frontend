import 'package:flutter/material.dart';

import '../../domain/category/category_entities.dart';
import '../widgets/news_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isMobile = true;
  final List<Category> categories = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1200) {
      setState(() {
        isMobile = false;
      });
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: isMobile ? CustomDrawer(categories: []) : null,
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: isMobile ? 0 : 70),
                    isMobile
                        ? IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                          )
                        : const SizedBox(),
                    const Text(
                      'LeninUP',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 1200) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CategoryDrawerWidget(text: 'Свежее'),
                                  ...List.generate(
                                    categories.length,
                                    (index) => CategoryDrawerWidget(
                                      text: categories[index].name,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: NewsWidget(),
                            ),
                            Spacer(flex: 2),
                          ],
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 15),
                        itemCount: 10,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => NewsWidget(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: 10,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({
    required this.categories,
    super.key,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        CategoryDrawerWidget(text: 'Свежее', isActive: true),
        ...List.generate(
          categories.length,
          (index) => CategoryDrawerWidget(text: categories[index].name),
        ),
        const Spacer(),
        CategoryDrawerWidget(text: 'Профиль'),
        CategoryDrawerWidget(text: 'Войти'),
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    required this.categories,
    super.key,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: CategoriesBody(categories: categories),
      ),
    );
  }
}

class CategoryDrawerWidget extends StatelessWidget {
  const CategoryDrawerWidget({
    Key? key,
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(isActive ? 0xFFBEDCFF : 0xFFFFFFFF),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
