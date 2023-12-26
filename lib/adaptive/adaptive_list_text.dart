import 'package:flutter/material.dart';

class AdaptiveListText extends StatelessWidget {
  final String textListText;

  const AdaptiveListText(
    this.textListText, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Text(
            textListText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 20,
            // the size box is the same as that of the container but the main difference between the box and the container that the container need a child as well the box can manage to not to have it
          ),
          Container(
            height: constraints.maxHeight *
                0.5, // as per this is done to give the adjustable height to the image
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/image/waiting.png',
              fit: BoxFit.cover,
              // the box fit is the code that will make the code or the image to fit in the spae that is being given to it
            ),
          ),
        ],
      );
    });
  }
}
