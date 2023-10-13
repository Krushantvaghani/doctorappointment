import 'dart:math';
import 'package:doctorappointment/config.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimeDialogBox extends StatefulWidget {
  const DateTimeDialogBox({super.key});

  @override
  State<DateTimeDialogBox> createState() => _DateTimeDialogBoxState();
}

class _DateTimeDialogBoxState extends State<DateTimeDialogBox> {
  final Color monthCellBackground = const Color(0xfff7f4ff);
  final Color indicatorColor = const Color(0xFF1AC4C7);
  final Color highlightColor = Colors.deepPurpleAccent;
  final Color cellTextColor = const Color(0xFF130438);

  late List<DateTime> _specialDates;

  @override
  void initState() {
    _specialDates = _getSpecialDates();
    super.initState();
  }

  List<DateTime> _getSpecialDates() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime startDate = DateTime.now().subtract(const Duration(days: 200));
    final DateTime endDate = DateTime.now().add(const Duration(days: 500));
    final Random random = Random();
    for (DateTime date = startDate; date.isBefore(endDate); date = date.add(const Duration(days: 25))) {
      for (int i = 0; i < 3; i++) {
        dates.add(date.add(Duration(days: random.nextInt(i + 4))));
      }
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
      insetPadding: EdgeInsets.all(15),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appCtrl.appTheme.white,
      ),
      height: MediaQuery.of(context).size.height / 2,
      child: SfDateRangePicker(
        selectionShape: DateRangePickerSelectionShape.circle,
        selectionColor: appCtrl.appTheme.primary,
        selectionTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        minDate: DateTime.now().add(const Duration(days: -200)),
        maxDate: DateTime.now().add(const Duration(days: 500)),
        headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontSize: 18,
              color: cellTextColor,
            )),
        monthCellStyle: DateRangePickerMonthCellStyle(
            cellDecoration: _MonthCellDecoration(
                borderColor: null,
                backgroundColor: monthCellBackground,
                showIndicator: false,
                indicatorColor: indicatorColor),
            todayCellDecoration: _MonthCellDecoration(
                borderColor: highlightColor,
                backgroundColor: monthCellBackground,
                showIndicator: false,
                indicatorColor: indicatorColor),
            specialDatesDecoration: _MonthCellDecoration(
                borderColor: null,
                backgroundColor: monthCellBackground,
                showIndicator: true,
                indicatorColor: indicatorColor),
            disabledDatesTextStyle: TextStyle(
              color: const Color(0xffe2d7fe),
            ),
            weekendTextStyle: TextStyle(
              color: highlightColor,
            ),
            textStyle: TextStyle(color: cellTextColor, fontSize: 14),
            specialDatesTextStyle: TextStyle(color: cellTextColor, fontSize: 14),
            todayTextStyle: TextStyle(color: highlightColor, fontSize: 14)),
        yearCellStyle: DateRangePickerYearCellStyle(
          todayTextStyle: TextStyle(color: highlightColor, fontSize: 14),
          textStyle: TextStyle(color: cellTextColor, fontSize: 14),
          disabledDatesTextStyle: TextStyle(color: const Color(0xffe2d7fe)),
          leadingDatesTextStyle: TextStyle(color: cellTextColor.withOpacity(0.5), fontSize: 14),
        ),
        showNavigationArrow: true,
        todayHighlightColor: highlightColor,
        monthViewSettings: DateRangePickerMonthViewSettings(
          firstDayOfWeek: 1,
          viewHeaderStyle: DateRangePickerViewHeaderStyle(
              textStyle: TextStyle(fontSize: 10, color: cellTextColor, fontWeight: FontWeight.w600)),
          dayFormat: 'EEE',
          showTrailingAndLeadingDates: false,
          specialDates: _specialDates,
        ),
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          Navigator.pop(context); // Close the dialog when a date is selected
        },
      ),
    );
  }
}

class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration(
      {this.borderColor, this.backgroundColor, required this.showIndicator, this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        showIndicator: showIndicator,
        indicatorColor: indicatorColor);
  }
}

class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor, this.backgroundColor, required this.showIndicator, this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    // canvas.drawRRect(RRect.fromRectAndRadius(bounds, const Radius.circular(15)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
  }
}
