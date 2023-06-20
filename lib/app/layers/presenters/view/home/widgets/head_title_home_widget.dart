import 'package:flutter/material.dart';

import '../../../../../shared/theme/colors_theme_const.dart';

class HeadTitleHome extends StatelessWidget {
  const HeadTitleHome({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  constraints: const BoxConstraints(minHeight: 80, maxHeight: 150),
      //   alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(32))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SS',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'BOOK',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: themeColor),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.2),
                child: Image.asset('assets/avatar.png'),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      controller: controller,
                      indicatorColor: themeColor,
                      indicatorWeight: 4,
                      // padding: EdgeInsets.only(bottom: 0),
                      //  indicatorPadding: EdgeInsets.only(bottom: 0),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      tabs: const [
                        TabTitle(title: 'Meus livros'),
                        TabTitle(title: 'Emprestados'),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabTitle extends StatelessWidget {
  const TabTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Text(
          title,
          style: textMedium.copyWith(fontWeight: FontWeight.w800),
        ));
  }
}
