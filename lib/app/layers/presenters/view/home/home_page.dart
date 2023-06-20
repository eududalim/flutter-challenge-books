import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_challenge_books/app/layers/domain/states/book_states_model.dart';
import 'package:flutter_challenge_books/app/layers/presenters/view/home/widgets/title_section_widget.dart';

import '../../../../shared/dependency_injection/dependency_injection.dart';
import '../../controllers/home_controller.dart';
import 'widgets/head_title_home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final controller = inject.get<HomeController>();
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
                    const TitleSectionWidget(title: 'Livros favoritos'),
                    ValueListenableBuilder(
                      valueListenable: controller.favoriteBooksState,
                      builder: (context, state, child) {
                        if (state is BooksLoadingState) {
                          return Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 700),
                              ),
                            ],
                          );
                        }
                        if (state is BooksSuccessState) {
                          debugPrint(state.data.first.toString());
                          return Row(
                              children: state.data
                                  .map(
                                    (book) => AspectRatio(
                                      aspectRatio: 9 / 16,
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Image.network(book.cover),
                                        height: 60,
                                      ),
                                    ),
                                  )
                                  .toList());
                        }

                        if (state is BookErrorState) {
                          debugPrint(state.errorMessage);
                          return Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 700),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                height: 100,
                                child: const AspectRatio(
                                  aspectRatio: 9 / 16,
                                  child: Icon(Icons.error),
                                ),
                              ),
                            ],
                          );
                        }

                        return Container();
                      },
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
