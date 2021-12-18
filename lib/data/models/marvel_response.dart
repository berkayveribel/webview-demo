// To parse this JSON data, do
//
//     final marvelResponse = marvelResponseFromJson(jsonString);

import 'dart:convert';

import 'package:marvel_app/data/models/data.dart';

MarvelResponse marvelResponseFromJson(String str) =>
    MarvelResponse.fromJson(json.decode(str));

String marvelResponseToJson(MarvelResponse data) => json.encode(data.toJson());

class MarvelResponse {
  MarvelResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  Data? data;

  factory MarvelResponse.fromJson(Map<String, dynamic> json) => MarvelResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toJson(),
      };
}
