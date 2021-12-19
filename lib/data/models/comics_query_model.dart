class ComicsQueryModel {
  final int startYear;
  final String orderBy;
  final int limit;

  ComicsQueryModel({
    this.startYear = 2005,
    this.orderBy = 'onsaleDate',
    this.limit = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'startYear': startYear,
      'orderBy': orderBy,
      'limit': limit,
    };
  }

  ComicsQueryModel copyWith({int? startYear, String? orderBy, int? limit}) {
    return ComicsQueryModel(
      startYear: startYear ?? this.startYear,
      orderBy: orderBy ?? this.orderBy,
      limit: limit ?? this.limit,
    );
  }
}
