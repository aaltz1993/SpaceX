import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew_member.g.dart';

@JsonSerializable()
class CrewMember extends Equatable {
  const CrewMember({
    required this.id,
    required this.name,
    required this.status,
    required this.agency,
    required this.image,
    required this.wikipedia,
    required this.launches,
  });

  factory CrewMember.fromJson(Map<String, dynamic> json) =>
      _$CrewMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CrewMemberToJson(this);

  final String id;
  final String name;
  final String status;
  final String agency;
  final String image;
  final String wikipedia;
  final List<String> launches;

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        agency,
        image,
        wikipedia,
        launches,
      ];

  @override
  bool get stringify => true;

  @override
  String toString() => 'CrewMember($id, $name)';
}
