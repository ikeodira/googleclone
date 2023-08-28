import 'package:flutter/material.dart';
import 'package:googlecloneflutter/colors.dart';
import 'package:googlecloneflutter/widgets/search_footer.dart';
import 'package:googlecloneflutter/widgets/search_header.dart';
import 'package:googlecloneflutter/widgets/search_tabs.dart';
import '../services/api_service.dart';
import '../widgets/search_result_component.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;

  const SearchScreen({
    super.key,
    required this.start,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Web Header
            const SearchHeader(),
            //Tabs for news images etc
            const Padding(
              padding: EdgeInsets.only(left: 150),
              child: SearchTabs(),
            ),
            const Divider(
              height: 0,
              thickness: 0.3,
            ),
            //Search Results
            FutureBuilder(
              future: ApiService().fetchData(
                queryTerm: searchQuery,
                start: start,
              ),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 150, top: 12),
                        child: Text(
                          'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF70757a),
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: snapshot.data['items'].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 150, top: 10),
                            child: SearchResultComponent(
                              link: snapshot.data?['items'][index]
                                  ['formattedUrl'],
                              linkToGo: snapshot.data?['items'][index]['link'],
                              desc: snapshot.data?['items'][index]['snippet'],
                              text: snapshot.data?['items'][index]['title'],
                            ),
                          );
                        },
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            //Pagination Buttons
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (start != "0") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchScreen(
                                start: (int.parse(start) - 10).toString(),
                                searchQuery: searchQuery)));
                      }
                    },
                    child: const Text(
                      "< Prev",
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                              start: (int.parse(start) + 10).toString(),
                              searchQuery: searchQuery),
                        ),
                      );
                    },
                    child: const Text(
                      "Next >",
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const SearchFooter(),
          ],
        ),
      ),
    );
  }
}
