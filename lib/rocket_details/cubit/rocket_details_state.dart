import 'package:equatable/equatable.dart';
import 'package:spacex_api/spacex_api.dart';

class RocketDetailsState extends Equatable {
  final Rocket rocket;

  const RocketDetailsState({required this.rocket});

  @override
  List<Object?> get props => [rocket];
}
