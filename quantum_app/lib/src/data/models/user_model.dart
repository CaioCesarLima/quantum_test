
import './music_model.dart';
import './plan_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final PlanModel plan;
  final List<MusicModel> musics;

  UserModel({required this.id,required this.name,required this.email,required this.plan,required this.musics});

  factory UserModel.fromMap(response){
    return UserModel(
      id: response["id"],
      name: response["name"],
      email: response["email"],
      plan: PlanModel.fromMap(response["plan"]),
      musics: (response["users_musics"] as List).map((e) => MusicModel.fromMap(e["music"])).toList()
    );
  }
}