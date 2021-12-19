// To parse this JSON data, do
//
//     final comicsResponse = comicsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:marvel_app/data/models/thumbnail.dart';

ComicsResponse comicsResponseFromJson(String str) =>
    ComicsResponse.fromJson(json.decode(str));

String comicsResponseToJson(ComicsResponse data) => json.encode(data.toJson());

class ComicsResponse {
  ComicsResponse({
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

  factory ComicsResponse.fromJson(Map<String, dynamic> json) => ComicsResponse(
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

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        //"results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    // this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    // this.format,
    this.pageCount,
    // this.textObjects,
    this.resourceUri,
    // this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    // this.dates,
    // this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    // this.stories,
    this.events,
  });

  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  //VariantDescription? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  //Format? format;
  int? pageCount;
  //List<TextObject>? textObjects;
  String? resourceUri;
  //List<Url>? urls;
  Series? series;
  List<Series>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  // List<Date>? dates;
  // List<Price>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  Creators? creators;
  Characters? characters;
  // Stories? stories;
  Characters? events;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        digitalId: json["digitalId"],
        title: json["title"],
        issueNumber: json["issueNumber"],
        // variantDescription: variantDescriptionValues.map[json["variantDescription"]],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"],
        isbn: json["isbn"],
        upc: json["upc"],
        diamondCode: json["diamondCode"],
        ean: json["ean"],
        issn: json["issn"],
        // format: formatValues.map[json["format"]],
        pageCount: json["pageCount"],
        //textObjects: List<TextObject>.from(json["textObjects"].map((x) => TextObject.fromJson(x))),
        resourceUri: json["resourceURI"],
        //urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        series: Series.fromJson(json["series"]),
        variants:
            List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues:
            List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        // dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        //  prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        images: List<Thumbnail>.from(
            json["images"].map((x) => Thumbnail.fromJson(x))),
        creators: Creators.fromJson(json["creators"]),
        characters: Characters.fromJson(json["characters"]),
        // stories: Stories.fromJson(json["stories"]),
        events: Characters.fromJson(json["events"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digitalId": digitalId,
        "title": title,
        "issueNumber": issueNumber,
        //"variantDescription": variantDescriptionValues.reverse[variantDescription],
        "description": description == null ? null : description,
        "modified": modified,
        "isbn": isbn,
        "upc": upc,
        "diamondCode": diamondCode,
        "ean": ean,
        "issn": issn,
        //"format": formatValues.reverse[format],
        "pageCount": pageCount,
        //"textObjects": List<dynamic>.from(textObjects.map((x) => x.toJson())),
        "resourceURI": resourceUri,
        //"urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "series": series?.toJson(),
        //"variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        //"collections": List<dynamic>.from(collections.map((x) => x)),
        //"collectedIssues": List<dynamic>.from(collectedIssues.map((x) => x)),
        //"dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        //"prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "thumbnail": thumbnail?.toJson(),
        //"images": List<dynamic>.from(images.map((x) => x.toJson())),
        "creators": creators?.toJson(),
        "characters": characters?.toJson(),
        //"stories": stories?.toJson(),
        "events": events?.toJson(),
      };
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Series>? items;
  int? returned;

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        //"items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Creators {
  Creators({
    this.available,
    this.collectionUri,
    // this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  //List<CreatorsItem>? items;
  int? returned;

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        //items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        //"items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
      };
}

/* class CreatorsItem {
    CreatorsItem({
        this.resourceUri,
        this.name,
        this.role,
    });

    String? resourceUri;
    String? name;
    Role? role;

    factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: roleValues.map[json["role"]],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": roleValues.reverse[role],
    };
} */

enum Role {
  EDITOR,
  LETTERER,
  PENCILLER,
  WRITER,
  COLORIST,
  INKER,
  PENCILLER_COVER,
  PENCILER
}
/* 
final roleValues = EnumValues({
    "colorist": Role.COLORIST,
    "editor": Role.EDITOR,
    "inker": Role.INKER,
    "letterer": Role.LETTERER,
    "penciler": Role.PENCILER,
    "penciller": Role.PENCILLER,
    "penciller (cover)": Role.PENCILLER_COVER,
    "writer": Role.WRITER
}); */

/* class Date {
    Date({
        this.type,
        this.date,
    });

    DateType? type;
    String? date;

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: dateTypeValues.map[json["type"]],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "type": dateTypeValues.reverse[type],
        "date": date,
    };
} */

/* enum DateType { ONSALE_DATE, FOC_DATE, UNLIMITED_DATE, DIGITAL_PURCHASE_DATE }

final dateTypeValues = EnumValues({
    "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
    "focDate": DateType.FOC_DATE,
    "onsaleDate": DateType.ONSALE_DATE,
    "unlimitedDate": DateType.UNLIMITED_DATE
});

enum Format { COMIC }

final formatValues = EnumValues({
    "Comic": Format.COMIC
}); */


/* 
class Price {
    Price({
        this.type,
        this.price,
    });

    PriceType type;
    double price;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: priceTypeValues.map[json["type"]],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "type": priceTypeValues.reverse[type],
        "price": price,
    };
}

enum PriceType { PRINT_PRICE, DIGITAL_PURCHASE_PRICE }

final priceTypeValues = EnumValues({
    "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
    "printPrice": PriceType.PRINT_PRICE
});

class Stories {
    Stories({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    int available;
    String collectionUri;
    List<StoriesItem> items;
    int returned;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class StoriesItem {
    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    String resourceUri;
    String name;
    ItemType type;

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse[type],
    };
}

enum ItemType { COVER, INTERIOR_STORY }

final itemTypeValues = EnumValues({
    "cover": ItemType.COVER,
    "interiorStory": ItemType.INTERIOR_STORY
});

class TextObject {
    TextObject({
        this.type,
        this.language,
        this.text,
    });

    TextObjectType type;
    Language language;
    String text;

    factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: textObjectTypeValues.map[json["type"]],
        language: languageValues.map[json["language"]],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "type": textObjectTypeValues.reverse[type],
        "language": languageValues.reverse[language],
        "text": text,
    };
}

enum Language { EN_US }

final languageValues = EnumValues({
    "en-us": Language.EN_US
});

enum TextObjectType { ISSUE_PREVIEW_TEXT, ISSUE_SOLICIT_TEXT }

final textObjectTypeValues = EnumValues({
    "issue_preview_text": TextObjectType.ISSUE_PREVIEW_TEXT,
    "issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT
});

class Url {
    Url({
        this.type,
        this.url,
    });

    UrlType type;
    String url;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: urlTypeValues.map[json["type"]],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": urlTypeValues.reverse[type],
        "url": url,
    };
}

enum UrlType { DETAIL, PURCHASE, READER, IN_APP_LINK }

final urlTypeValues = EnumValues({
    "detail": UrlType.DETAIL,
    "inAppLink": UrlType.IN_APP_LINK,
    "purchase": UrlType.PURCHASE,
    "reader": UrlType.READER
});

enum VariantDescription { EMPTY, ZOMBIE_VARIANT, SPOTLIGHT_VARIANT }

final variantDescriptionValues = EnumValues({
    "": VariantDescription.EMPTY,
    "SPOTLIGHT VARIANT": VariantDescription.SPOTLIGHT_VARIANT,
    "ZOMBIE VARIANT": VariantDescription.ZOMBIE_VARIANT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
} */
