import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
import 'package:translatetribune/src/data/models/language_model.dart';
import 'package:translatetribune/src/presentation/shared/articles_header.dart';
import 'package:translatetribune/src/presentation/shared/news_builder.dart';
import 'package:translatetribune/src/presentation/shared/tab_item.dart';
import 'package:translatetribune/src/data/services/articles.dart';

@RoutePage()
class ArticlesPage extends StatefulWidget {
  ArticlesPage({
    required this.language,
    super.key,
  });

  final LanguageModel language;

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage>
    with SingleTickerProviderStateMixin {
  bool searchOpened = false;
  String? filter;

  TextEditingController searchController = TextEditingController();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void openSearch() {
    setState(() {
      filter = null;
      searchController.clear();
      searchOpened = !searchOpened;
    });
  }

  void setFilter() {
    if (searchOpened) {
      setState(() {
        filter = searchController.text.isNotEmpty
            ? searchController.text.trim()
            : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            top: true,
            left: false,
            right: false,
            bottom: false,
            child: Column(
              children: [
                ArticlesHeader(
                  language: widget.language,
                  openSearch: openSearch,
                  setFilter: setFilter,
                  searchOpened: searchOpened,
                  searchController: searchController,
                ),
                const SizedBox(height: 16.0),
                TabBar(
                  controller: tabController,
                  automaticIndicatorColorAdjustment: false,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return states.contains(MaterialState.focused)
                          ? null
                          : Colors.transparent;
                    },
                  ),
                  tabs: [
                    Tab(
                      child: TabItem(
                        widget.language.worldNews,
                        index: 0,
                        tabController: tabController,
                      ),
                    ),
                    Tab(
                      child: TabItem(
                        widget.language.financeTechnology,
                        index: 1,
                        tabController: tabController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: SafeArea(
              top: false,
              left: true,
              right: true,
              bottom: false,
              child: TabBarView(
                controller: tabController,
                children: [
                  NewsBuilder(
                    future: getIt<ArticlesService>().loadWorldNews(
                      widget.language.publishingLanguageShort,
                    ),
                    language: widget.language,
                    filter: filter,
                  ),
                  NewsBuilder(
                    future: getIt<ArticlesService>().loadFinancialAndTechNews(
                      widget.language.publishingLanguageShort,
                    ),
                    language: widget.language,
                    filter: filter,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
