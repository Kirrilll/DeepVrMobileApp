import 'package:deepvr/domain/models/event.dart';
import 'package:deepvr/features/games/ui/screens/event_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.isWatched,
    required this.title,
    required this.avatarUrl,
    required this.pages
  }) : super(key: key);

  factory EventCard.fromModel(Event event) => EventCard(
      isWatched: event.isWatched,
      title: event.title,
      avatarUrl: event.avatar,
      pages: event.pages,
  );

  final bool isWatched;
  final String title;
  final String avatarUrl;
  final List<String> pages;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => InkResponse(
          onTap:  () => showDialog(
              context: context,
              builder: (_) => EventScreen(pages: pages,)
          ),
          child: SizedBox.square(
              dimension: constraints.maxHeight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      gradient: !isWatched
                          ? const LinearGradient(colors: [
                              Color(0xFF36C0E7),
                              Color(0xFF4B51EA),
                              Color(0xFF4B51EA)
                            ])
                          : null,
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:  BorderRadius.all(Radius.circular(15))
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      clipBehavior: Clip.antiAlias,
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            avatarUrl
                          )
                        )
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ),
        )
    );
  }
}
