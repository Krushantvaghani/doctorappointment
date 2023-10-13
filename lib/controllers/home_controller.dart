import 'package:doctorappointment/config.dart';
import 'package:doctorappointment/models/doctor_class.dart';
import 'package:doctorappointment/models/time_slot_class.dart';

class HomeController extends GetxController {
  bool isSlotSelected = false;

  final doctorList = <Doctor>[
    Doctor(id: 1, name: 'Dr.Smith Mathew', profession: 'Cardiologist', rating: 4.5),
    Doctor(id: 2, name: 'Dr.Jane cooper', profession: 'Dentist', rating: 4.3),
    Doctor(id: 3, name: 'Dr.Merry An', profession: 'Surgeon', rating: 4.1),
    Doctor(id: 4, name: 'Dr.John Walton', profession: 'Pathologist', rating: 4.6),
    Doctor(id: 5, name: 'Dr.Harry Samit', profession: 'Radiology', rating: 4.8),
    Doctor(id: 6, name: 'Dr.Jane cooper', profession: 'Dentist', rating: 4.5),
  ].obs;

  void slotSelected() {
    isSlotSelected = !isSlotSelected;
    update();
  }

  void navigationBookingHistory() {
    Get.toNamed(routeName.history);
  }

  List<TimeSlotData> timeSlots = [
    TimeSlotData('9:00', '9:30', false),
    TimeSlotData('9:30', '10:00', true),
    TimeSlotData('10:00', '10:30', false),
    TimeSlotData('10:30', '11:00', false),
    TimeSlotData('11:00', '11:30', false),
    TimeSlotData('11:30', '12:00', false),
    TimeSlotData('12:00', '12:30', false),
    TimeSlotData('12:30', '13:00', false),
  ];
}
