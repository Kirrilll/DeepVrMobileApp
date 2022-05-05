import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectableItem extends StatelessWidget {
  const SelectableItem({Key? key, required this.item, required this.isSelected})
      : super(key: key);

  final Widget item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected ? Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF36C0E7), Color(0xFF4B51EA), Color(0xFF4B51EA)]),
              borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Stack(
        children: [
          item,
          const Align(
            child: SelectedTriangle(),
            alignment: Alignment.centerRight,
          )
        ],
      ),
    ):
    Padding(
        padding: const EdgeInsets.all(2),
      child: item,
    );
  }
}

class SelectedTriangle extends StatelessWidget {
  const SelectedTriangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        alignment: Alignment.topRight,
        height: 45,
        width: 44,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
          color:  Color(0xFF4B51EA),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 4, 5, 0),
          child: const Icon(
              Icons.done,
            size: 20,
          ),
        ),
      ),
      clipper: TriangleClipper(),
    );
  }
}

class TriangleClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

}
