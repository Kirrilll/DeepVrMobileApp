import 'package:deepvr/domain/models/booking_step.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  final EdgeInsetsGeometry? margin;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  late List<GlobalKey> _keys;

  late List<BookingStep> itemsWithEnabledProgressLine;

  final ScrollController _headerProgressBarController = ScrollController();


  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );
    itemsWithEnabledProgressLine = widget.steps.where((step) => step.isHeaderShow).toList();
    WidgetsBinding.instance.addPostFrameCallback((duration) => _onStepContinueAnim(widget.currentStep));
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

  Widget _buildLine() {
    return const DottedLine(
      lineThickness: 2,
      dashLength: 5,
      dashGapLength: 1.5,
      dashColor: Color(0xFF1F2032),
      dashRadius: 20,
    );
  }

  void  _onStepContinueAnim(int stepIndex){
    final offset = (_headerProgressBarController.position.maxScrollExtent / itemsWithEnabledProgressLine.length) * (stepIndex+1);
    _headerProgressBarController.animateTo(offset, duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }

  void Function()? _onStepContinueGenerator(int stepIndex) {
    if(widget.steps.length-1 == stepIndex) {
      return widget.onStepContinue;
    }
    return () {
      _onStepContinueAnim(stepIndex);
      widget.onStepContinue!();
    };
  }

  void Function()? _onStepBackGenerator(int stepIndex){
    if(_isFirst(stepIndex) || widget.steps.length-1 == stepIndex){
      return widget.onStepCancel;
    }
    return () {
      final scrollOffset = _headerProgressBarController.position.maxScrollExtent / itemsWithEnabledProgressLine.length;
      final offset = scrollOffset * stepIndex - scrollOffset;
      _headerProgressBarController.animateTo(offset, duration: const Duration(milliseconds: 100), curve: Curves.ease);
      widget.onStepCancel!();
    };
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
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
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
          onStepContinue: _onStepContinueGenerator(stepIndex),
          onStepCancel: _onStepBackGenerator(stepIndex),
          stepIndex: stepIndex,
        ),
      );
    }

    return Container();
  }

  Widget _buildHorizontal() {
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (widget.steps[widget.currentStep].isHeaderShow)
          SizedBox(
            height: 72,
            child: ListView.separated(
              controller: _headerProgressBarController,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: itemsWithEnabledProgressLine.length,
              itemBuilder: (_, index) => InkResponse(
                onTap: () => widget.onStepTapped?.call(index),
                child: Opacity(
                    opacity: _isCurrent(index) ? 1 : 0.4,
                    child: _buildIcon(index)),
              ),
              separatorBuilder: (_, index) => !_isLast(index)
                  ? Container(
                      width: 18,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Center(
                        child: _buildLine(),
                      ))
                  : const SizedBox(),
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
