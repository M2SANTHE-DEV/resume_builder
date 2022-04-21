import 'package:build_resume/utils/models.dart';
class Constants {

  static const List<RadioModel> companyDetails = [
    RadioModel('Yes', 'YES'),
    RadioModel('No', 'NO')
  ];

  static const List<RadioModel> projectStatus = [
    RadioModel('In Progress', 'INPROGRESS'),
    RadioModel('Finished', 'FINISHED')
  ];

  static const List<RadioModel> gender = [
    RadioModel('Male', 'Male'),
    RadioModel('Female', 'Female'),
    RadioModel('Other', 'Other')
  ];
}