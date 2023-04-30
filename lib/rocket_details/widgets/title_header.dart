import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/rocket_details/cubit/rocket_details_cubit.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final rocket =
        context.select((RocketDetailsCubit cubit) => cubit.state.rocket);

    return ListTile(
      title: Row(
        children: [
          Text(
            rocket.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (rocket.active != null) ...[
            const SizedBox(width: 8.0),
            rocket.active!
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.check,
                    color: Colors.red,
                  )
          ],
        ],
      ),
      subtitle: rocket.firstFlight == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(rocket.firstFlight!.toIso8601String()),
            ),
    );
  }
}
