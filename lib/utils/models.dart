import 'package:build_resume/utils/constants.dart';
import 'package:flutter/material.dart';

class RadioModel {
  final String label;
  final String value;
  const RadioModel(this.label, this.value);
}

class EmploymentDetails {
  var designationController = TextEditingController();
  var organizationController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var salaryController = TextEditingController();
  var skillsController = TextEditingController();
  var jobProfileController = TextEditingController();
  var noticePeriodController = TextEditingController();
  var currentCompany = Constants.companyDetails.first.value;

  EmploymentDetails(this.designationController,this.organizationController,this.startDateController,this.endDateController,
      this.salaryController,this.skillsController,this.jobProfileController,this.noticePeriodController);
}

class EducationDetails {
  var educationController = TextEditingController();
  var courseController = TextEditingController();
  var specializationController = TextEditingController();
  var universityController = TextEditingController();
  var passingOutYearController = TextEditingController();
  var gradesMarksController = TextEditingController();

  EducationDetails(this.educationController,this.universityController,this.gradesMarksController,
      this.courseController,this.specializationController,this.passingOutYearController);
}

class ProjectDetails {
  var projectTitleController = TextEditingController();
  var projectEducationEmploymentController = TextEditingController();
  var clientController = TextEditingController();
  var projectStartDateController = TextEditingController();
  var projectEndDateController = TextEditingController();
  var projectDetailsController = TextEditingController();
  var projectStatus = Constants.projectStatus.first.value;

  ProjectDetails(this.projectTitleController,this.projectEducationEmploymentController,this.clientController,
      this.projectStartDateController,this.projectEndDateController,this.projectDetailsController);
}


