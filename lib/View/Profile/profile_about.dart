/*import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:meeter/Widgets/TextWidgets/poppins_text.dart';
import 'package:readmore/readmore.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ProfileAbout extends StatefulWidget {
  @override
  _ProfileAboutState createState() => _ProfileAboutState();
}

List<Meeting> meetings;

class _ProfileAboutState extends State<ProfileAbout> {
  final controller = PageController();

  bool about = true;

  bool service = false;

  bool review = false;

  bool avail = false;

  DateTime selectedDate = DateTime.now();
  List<DateTime> selectedDates = List();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    initializeDateFormatting();
    Intl.systemLocale =
        'en_En'; // to change the calendar format based on localization
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 230,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        child: Container(
                          child: Image.network(
                            "https://image.shutterstock.com/z/stock-photo-silhouette-of-palm-trees-at-sunset-vintage-filter-415974139.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 130.0),
                        child: CircularProfileAvatar(
                          "https://www.unlv.edu/sites/default/files/styles/2000_width/public/releases/main-images/online.jpg",
                          backgroundColor: Colors.black,
                          initialsText: Text(
                            "+",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.w900,
                                fontSize: 21,
                                color: Colors.white),
                          ),
                          cacheImage: true,
                          borderColor: Colors.black,
                          borderWidth: 5,
                          elevation: 10,
                          radius: 50,
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: PoppinsText(
                  text: "Eric Walters",
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xffF5A331),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffF5A331),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffF5A331),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffF5A331),
                    ),
                    Icon(
                      Icons.star_border,
                      color: Color(0xffF5A331),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              PoppinsText(
                text: "Singapore",
                fontSize: 12,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border: about == true
                              ? Border(
                                  bottom: BorderSide(
                                    color: Color(0xff00AEFF),
                                    width: 2,
                                  ),
                                )
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PoppinsText(
                            text: "About",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          about = true;
                          service = false;
                          review = false;
                          avail = false;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border: service == true
                              ? Border(
                                  bottom: BorderSide(
                                    color: Color(0xff00AEFF),
                                    width: 2,
                                  ),
                                )
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PoppinsText(
                            text: "Services ",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          about = false;
                          service = true;
                          review = false;
                          avail = false;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border: review == true
                              ? Border(
                                  bottom: BorderSide(
                                    color: Color(0xff00AEFF),
                                    width: 2,
                                  ),
                                )
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PoppinsText(
                            text: "Reviews ",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          about = false;
                          service = false;
                          review = true;
                          avail = false;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          border: avail == true
                              ? Border(
                                  bottom: BorderSide(
                                    color: Color(0xff00AEFF),
                                    width: 2,
                                  ),
                                )
                              : null,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: PoppinsText(
                            text: "Availability",
                            fontSize: 14,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          about = false;
                          service = false;
                          review = false;
                          avail = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              about == true
                  ? Container(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: PoppinsText(
                                text: "Description",
                                clr: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ReadMoreText(
                              '“Hi I’m an international student living in Singapore for the past 8 years. I’m happy to share my experience Living in Singapore',
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins",
                                  letterSpacing: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 0,
                            color: Color(0xff00AEFF),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: PoppinsText(
                                text: "User Information",
                                clr: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 20.0),
                          //     child: PoppinsText(
                          //       text: "From",
                          //       clr: Colors.grey,
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //   ),
                          // ),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 20.0),
                          //     child: PoppinsText(
                          //       text: "Japan",
                          //       clr: Colors.black,
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Member Since",
                                clr: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "June 2021",
                                clr: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Recent Meeting",
                                clr: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "3 Days ago",
                                clr: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Last Active",
                                clr: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Online",
                                clr: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Divider(
                            thickness: 0,
                            color: Color(0xff00AEFF),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: PoppinsText(
                                text: "Languages",
                                clr: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "English",
                                clr: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Fluent",
                                clr: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Japanese",
                                clr: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: PoppinsText(
                                text: "Native",
                                clr: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              avail == true
                  ? Container(
                      height: 500,
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
                  : Container(),
              avail == true
                  ? SizedBox(
                      height: 50,
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(String x) {
    print(x);
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
}*/
