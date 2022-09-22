import 'package:deepvr/domain/models/month.dart';
import 'package:deepvr/features/booking/domain/view_models/calendar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'month_item.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    required this.months,
    required this.monthIndex,
    required this.setMonthIndex
  }) : super(key: key);

  Calendar.fromModel({Key? key, required CalendarModel model}):
        months = model.months,
        monthIndex = model.monthIndex,
        setMonthIndex = model.setMonthIndex,
        super(key: key);

  final List<Month> months;
  final void Function(int) setMonthIndex;
  final int monthIndex;

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  VoidCallback? buildNext(CalendarModel model) {
    if (model.mayNext) {
      return () => model.setMonthIndex(model.monthIndex + 1);
    }
    return null;
  }

  VoidCallback? buildPrev(CalendarModel model) {
    if (model.mayBack) {
      return () => model.setMonthIndex(model.monthIndex - 1);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarModel>(
      builder: (_, model, __) => Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 343
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: buildPrev(model),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          Text(
                            model.monthIndex > 0
                                ? widget
                                .months[model.monthIndex - 1].monthName
                                : '',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${widget.months[model.monthIndex].monthName} ${widget.months[model.monthIndex].year} г.',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: buildNext(model),
                      child: Row(
                        children: [
                          Text(
                            model.mayNext
                                ? widget.months[model.monthIndex + 1].monthName
                                : '',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                         // const SizedBox(width: 10),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                         // const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          //Дни недели
          const SizedBox(height: 37),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 343
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  DayOfWeek(dayOfWeek: 'ПН'),
                  DayOfWeek(dayOfWeek: 'ВТ'),
                  DayOfWeek(dayOfWeek: 'СР'),
                  DayOfWeek(dayOfWeek: 'ЧТ'),
                  DayOfWeek(dayOfWeek: 'ПТ'),
                  DayOfWeek(dayOfWeek: 'СБ'),
                  DayOfWeek(dayOfWeek: 'ВС'),
                ]),
          ),
          const SizedBox(height: 36),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 343
            ),
            child: Stack(
              children: [for (int i =0; i < widget.months.length; i++)
                Visibility(
                    visible: i == model.monthIndex,
                    child: MonthItem(month: widget.months[i])
                )],
            ),
          ),
        ],
      ),
    );
  }
}

class DayOfWeek extends StatelessWidget {
  const DayOfWeek({Key? key, required this.dayOfWeek}) : super(key: key);

  final String dayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Text(
      dayOfWeek,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 14,
          color: Color(0xFFABAFE5),
          letterSpacing: 0.34,
          fontWeight: FontWeight.w400),
    );
  }
}
