import 'package:crew_repository/crew_repository.dart';
import 'package:flutter/material.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex/app/spacex_app.dart';

void main() {
  runApp(
    SpaceXApp(
      rocketRepository: RocketRepository(),
      crewRepository: CrewRepository(),
    ),
  );
}
