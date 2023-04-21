import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable()
class Rocket extends Equatable {
  const Rocket({
    required this.id,
    required this.name,
    required this.description,
    required this.height,
    required this.diameter,
    required this.mass,
    this.flickrImages = const [],
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);

  final String id;
  final String name;
  final String description;
  final Length height;
  final Length diameter;
  final Mass mass;
  final List<String> flickrImages;
  final bool? active;
  final int? stages;
  final int? boosters;
  final int? costPerLaunch;
  final int? successRatePct;
  final DateTime? firstFlight;
  final String? country;
  final String? company;
  final String? wikipedia;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        height,
        diameter,
        mass,
        flickrImages,
        active,
        stages,
        boosters,
        costPerLaunch,
        successRatePct,
        firstFlight,
        country,
        company,
        wikipedia
      ];

  @override
  String toString() => 'Rocket($id, $name)';
}

@JsonSerializable()
class Length extends Equatable {
  const Length({
    required this.meters,
    required this.feet,
  });

  factory Length.fromJson(Map<String, dynamic> json) => _$LengthFromJson(json);

  Map<String, dynamic> toJson() => _$LengthToJson(this);

  final double meters;
  final double feet;

  @override
  List<Object?> get props => [meters, feet];

  @override
  String toString() => 'Length($meters m, $feet ft)';
}

@JsonSerializable()
class Mass extends Equatable {
  const Mass({
    required this.kg,
    required this.lb,
  });

  factory Mass.fromJson(Map<String, dynamic> json) => _$MassFromJson(json);

  Map<String, dynamic> toJson() => _$MassToJson(this);

  final double kg;
  final double lb;

  @override
  List<Object?> get props => [kg, lb];

  @override
  String toString() => 'Mass($kg kg, $lb lb)';
}
