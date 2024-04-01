import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/search_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/search_page_content_widget.dart';
import '../widgets/search_results_widget.dart';

class SearchPage extends SearchDelegate {
  final bool? isArabic;
  SearchPage(this.isArabic);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.close,
            size: 20.sp,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        size: 20.sp,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // makeEmpty(context);
    _obtainSearchProductFuture(context, query.toString());
    return SearchResultsWidget(query.toString());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchPageContentWidget(isArabic!);
  }

  Future _obtainSearchProductFuture(BuildContext context, String query) async {
    return await Provider.of<SearchProvider>(context, listen: false)
        .submitSearch(isArabic!, query, 1);
  }

  // Future makeEmpty(BuildContext context) async {
  //   return await Provider.of<SearchProvider>(context, listen: false)
  //       .makeEmptyList();
  // }
}
