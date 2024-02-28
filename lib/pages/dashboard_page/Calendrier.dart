import 'package:flutter/material.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendrier extends StatefulWidget {
  const Calendrier({super.key});

  @override
  State<Calendrier> createState() => _CalendrierState();
}

class _CalendrierState extends State<Calendrier> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: DashboardController.to.selectedIndex.value == 13,
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Calendrier',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xffBFD6FF),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Calendrier',
                  style: kBold,
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  width: double.infinity,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Color(0xff30144c),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kStrokeColor,
                      width: 2,
                    ),
                  ),
                  child: SfCalendar(
                    headerHeight: 50,
                    showNavigationArrow: true,
                    showDatePickerButton: true,
                    showTodayButton: false,
                    allowViewNavigation: true,
                    showCurrentTimeIndicator: true,
                    view: CalendarView.month,
                    initialSelectedDate:
                        DateTime.now().subtract(Duration(days: 3)),
                    todayHighlightColor: Colors.orange,
                    headerStyle: CalendarHeaderStyle(
                      textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Color(0xff30144c),
                      textAlign: TextAlign.center,
                    ),
                    monthViewSettings: MonthViewSettings(
                      monthCellStyle: MonthCellStyle(
                          leadingDatesTextStyle:
                              TextStyle(color: Colors.white70),
                          trailingDatesTextStyle:
                              TextStyle(color: Colors.white70),
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      showAgenda: true,
                      dayFormat: 'EEE',
                      agendaStyle: AgendaStyle(
                        backgroundColor: Color(0xff30144c),
                        dateTextStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        dayTextStyle: TextStyle(
                          color: Colors.amber,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    cellEndPadding: 5,
                    selectionDecoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      color: Colors.blue.withOpacity(0.2),
                    ),
                    timeRegionBuilder:
                        (BuildContext context, TimeRegionDetails details) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            shape: BoxShape.rectangle),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
