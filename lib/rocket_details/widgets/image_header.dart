import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/rocket_details/cubit/rocket_details_cubit.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = context.select(
      (RocketDetailsCubit cubit) => cubit.state.rocket.flickrImages.first,
    );

    return SizedBox(
      height: 256 + 128,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(8.0),
          ),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
