import 'package:flutter/material.dart';
import 'package:meeter/Widgets/MeeterAppBar/meeterAppBar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

List<Meeting> meetings;

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width / 100;
    print(w);
    var h = MediaQuery.of(context).size.height / 100;
    print(h);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: h*16.8,
                ),
                Container(
                  height: h*56.1,
                  child: SfCalendar(
                    view: CalendarView.month,
                    dataSource: MeetingDataSource(_getDataSource()),
                    cellBorderColor: Colors.white,
                    headerHeight: 50,
                    onTap: (CalendarTapDetails details) {
                      DateTime date = details.date;
                      dynamic appointments = details.appointments;
                      CalendarElement view = details.targetElement;
                      Meeting app = appointments[0];
                      print(date);
                      print(app.eventName);
                      print(view);
                    },
                    viewHeaderStyle: ViewHeaderStyle(),
                    // mode property
                    monthViewSettings: MonthViewSettings(
                      showAgenda: true,
                      agendaItemHeight: 70,
                      appointmentDisplayCount: 2,
                      showTrailingAndLeadingDates: false,
                      numberOfWeeksInView: 4,
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.indicator,
                    ),
                  ),
                )
              ],
            ),
          ),
          MeeterAppbar(
            title: "Calendar",
            icon: Icons.menu_outlined,
          ),
        ],
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Available From', startTime, endTime, const Color(0xFF0F8644), false));
  meetings.add(Meeting(
      'Available From', startTime, endTime, const Color(0xFF00AEFF), false));
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
