
import 'package:app_atak/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';



class ResultContainer extends StatefulWidget {
  const ResultContainer({Key? key}) : super(key: key);

  @override
  ResultContainerState createState() => ResultContainerState();

  void refresh(BuildContext context) {
    ResultContainerState state = context.findAncestorStateOfType<ResultContainerState>()!;
    state.refresh();
  }
}

class ResultContainerState extends State<ResultContainer> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        if (searchProvider.isLoading) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const CircularProgressIndicator(),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchProvider.title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                if (searchProvider.link.isNotEmpty)
                  InkWell(
                    onTap: () async {
                      await launch(searchProvider.link);
                    },
                    child: Text(
                      searchProvider.link,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
      },
    );
  }
}
