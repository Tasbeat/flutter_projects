class Content {
  String imageUrl;
  List<String> catergories;
  String agency;
  String agencyLogoUrl;
  String reportTime;
  String shortDescription;
  String longDescription;
  Content(
      {required this.imageUrl,
      required this.catergories,
      required this.agency,
      required this.agencyLogoUrl,
      required this.reportTime,
      this.shortDescription = '',
      this.longDescription = ''});
}
