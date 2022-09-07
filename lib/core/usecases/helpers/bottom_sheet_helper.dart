import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:deepvr/features/achievements/ui/widgets/achievements_bottom_modal_builder.dart';
import 'package:flutter/cupertino.dart';

typedef BodyBuilder = SliverChildDelegate Function(BuildContext, double);
typedef HeaderBuilder = Widget Function(BuildContext, double);

class BottomSheetHelper {
  const BottomSheetHelper();

  HeaderBuilder _buildDefaultHeader() =>
      (BuildContext context, double offset) => Container(
            padding: const EdgeInsets.fromLTRB(16, 5, 0, 16),
            child: Center(
              child: Container(
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF444656)),
              ),
            ),
          );

  VoidCallback buildDefaultScrollableBottomSheet(
    BuildContext context,
    List<Widget> content,
  ) =>
      () => showStickyFlexibleBottomSheet(
          decoration: const BoxDecoration(
            color: Color(0xFF1F2032),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          isSafeArea: true,
          anchors: [0, 0.8, 1],
          useRootNavigator: true,
          minHeight: 0.8,
          initHeight: 0.8,
          headerHeight: 36,
          context: context,
          headerBuilder: _buildDefaultHeader(),
          bodyBuilder: (context, offset) => SliverChildListDelegate(
                [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: content)
                  )
                ],
              ));
}
