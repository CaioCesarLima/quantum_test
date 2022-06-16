
import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:quantum_app/src/data/models/music_model.dart';
import 'package:quantum_app/src/data/models/user_model.dart';

class UserRepository {

  HasuraConnect hasuraConnect = HasuraConnect('https://quantum-teste-backend.herokuapp.com/v1/graphql');


  UserRepository();

  Future<UserModel> getUser(int user_id) async {
    print("music");
    try{
      String docQuery = """
        query MyQuery {
          users {
            name
            plan {
              limit
              name
              id
            }
            users_musics {
              music {
                name
                id
                plan {
                  id
                  name
                  limit
                }
              }
            }
            id
            email
          }
        }
      """;
      var response = await hasuraConnect.query(docQuery);
      UserModel user = UserModel.fromMap(response["data"]["users"][0]);

      print(response["data"]["users"][0]);
      return user;
    }catch(e){
      print(e.toString());
      return Future.error(e);
    }
  }

  Future<void> add_playlist() async {
    try{
      String docQuery = """
        mutation MyMutation {
          insert_users_musics(objects: {music_id: 1, user_id: 1}) {
            affected_rows
          }
        }
      """;
      var response = await hasuraConnect.mutation(docQuery);
      print(response);

    }catch(e){
      print(e.toString());
      return Future.error(e);
    }
  }
  
}