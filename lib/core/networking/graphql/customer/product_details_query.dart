class ProductDetailsQuery {
  factory ProductDetailsQuery() {
    return _instance;
  }
  const ProductDetailsQuery._();

  static const ProductDetailsQuery _instance = ProductDetailsQuery._();

  //Product Details
  Map<String, dynamic> getProductDetailsQuery({required int id}) {
    return {
      'query': '''
           {
          product(id: $id) {
            id
            title
            price
            images
            description
              category{
                name
                }
          }
        },
  
      ''',
    };
  }
}