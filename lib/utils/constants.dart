import 'package:build_resume/utils/models.dart';
class Constants {

  static const List<RadioModel> companyDetails = [
    RadioModel('YES', 'YES'),
    RadioModel('NO', 'NO')
  ];

  static const List<RadioModel> projectStatus = [
    RadioModel('In Progress', 'INPROGRESS'),
    RadioModel('Finished', 'FINISHED')
  ];

  static const List<RadioModel> gender = [
    RadioModel('Male', 'MALE'),
    RadioModel('Female', 'FEMALE'),
    RadioModel('Other', 'Other')
  ];
}