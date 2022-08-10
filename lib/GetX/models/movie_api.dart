import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHandler {
  ApiHandler(this.url);
  final String url;
  Future<List<dynamic>> getData() async {
    var result = await http.get(Uri.parse(url));
    return json.decode(result.body);
  }
}

class DrawerData extends ApiHandler {
  DrawerData() : super("https://mycima.buzz:2096/appweb/menus");
}

class SearchData extends ApiHandler {
  String search;
  SearchData({this.search = "منورة باهلها"})
      : super("https://mycima.buzz/appweb/search/$search/");
}

class RelatedPosts extends ApiHandler {
  String postID;
  RelatedPosts({this.postID = "31341"})
      : super("https://mycima.buzz/appweb/posts/related/$postID/");
}

class FilteredData extends ApiHandler {
  String taxonamy;
  String termID;
  FilteredData({this.taxonamy = "category", this.termID = "31341"})
      : super("https://mycima.buzz/appweb/posts/archived_$taxonamy[$termID]/");
}
