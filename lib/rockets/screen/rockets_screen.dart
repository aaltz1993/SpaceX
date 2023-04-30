import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rocket_repository/rocket_repository.dart';
import 'package:spacex/common/load_state.dart';
import 'package:spacex/rocket_details/rocket_details.dart';
import 'package:spacex/rockets/cubit/rockets_cubit.dart';

class RocketsScreen extends StatelessWidget {
  const RocketsScreen({super.key});

  static Route<RocketsScreen> route() {
    return MaterialPageRoute(
      builder: (_) => const RocketsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RocketsCubit(
        rocketRepository: context.read<RocketRepository>(),
      )..fetchAllRockets(),
      child: const RocketsView(),
    );
  }
}

class RocketsView extends StatelessWidget {
  const RocketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rockets'),
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
    final loadState =
        context.select((RocketsCubit cubit) => cubit.state.loadState);

    switch (loadState) {
      case LoadState.initial:
        return const SizedBox(
          key: Key('rocketsView_none_sizedBox'),
        );
      case LoadState.loading:
        return const Center(
          key: Key('rocketsView_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case LoadState.success:
        return const _RocketList(
          key: Key('rocketsView_success_rocketList'),
        );
      case LoadState.failure:
        return const Center(
          key: Key('rocketsView_failure_text'),
          child: Text(':('),
        );
    }
  }
}

class _RocketList extends StatelessWidget {
  const _RocketList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rockets =
        context.select((RocketsCubit cubit) => cubit.state.rockets!);

    return ListView(
      children: [
        for (final rocket in rockets) ...[
          ListTile(
            title: Text(rocket.name),
            subtitle: Text(
              rocket.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            isThreeLine: true,
            onTap: () => Navigator.of(context).push(
              RocketDetailsScreen.route(rocket: rocket),
            ),
          ),
          const Divider(),
        ]
      ],
    );
  }
}
