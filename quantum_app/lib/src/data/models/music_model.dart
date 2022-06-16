
import './plan_model.dart';

class MusicModel {
  final int id;
  final String name;
  final PlanModel plan;

  MusicModel({required this.id, required this.name, required this.plan});

  factory MusicModel.fromMap(response){
    return MusicModel(
      id: response["id"],
      name: response["name"],
      plan: PlanModel.fromMap(response["plan"]),
    );
  }

}