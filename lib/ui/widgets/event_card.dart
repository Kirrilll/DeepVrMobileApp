import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.isWatched,
    required this.title
  }) : super(key: key);

  final bool isWatched;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => InkResponse(
          onTap: () => Navigator.of(context).pushNamed('games/event'),
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://i.pinimg.com/236x/c3/bd/fa/c3bdfa68b3c6fd1ee1e297486eaf226b.jpg'
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
