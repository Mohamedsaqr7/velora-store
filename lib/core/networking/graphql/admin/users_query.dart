class UsersQueries {
  factory UsersQueries() {
    return _instance;
  }
  const UsersQueries._();

  static const UsersQueries _instance = UsersQueries._();

  //Users get all
  Map<String, dynamic> getAllUsersQuery() {
    return {
      'query': '''
            {
              users{
                  name
                  id
                  email

              }
          }
      ''',
    };
  }

  // delete user
  Map<String, dynamic> deleteUserQuery({
    required String userId,
  }) {
    return {
      'query': r'''
            mutation DeleteUser($userId: ID!) {
              deleteUser(id: $userId)
            }
      ''',
      'variables': {
        'userId': userId,
      },
    };
  }
}