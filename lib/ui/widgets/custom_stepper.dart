import 'package:deepvr/models/booking_step.dart';
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
  })  : assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  final List<BookingStep> steps;
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

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  late List<GlobalKey> _keys;

  late List<BookingStep> itemsWithEnabledProgressLine;

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    itemsWithEnabledProgressLine = widget.steps.where((step) => step.isHeaderShow).toList();

  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return itemsWithEnabledProgressLine.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
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
          gradient: RadialGradient(colors: [
            Color(0xFF17C4E7),
            Color(0xFF952EF1),
          ]),
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: Center(
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.21),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
      return _buildCircle(index, false);
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
      for (int i = 0; i < itemsWithEnabledProgressLine.length; i += 1) ...<Widget>[
          InkResponse(
            onTap: () =>widget.onStepTapped?.call(i),
            child: Opacity(opacity: _isCurrent(i) ? 1 : 0.4, child: _buildIcon(i)),
          ),
        if (!_isLast(i))
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: _buildLine(true)))
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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (widget.steps[widget.currentStep].isHeaderShow)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: children,
            ),
          ),
        Expanded(
          child: AnimatedSize(
            curve: Curves.fastOutSlowIn,
            duration: kThemeAnimationDuration,
            child: Stack(children: stepPanels),
          ),
        ),
        _buildVerticalControls(widget.currentStep),
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

