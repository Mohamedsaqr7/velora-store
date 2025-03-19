import '../../../../feature/admin/add_categories/data/models/create_categories_request_body.dart';

class CategoriesQuery {
  static Map<String, dynamic> getCategoriesQuery() {
    return {
      'query': '''
        {
          categories{
              id
              name
              image
          }
        }
      ''',
    };
  }
  
  static Map<String, dynamic> createCategoriesQuery({
    required CreateCategoryRequestModel body,
  }) {
    return {
      'query': r'''
          mutation Create($name: String!, $image: String!) {
            addCategory(
              data: {name: $name, image: $image}
            ) {
              id
              name
              image
            }
          }
        ''',
      'variables': {
        'name': body.name,
        'image': body.image,
      },
    };
  }
}
