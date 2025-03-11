
import '../../../feature/auth/sign_up/data/model/sign_up_request_body.dart';

class SignUpQuery {
  SignUpQuery._();

  static SignUpQuery instance = SignUpQuery._();

  static Map<String, dynamic> signUpQuery({
    required SignUpRequestModel model,
  }) {
    return {
      'query': r'''
        mutation SignUp($name: String! , $email: String! , $password: String! , $avatar: String!) {
          addUser(
              data: {
                name: $name
                email: $email
                password: $password
                avatar: $avatar
                role:customer
              }
    	      ){
                  id
                  name
                  email
                  avatar
                  role
             }       
        }
      ''',
      'variables': {
        'name': model.name,
        'email': model.email,
        'password': model.password,
        'avatar': model.avatar,
      },
    };
  }
}
