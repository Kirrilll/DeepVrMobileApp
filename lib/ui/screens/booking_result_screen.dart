import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO нормально хэндлить ошибку

class BookingResultScreen extends StatelessWidget {
  const BookingResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingModel>(
      builder: (_, model, __) => model.mayBook
          ? Builder(
            builder: (context) {
              switch(model.bookingStatus){
                case FetchingState.error:
                  return Center(child: Text(model.errorMessage!));
                case FetchingState.loading:
                  return const Center(child: CircularProgressIndicator());
                default:
                  return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    const SizedBox(height: 43),
                    const Text(
                      'БРОНИРОВАНИЕ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(91),
                          1: FlexColumnWidth()
                        },
                        children: [
                          TableRow(children: [
                            const Text('Зал',
                                style: TextStyle(
                                    fontSize: 24, color: Color(0xFFABAFE5))),
                            Text(model.selectedType!.title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ]),
                          const TableRow(
                              children: [SizedBox(height: 16), SizedBox(height: 16)]),
                          TableRow(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: ImageIcon(
                                AssetImage('assets/icons/nav_games_icon.png'),
                                color: Color(0xFFABAFE5),
                                size: 24,
                              ),
                            ),
                            Text(model.selectedGame!.title,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ]),
                          const TableRow(
                              children: [SizedBox(height: 16), SizedBox(height: 16)]),
                          TableRow(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: ImageIcon(
                                AssetImage('assets/icons/nav_profile_icon.png'),
                                color: Color(0xFFABAFE5),
                                size: 24,
                              ),
                            ),
                            Text(model.guestCount.toString(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ]),
                          const TableRow(
                              children: [SizedBox(height: 16), SizedBox(height: 16)]),
                          TableRow(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: ImageIcon(
                                AssetImage('assets/icons/calendar.png'),
                                color: Color(0xFFABAFE5),
                                size: 24,
                              ),
                            ),
                            Text(
                                model.selectedDate!.date.toString().replaceRange(10,
                                    model.selectedDate!.date.toString().length, ''),
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ]),
                          const TableRow(
                              children: [SizedBox(height: 16), SizedBox(height: 16)]),
                          TableRow(children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: ImageIcon(
                                AssetImage('assets/icons/access_time .png'),
                                color: Color(0xFFABAFE5),
                                size: 24,
                              ),
                            ),
                            Text(model.selectedTime!.time,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(height: 34),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0xFF1F2032)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Стоимость заказа:',
                                style:
                                TextStyle(fontSize: 16, color: Color(0xFFABAFE5)),
                              ),
                              Text(
                                '${model.guestCount! * model.selectedGame!.price} ₽',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16.5),
                            height: 1,
                            color: const Color(0xFF444656),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Итого:',
                                style: TextStyle(fontSize: 24, color: Colors.white),
                              ),
                              Text(
                                '${model.guestCount! * model.selectedGame!.price} ₽',
                                style: const TextStyle(
                                    fontSize: 36, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ]);
              }
            }
          )
          : const SizedBox(),
    );
  }
}

class ResultRow extends StatelessWidget {
  const ResultRow({Key? key, required this.icon, required this.text})
      : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
