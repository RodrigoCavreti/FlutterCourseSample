class Review {
  final String id;
  final String name;
  final String imageUrl;
  final String comment;
  final double rating;
  double score = -1;

  Review({this.id, this.name, this.imageUrl, this.comment, this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
        comment: json['comment'],
        rating: json['rating']);
  }
}
