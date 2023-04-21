import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/crew/crew.dart';

class CrewScreen extends StatelessWidget {
  const CrewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CrewCubit(
        crewRepository: context.read(),
      )..fetchCrewMembers(),
      child: const CrewView(),
    );
  }
}

class CrewView extends StatelessWidget {
  const CrewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crew'),
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
        context.select((CrewCubit crewCubit) => crewCubit.state.loadState);

    switch (loadState) {
      case LoadState.none:
        return const SizedBox(
          key: Key('crew_view_none_sized_box'),
        );
      case LoadState.loading:
        return const Center(
          key: Key('crew_view_loading_indicator'),
          child: CircularProgressIndicator.adaptive(),
        );
      case LoadState.success:
        return const _CrewMembersList(
          key: Key('crew_view_success_crew_members_list'),
        );
      case LoadState.failure:
        return const Center(
          key: Key('crew_view_failure_error_message'),
          child: Text(':('), // TODO
        );
    }
  }
}

class _CrewMembersList extends StatelessWidget {
  const _CrewMembersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final crewMembers =
        context.select((CrewCubit cubit) => cubit.state.crewMembers!);

    return ListView(
      children: [
        for (final crewMember in crewMembers) ...[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(crewMember.image),
            ),
            title: Text(crewMember.name),
            isThreeLine: true,
            subtitle: Text(
              crewMember.agency,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              Navigator.of(context);
            },
          ),
          const Divider(),
        ]
      ],
    );
  }
}
