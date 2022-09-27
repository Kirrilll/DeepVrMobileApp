part of './event_progress_bar.dart';


class _ProgressBarLine extends StatelessWidget {
  const _ProgressBarLine(
      {Key? key, required this.animationController, required this.position})
      : super(key: key);

  final AnimationController animationController;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Builder(builder: (context) {
        if (position == 0) {
          return AnimatedBuilder(
            builder: (_, child) => LinearProgressIndicator(
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.22),
              color: Colors.white,
              value: animationController.value,
            ),
            animation: animationController,
          );
        } else if (position > 0) {
          return const ColoredBox(color: Color.fromRGBO(255, 255, 255, 0.22));
        }
        return const ColoredBox(color: Colors.white);
      }),
      height: 6,
    );
  }
}