class Collection {
  Collection({
    required this.collectionImage,
    required this.collectionName,
  });

  final String collectionImage;
  final String collectionName;
}

List<Collection> collections = List.of({
  Collection(
    collectionImage: 'assets/common/images/profile_image.jpg',
    collectionName: 'Matadors',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/profile/coverage.jpeg',
    collectionName: 'Mercury',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/1.jpg',
    collectionName: 'An Evening Affair',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/2.jpg',
    collectionName: 'Yaeger',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/3.jpg',
    collectionName: 'Sputnik',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/4.jpg',
    collectionName: 'Sirius',
  ),
  Collection(
    collectionImage: 'assets/facebook_ui/images/collections/5.jpg',
    collectionName: 'Java Dalia',
  ),
});
