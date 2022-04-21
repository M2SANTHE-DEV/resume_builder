import 'package:build_resume/utils/labels.dart';
import 'package:build_resume/utils/models.dart';
import 'package:build_resume/utils/routes.dart';
import 'package:build_resume/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/resume_provider.dart';
import '../utils/constants.dart';

class PreviewDetails extends StatefulWidget {
  const PreviewDetails({Key? key}) : super(key: key);

  @override
  _PreviewDetailsState createState() => _PreviewDetailsState();
}

class _PreviewDetailsState extends State<PreviewDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () => Navigator.pop(context),
          tooltip: 'Increment',
          child: const Icon(Icons.edit_outlined),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.white,
          backgroundColor: Colors.black,
          title: Text(Labels.previewResumeDetails,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                  color: Colors.white, fontSizeDelta: 8, fontWeightDelta: 1)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody(){

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(14.0),
            width: MediaQuery.of(context).size.width/1.05,
            child: Wrap(
              spacing: 20,
              direction: Axis.vertical,
              children: [
                _buildHeadLine(),
                _buildKeySkills(),
                _buildEmployment(),
                _buildEducation(),
                _buildProjects(),
                _buildProfileSummary(),
                _buildPersonalDetails(),
                _buildSubmitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadLine(){

    return Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
        CommonWidget().buildHeaderText(Labels.resumeHeadLine),
        CommonWidget().buildLabelText(Provider.of<ResumeProvider>(context, listen: false).resumeHeadlineController.text, fontColor: Colors.grey[600]),
      ],
    );
  }

  Widget _buildKeySkills(){

    return Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
        CommonWidget().buildHeaderText(Labels.keySkills),
        CommonWidget().buildLabelText(Provider.of<ResumeProvider>(context, listen: false).keySkillsController.text, fontColor: Colors.grey[600]),
      ],
    );
  }

  Widget _buildEmployment() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        CommonWidget().buildHeaderText(Labels.employment),
        Consumer<ResumeProvider>(builder: (_, provider, child) =>
            Wrap(
                direction: Axis.vertical,
                spacing: 23,
                children: [
                  ...List.generate(provider.employmentDetails.length,
                          (index) => _buildEachEmploymentDetail(index, provider.employmentDetails)),
                ])),
      ]
      ,
    );
  }

  Widget _buildProjects() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        CommonWidget().buildHeaderText(Labels.projects),
        Consumer<ResumeProvider>(builder: (_, provider, child) =>
            Wrap(
                direction: Axis.vertical,
                spacing: 23,
                children: [
                  ...List.generate(provider.projectDetails.length,
                          (index) => _buildEachProjectDetail(index, provider.projectDetails)),
                ])),
      ]
      ,
    );
  }

  Widget _buildProfileSummary() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        CommonWidget().buildHeaderText(Labels.profileSummery),
        _buildLabelWidget(Provider.of<ResumeProvider>(context, listen: false).profileSummeryController.text),
      ]
      ,
    );
  }

  Widget _buildPersonalDetails() {
    var provider = Provider.of<ResumeProvider>(context, listen: false);
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        CommonWidget().buildHeaderText(Labels.personalDetails),
        _buildLabelAndTextWidget(Labels.dob,provider.dobController.text),
        _buildLabelAndTextWidget(Labels.gender,provider.gender),
        _buildLabelAndTextWidget(Labels.permanentAddress,provider.permanentAddressController.text),
        _buildLabelAndTextWidget(Labels.hometown,provider.hometownController.text),
        _buildLabelAndTextWidget(Labels.pincode,provider.pincodeController.text),
        _buildLabelAndTextWidget(Labels.martialStatus,provider.martialStatusController.text),
        _buildLabelAndTextWidget(Labels.category,provider.categoryController.text),
        _buildLabelAndTextWidget(Labels.language,provider.languageController.text),
      ]
      ,
    );
  }



  Widget _buildEducation() {
    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        CommonWidget().buildHeaderText(Labels.education),
        Consumer<ResumeProvider>(builder: (_, provider, child) =>
            Wrap(
                direction: Axis.vertical,
                spacing: 23,
                children: [
                  ...List.generate(provider.educationDetails.length,
                          (index) => _buildEachEducationDetail(index, provider.educationDetails)),
                ])),
      ]
      ,
    );
  }

  Widget _buildEachEducationDetail(int index, List<EducationDetails> educationDetails){

    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        _buildDesignationWidget(educationDetails[index].courseController.text + " - " + educationDetails[index].specializationController.text),
        _buildLabelWidget(educationDetails[index].universityController.text),
        _buildLabelWidget(educationDetails[index].passingOutYearController.text),
      ],
    );
  }


  Widget _buildEachEmploymentDetail(int index, List<EmploymentDetails> employmentDetails){

    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        _buildDesignationWidget(employmentDetails[index].designationController.text),
        _buildLabelWidget(employmentDetails[index].organizationController.text),
        _buildPeriodWidget(employmentDetails[index].startDateController.text,
            employmentDetails[index].endDateController.text, employmentDetails[index].currentCompany == Constants.companyDetails.first.value),
        _buildLabelWidget(employmentDetails[index].skillsController.text),
        _buildLabelWidget(employmentDetails[index].jobProfileController.text),
        _buildLabelWidget("Available to join in " + employmentDetails[index].noticePeriodController.text + " Days or less"),
      ],
    );
  }

  Widget _buildEachProjectDetail(int index, List<ProjectDetails> projectDetails){

    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      children: [
        _buildDesignationWidget(projectDetails[index].projectTitleController.text),
        _buildLabelWidget("Project is " + projectDetails[index].projectStatus.toLowerCase()),
        _buildPeriodWidget(projectDetails[index].projectStartDateController.text,
            projectDetails[index].projectEndDateController.text, projectDetails[index].projectStatus == Constants.projectStatus.first.value),
        _buildLabelWidget(projectDetails[index].clientController.text),
        _buildLabelWidget(projectDetails[index].projectDetailsController.text),
      ],
    );
  }


  Widget _buildPeriodWidget(String startDate, String endDate, bool status){

    return Container(
      child: RichText(
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: startDate, style: const TextStyle(color: Colors.black)),
                const TextSpan(text: " to ", style: const TextStyle(color: Colors.black)),
                status ?
                const TextSpan(text: "Present", style: TextStyle(color: Colors.black)) : TextSpan(text: endDate, style: const TextStyle(color: Colors.black)),
              ])),
    );
  }
  Widget _buildDesignationWidget(String label){
    return Container(
        width: MediaQuery.of(context).size.width/1.2,
        child: Text(label, style: Theme.of(context).primaryTextTheme.subtitle1?.apply(color: Colors.black87,fontSizeDelta: 3, fontWeightDelta: 2),));
  }

  Widget _buildLabelWidget(String label){
    return Container(
        width: MediaQuery.of(context).size.width/1.2,
        child: Text(label,style: Theme.of(context).primaryTextTheme.subtitle1?.apply(color: Colors.grey[600],fontSizeDelta: 2,)));
  }

  Widget _buildLabelAndTextWidget(String label, String text){
    return Wrap(
      direction: Axis.vertical,
      spacing: 8,
      children: [
        CommonWidget().buildLabelText(label, fontColor: Colors.black87),
        _buildLabelWidget(text)
      ],
    );
  }

  _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width/1.2,
        child: Center(
          child: Center(child: OutlinedButton(
              onPressed: () {
            CommonWidget().successDialogBox(context);
          },
              child: Text(Labels.submit.toUpperCase()))),
        ),
      ),
    );
  }

}
