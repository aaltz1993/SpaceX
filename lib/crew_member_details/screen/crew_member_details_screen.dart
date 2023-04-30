import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/crew_member_details/crew_member_details.dart';
import 'package:spacex/crew_member_details/widgets/image_header.dart';
import 'package:spacex/crew_member_details/widgets/title_header.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CrewMemberDetailsScreen extends StatelessWidget {
  const CrewMemberDetailsScreen({super.key});

  static Route<void> route({required CrewMember crewMember}) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => CrewMemberDetailsCubit(crewMember: crewMember),
        child: const CrewMemberDetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CrewMemberDetailsView();
  }
}

class CrewMemberDetailsView extends StatelessWidget {
  const CrewMemberDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final crewMember = context
        .select((CrewMemberDetailsCubit cubit) => cubit.state.crewMember);

    return Scaffold(
      appBar: AppBar(
        title: Text(crewMember.name),
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              ImageHeader(),
              SizedBox(height: 8),
              TitleHeader(),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 48,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                child: const Text('Open Wikipedia'),
                onPressed: () async {
                  final url = crewMember.wikipedia;

                  if (await canLaunchUrlString(url)) {
                    await launchUrlString(url);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
