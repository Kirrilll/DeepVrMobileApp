import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    this.isSelected = false,
    this.action
  }) : super(key: key);

  final bool isSelected;
  final void Function()? action;


  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: 19,
      onTap: action,
      child: AnimatedContainer(
        height: 25,
        width: 25,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).colorScheme.secondaryContainer),
        duration: const Duration(milliseconds: 200),
        child: Center(
          child: isSelected
              ? const Icon(Icons.done, size: 10, color: Colors.white)
              : const SizedBox(),
        ),
      ),
    );
  }
}
