
class PlanModel {
  final int id;
  final String name;
  final int limit;

  PlanModel({required this.name, required this.limit, required this.id});

  factory PlanModel.fromMap(response){
    return PlanModel(
      id: response["id"],
      name: response["name"],
      limit: response["limit"],
    );
  }
}