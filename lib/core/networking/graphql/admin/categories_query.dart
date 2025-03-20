import '../../../../feature/admin/add_categories/data/models/create_categories_request_body.dart';
import '../../../../feature/admin/add_categories/data/models/update_category_request_body.dart';

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

  static Map<String, dynamic> deleteCategoryQuery({
    required String categoryId,
  }) {
    return {
      'query': r'''
          mutation DeleteCategory($categoryId: ID!){
            deleteCategory(id: $categoryId)
          }
      ''',
      'variables': {
        'categoryId': categoryId,
      },
    };
  }
  
  Map<String, dynamic> updateCategoryQuery({
    required UpdateCategoryRequestBody body,
  }) {
    return {
      'query': r'''
            mutation Update($id: ID!, $name: String!, $image: String!) {
            updateCategory(id: $id, changes: { name: $name, image: $image}) {
              id
            }
          }
        ''',
      'variables': {
        'id': body.id,
        'name': body.name,
        'image': body.image,
      },
    };
  }
}
