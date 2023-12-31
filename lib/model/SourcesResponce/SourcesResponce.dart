

import 'package:untitled/model/SourcesResponce/Sorces.dart';

class SorcesResponce {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SorcesResponce({this.status, this.sources});

  SorcesResponce.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];


    if (json['sources'] != null) {
      sources = <Source>[];
      json['sources'].forEach((v) {
        sources!.add(new Source.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.sources != null) {
      data['sources'] = this.sources!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}