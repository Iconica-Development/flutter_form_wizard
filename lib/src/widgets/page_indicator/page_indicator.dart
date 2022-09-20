import 'package:flutter/material.dart';

abstract class PageIndicator extends StatelessWidget {
  const PageIndicator({
    this.steps = 3,
    required this.currentStep,
    Key? key,
  }) : super(key: key);

  final int steps;
  final int currentStep;
}

class PageIndicatorCirlesLine extends PageIndicator {
  const PageIndicatorCirlesLine({
    steps = 3,
    required currentStep,
    Key? key,
  }) : super(key: key, steps: steps, currentStep: currentStep);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < steps; i++) ...[
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: i <= currentStep
                  ? Colors.black.withOpacity(0.80)
                  : const Color(0xFFF3F2F2),
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withOpacity(i <= currentStep ? 0.40 : 0.10),
                  offset: const Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: i == currentStep
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.5),
                      child: Text(
                        (i + 1).toString(),
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: const Color(0xFFF3F2F2),
                            ),
                      ),
                    ),
                  )
                : i < currentStep
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 1.5),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    : Container(),
          ),
          if (i + 1 < steps)
            const SizedBox(
              width: 4,
            ),
          if (i + 1 < steps)
            Container(
              width: 15,
              height: 7,
              decoration: BoxDecoration(
                color: i + 1 <= currentStep
                    ? Colors.black.withOpacity(0.80)
                    : const Color(0xFFF3F2F2),
                borderRadius: BorderRadius.circular(3.5),
              ),
            ),
          if (i + 1 < steps)
            const SizedBox(
              width: 4,
            ),
        ]
      ],
    );
  }
}
