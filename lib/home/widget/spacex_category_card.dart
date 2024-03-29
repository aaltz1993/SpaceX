import 'package:flutter/material.dart';

class SpaceXCategoryCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget title;
  final String imageUrl;

  const SpaceXCategoryCard({
    Key? key,
    required this.onTap,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16.0));

    return Ink(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: 1 / 5,
            child: SizedBox(
              width: double.infinity,
              child: ColoredBox(
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: DefaultTextStyle.merge(
                      style: Theme.of(context).textTheme.headlineMedium,
                      child: title,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
