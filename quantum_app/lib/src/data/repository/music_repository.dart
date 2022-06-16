
import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:quantum_app/src/data/models/music_model.dart';
import 'package:quantum_app/src/data/models/user_model.dart';

class MusicRepository {

  HasuraConnect hasuraConnect = HasuraConnect('https://quantum-teste-backend.herokuapp.com/v1/graphql');
  final String url;

  MusicRepository(this.url);

  Future<List<MusicModel>> getMusics(int plan_id) async {
    print("music");
    try{
      String docQuery = """
        query MyQuery {
          musics(where: {plan_id: {_eq: 1}}) {
            name
            id
            plan {
              name
              limit
              id
            }
            plan_id
          }
        }
      """;
      var response = await hasuraConnect.query(docQuery);
      List<MusicModel> responseList = (response["data"]["musics"] as List).map((e) => MusicModel.fromMap(e)).toList();

      return responseList;
    }catch(e){
      print(e.toString());
      return Future.error(e);
    }
  }

  Future<void> add_playlist(int music_id, int user_id) async {
    try{
      String docQuery = """
        mutation MyMutation {
          insert_users_musics(objects: {music_id: $music_id, user_id: $user_id}) {
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
  
  Future<void> remove_playlist(int music_id, int user_id) async {
    try{
      String docQuery = """
        mutation MyMutation {
          delete_users_musics(where: {music_id: {_eq: $music_id}, user_id: {_eq: $user_id}}) {
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