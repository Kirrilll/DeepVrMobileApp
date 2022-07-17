import 'package:deepvr/domain/models/month.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/view_models/calendar_model.dart';
import 'month_item.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
    required this.months
  }) : super(key: key);

  final List<Month> months;


  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final PageController _calendarController = PageController();


  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void Function()? next(CalendarModel model){
    if(model.mayNext){
      return () {
        model.setMonthIndex(model.selectedMonthIndex+1);
        _calendarController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
      };
    }
    return null;
  }

  void Function()? previous(CalendarModel model){
    if(model.mayBack){
      return () {
        model.setMonthIndex(model.selectedMonthIndex-1);
        _calendarController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Consumer<CalendarModel>(
            builder: (_, model, __) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: previous(model),
                            icon: const Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 20,
                              color: Colors.white,
                            )),
                        const SizedBox(width: 10),
                        Text(
                          model.selectedMonthIndex > 0
                              ?widget.months[model.selectedMonthIndex -1].monthName
                              : '',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Text(
                      '${widget.months[model.selectedMonthIndex].monthName} ${widget.months[model.selectedMonthIndex].year} г.',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                      model.mayNext
                              ? widget.months[model.selectedMonthIndex + 1].monthName
                              : '',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                            onPressed: next(model),
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 20,
                              color: Colors.white,
                            )),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ]),
          ),

          //Дни недели
          const SizedBox(height: 37),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
            DayOfWeek(dayOfWeek: 'ПН'),
            DayOfWeek(dayOfWeek: 'ВТ'),
            DayOfWeek(dayOfWeek: 'СР'),
            DayOfWeek(dayOfWeek: 'ЧТ'),
            DayOfWeek(dayOfWeek: 'ПТ'),
            DayOfWeek(dayOfWeek: 'СБ'),
            DayOfWeek(dayOfWeek: 'ВС'),
          ]),
          const SizedBox(height: 36),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _calendarController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.months.length,
              itemBuilder: (context, index)  => MonthItem(month: widget.months[index])
            ),
          ),
        ],
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
