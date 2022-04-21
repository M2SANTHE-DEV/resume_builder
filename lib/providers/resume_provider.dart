import 'package:build_resume/utils/constants.dart';
import 'package:build_resume/utils/global_variable.dart';
import 'package:build_resume/utils/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResumeProvider extends ChangeNotifier {

  List<EmploymentDetails> employmentDetails = [];

  List<EducationDetails> educationDetails = [];

  List<ProjectDetails> projectDetails = [];

  String gender = Constants.gender.first.value;

  var resumeHeadlineController = TextEditingController();
  var keySkillsController = TextEditingController();
  var profileSummeryController = TextEditingController();
  var dobController = TextEditingController();
  var permanentAddressController = TextEditingController();
  var hometownController = TextEditingController();
  var pincodeController = TextEditingController();
  var martialStatusController = TextEditingController();
  var categoryController = TextEditingController();
  var languageController = TextEditingController();
  var designationController = TextEditingController();
  var organizationController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var salaryController = TextEditingController();
  var skillsController = TextEditingController();
  var jobProfileController = TextEditingController();
  var noticePeriodController = TextEditingController();

  var educationController = TextEditingController();
  var courseController = TextEditingController();
  var specializationController = TextEditingController();
  var universityController = TextEditingController();
  var passingOutYearController = TextEditingController();
  var gradesMarksController = TextEditingController();

  var projectTitleController = TextEditingController();
  var projectEducationEmploymentController = TextEditingController();
  var clientController = TextEditingController();
  var projectStartDateController = TextEditingController();
  var projectEndDateController = TextEditingController();
  var projectDetailsController = TextEditingController();

  void onChangeOfCompanyDetails(String? value, EmploymentDetails companyStatus) {
    companyStatus.currentCompany = value ?? Constants.companyDetails.first.value;
    notifyListeners();
  }

  void onChangeOfProjectStatus(String? value, ProjectDetails projectDetails) {
    projectDetails.projectStatus = value ?? Constants.projectStatus.first.value;
    notifyListeners();
  }

  void onChangeOfGender(String? value) {
    gender = value ?? Constants.projectStatus.first.value;
    notifyListeners();
  }

  void onClickOfAddEmployment(){
    employmentDetails.add(EmploymentDetails());
    notifyListeners();
  }

  void onClickOfAddEducation(){
    educationDetails.add(EducationDetails());
    notifyListeners();
  }


  void onClickOfAddProject(){
    projectDetails.add(ProjectDetails());
    notifyListeners();
  }


  Future<void> selectDateRange(BuildContext context,
      TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate:  DateTime.now());
    if (picked != null) {
      controller.text =
          DateFormat("dd-MMM-yyyy").format(picked).toString();
    }
  }

  clearAllDetails(){
    employmentDetails.clear();
    educationDetails.clear();
    projectDetails.clear();
    resumeHeadlineController.clear();
    keySkillsController.clear();
    dobController.clear();
    permanentAddressController.clear();
    profileSummeryController.clear();
    hometownController.clear();
    pincodeController.clear();
    martialStatusController.clear();
    categoryController.clear();
    languageController.clear();
    gender = Constants.gender.first.value;
  }
}