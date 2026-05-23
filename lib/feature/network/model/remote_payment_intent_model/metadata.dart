class Metadata {
  final Map<String, dynamic>? data;

  Metadata({this.data});

  factory Metadata.fromJson(Map<String, dynamic>? json) {
    return Metadata(
      data: json,
    );
  }

  Map<String, dynamic> toJson() {
    return data ?? {};
  }
}