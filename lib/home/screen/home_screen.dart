import 'package:flutter/material.dart';
import 'package:spacex/crew/crew.dart';
import 'package:spacex/home/widget/widgets.dart';
import 'package:spacex/rockets/rockets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceX'),
      ),
      body: const Center(
        child: _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 32.0),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SpaceXCategoryCard(
                key: const Key('HomeScreenContent_Rockets_SpaceXCategoryCard'),
                onTap: () => Navigator.of(context).push(RocketsScreen.route()),
                title: const Text('Rockets'),
                imageUrl: 'assets/images/spacex_rocket.jpeg',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: SpaceXCategoryCard(
                key: const Key('HomeScreenContent_Crew_SpaceXCategoryCard'),
                onTap: () => Navigator.of(context).push(CrewScreen.route()),
                title: const Text('Crew'),
                imageUrl: 'assets/images/spacex_crew.jpeg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
