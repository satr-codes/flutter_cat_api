class CatImage {
  late String id;
  late String url;

  CatImage({required this.id, required this.url});

  CatImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
}
