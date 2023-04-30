import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/rocket_details/cubit/rocket_details_cubit.dart';
import 'package:spacex/rocket_details/widgets/widgets.dart';
import 'package:spacex_api/spacex_api.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RocketDetailsScreen extends StatelessWidget {
  const RocketDetailsScreen({super.key});

  static Route<void> route({required Rocket rocket}) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => RocketDetailsCubit(rocket: rocket),
        child: const RocketDetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const RocketDetailsView();
  }
}

class RocketDetailsView extends StatelessWidget {
  const RocketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final rocket =
        context.select((RocketDetailsCubit cubit) => cubit.state.rocket);

    return Scaffold(
      appBar: AppBar(
        title: Text(rocket.name),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              if (rocket.flickrImages.isNotEmpty) ...[
                const ImageHeader(),
                const SizedBox(height: 8.0),
              ],
              const TitleHeader(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                child: Text(rocket.description),
              ),
              if (rocket.wikipedia != null)
                const SizedBox(
                  height: 104.0,
                ),
            ],
          ),
          if (rocket.wikipedia != null)
            Positioned(
              left: 16.0,
              right: 16.0,
              bottom: 48.0,
              child: SizedBox(
                height: 56.0,
                child: ElevatedButton(
                  onPressed: () async {
                    final url = rocket.wikipedia!;

                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                  child: const Text('Open Wikipedia'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
