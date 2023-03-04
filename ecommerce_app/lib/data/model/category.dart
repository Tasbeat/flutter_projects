// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  String collectionId;
  String color;
  String icon;
  String id;
  String thumbnail;
  String title;
  Category({
    required this.collectionId,
    required this.color,
    required this.icon,
    required this.id,
    required this.thumbnail,
    required this.title,
  });
//http://startflutter.ir/api/files/f5pm8kntkfuwbn1/78q8w901e6iipuk/rectangle_63_7kADbEzuEo.png
  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    final thumbnailsUrl =
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}';
    return Category(
        collectionId: jsonObject['collectionId'],
        color: jsonObject['color'],
        icon: jsonObject['icon'],
        id: jsonObject['id'],
        thumbnail: thumbnailsUrl,
        title: jsonObject['title']);
  }
}
