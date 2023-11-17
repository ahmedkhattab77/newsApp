import 'package:untitled/model/NewsResponce/News.dart';

class NewsResponce {
  String? status;
  int? totalResults;
  String? code;
  String? message;
  List<News>? articles;

  NewsResponce({this.status, this.totalResults, this.articles});

  NewsResponce.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <News>[];
      json['articles'].forEach((v) {
        articles!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}