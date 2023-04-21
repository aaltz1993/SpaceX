import 'package:crew_repository/crew_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/crew/crew.dart';

class SpaceXApp extends StatelessWidget {
  const SpaceXApp({
    Key? key,
    required CrewRepository crewRepository,
  })  : _crewRepository = crewRepository,
        super(key: key);

  final CrewRepository _crewRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _crewRepository),
      ],
      child: const SpaceXAppView(),
    );
  }
}

class SpaceXAppView extends StatelessWidget {
  const SpaceXAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(brightness: Brightness.dark, secondary: Colors.white),
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        dividerTheme: const DividerThemeData(
          indent: 16.0,
          space: 0.0,
        ),
      ),
      home: const CrewScreen(),
    );
  }
}
