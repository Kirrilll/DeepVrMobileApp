import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
//Можно добавить, чтобы закиддывать свой виджет кнопки
//Свой разделитель
class CustomStepper extends StatefulWidget {
  const CustomStepper({
    Key? key,
    required this.steps,
    this.physics,
    this.type = StepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
    this.elevation,
    this.margin,
  }) :  assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  final List<Step> steps;
  final ScrollPhysics? physics;
  final StepperType type;
  final int currentStep;
  final ValueChanged<int>? onStepTapped;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final ControlsWidgetBuilder? controlsBuilder;
  final double? elevation;

  /// custom margin on vertical stepper.
  final EdgeInsetsGeometry? margin;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> with TickerProviderStateMixin {
  late List<GlobalKey> _keys;
  final Map<int, StepState> _oldStates = <int, StepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
          (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1) {
      _oldStates[i] = widget.steps[i].state;
    }
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1) {
      _oldStates[i] = oldWidget.steps[i].state;
    }
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Widget _buildLine(bool visible) {
    return const DottedLine(
      lineThickness: 2,
      dashLength: 5,
      dashGapLength: 1.5,
      dashColor: Color(0xFF1F2032),
      dashRadius: 20,
    );
  }

  Widget _buildCircle(int index, bool oldState) {
    return SizedBox(
      width: 48,
      height: 48,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(4),
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: const BoxDecoration(
          gradient:  RadialGradient(
            colors: [
              Color(0xFF17C4E7),
              Color(0xFF952EF1),
            ]
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black
          ),
          child: Center(
            child: Text(
                (index + 1).toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.21
                ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildCircle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == StepState.error ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
        return _buildCircle(index, false);
    }
  }

  Widget _buildVerticalControls(int stepIndex) {
    if (widget.controlsBuilder != null) {
      return widget.controlsBuilder!(
        context,
        ControlsDetails(
          currentStep: widget.currentStep,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel,
          stepIndex: stepIndex,
        ),
      );
    }

    return Container();
  }

  Widget _buildHorizontal() {
    final List<Widget> children = <Widget>[
      for (int i = 0; i < widget.steps.length; i += 1) ...<Widget>[
        InkResponse(
          onTap: widget.steps[i].state != StepState.disabled ? () {
            widget.onStepTapped?.call(i);
          } : null,
          canRequestFocus: widget.steps[i].state != StepState.disabled,
          child: Opacity(
              opacity: _isCurrent(i) ? 1: 0.4,
              child: _buildIcon(i)
          ),
        ),
        if (!_isLast(i))
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                child: _buildLine(true)
            )
          )
      ],
    ];

    final List<Widget> stepPanels = <Widget>[];
    for (int i = 0; i < widget.steps.length; i += 1) {
      stepPanels.add(
        Visibility(
          maintainState: true,
          visible: i == widget.currentStep,
          child: widget.steps[i].content,
        ),
      );
    }

    return Column(
      children: <Widget>[
        Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: children,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: widget.physics,
            children: <Widget>[
              _buildVerticalControls(widget.currentStep),
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: stepPanels),
              ),
              //_buildVerticalControls(widget.currentStep),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<Stepper>() != null) {
        throw FlutterError(
          'Steppers must not be nested.\n'
              'The material specification advises that one should avoid embedding '
              'steppers within steppers. '
              'https://material.io/archive/guidelines/components/steppers.html#steppers-usage',
        );
      }
      return true;
    }());
        return _buildHorizontal();
  }
}