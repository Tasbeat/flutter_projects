abstract class Product {
  void seeReviews();
  void getSmaple();
}

class Book implements Product {
  @override
  void getSmaple() {
    // TODO: implement getSmaple
  }

  @override
  void seeReviews() {
    // TODO: implement seeReviews
  }
}

class DVD implements Product {
  @override
  void getSmaple() {
    // TODO: implement getSmaple
  }

  @override
  void seeReviews() {
    // TODO: implement seeReviews
  }
}

class Shelf {
  Product? book;

  void addBook(Product product) {}

  void customizeShelf() {}
}
