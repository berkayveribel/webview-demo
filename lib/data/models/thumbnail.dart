class Thumbnail {
  Thumbnail({
    this.path,
    this.ext,
  });

  String? path;
  String? ext;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        ext: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": ext,
      };
}
