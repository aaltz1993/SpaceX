import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/crew_member_details/crew_member_details.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final crewMember = context
        .select((CrewMemberDetailsCubit cubit) => cubit.state.crewMember);

    return ListTile(
      isThreeLine: true,
      title: Row(
        children: [
          Text(
            crewMember.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(width: 8),
          (crewMember.status == 'active')
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.check,
                  color: Colors.red,
                )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              text: 'Agency: ',
              style: const TextStyle(color: Color(0xFFB3B3B3)),
              children: [
                TextSpan(
                  text: crewMember.agency,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: 'Has participated in ',
              style: const TextStyle(color: Color(0xFFB3B3B3)),
              children: [
                TextSpan(
                    text:
                        '${crewMember.launches.length} ${crewMember.launches.length == 1 ? 'launch' : 'launches'}',
                    style: const TextStyle(color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
