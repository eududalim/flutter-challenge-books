import 'package:flutter/material.dart';
import 'package:flutter_challenge_books/app/layers/presenters/view/home/widgets/title_section_widget.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../controllers/persons_controller.dart';
import 'widgets/head_title_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = inject.get<BooksController>();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    controller.loadingItemsHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeadTitleHome(controller: tabController),
          Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(maxHeight: size.height),
            //alignment: Alignment.centerRight,
            child: TabBarView(controller: tabController, children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    TitleSectionWidget(title: 'Livros favoritos'),
                    Row(
                      children: [Container()],
                    )
                  ],
                ),
              ),
              Container(),
            ]),
          ),
        ],
      ),
    ));
  }
}
