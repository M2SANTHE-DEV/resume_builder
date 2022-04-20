import 'package:build_resume/providers/resume_provider.dart';
import 'package:build_resume/widget/TextFiledBuilder.dart';
import 'package:build_resume/utils/constants.dart';
import 'package:build_resume/utils/labels.dart';
import 'package:build_resume/utils/models.dart';
import 'package:build_resume/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../utils/routes.dart';

class ResumeDetails extends StatefulWidget {
  const ResumeDetails({Key? key}) : super(key: key);

  @override
  _ResumeDetailsState createState() => _ResumeDetailsState();
}


class _ResumeDetailsState extends State<ResumeDetails> {
  @override
  void initState() {
    var provider = Provider.of<ResumeProvider>(context, listen: false);
    provider.employmentDetails.add(EmploymentDetails());
    provider.educationDetails.add(EducationDetails());
    provider.projectDetails.add(ProjectDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ResumeProvider>(context, listen: false);
    TextStyle? headLineStyling = Theme.of(context).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 6,fontSizeFactor: 1.2, fontWeightDelta: 2);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text(Labels.resumeDetails,
            style: Theme.of(context).textTheme.subtitle2?.apply(
                color: Colors.white, fontSizeDelta: 8, fontWeightDelta: 1)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            runSpacing: 24,
            children: [
              BuildTextField(Labels.resumeHeadLine, provider.resumeHeadlineController,hint: Labels.hintResumeHeadLine, maxLines: 5,applyStyling : headLineStyling),
              BuildTextField(Labels.keySkills, provider.keySkillsController,hint: Labels.type + Labels.keySkills, maxLines: 5,applyStyling : headLineStyling),
              _buildEmployment(),
              _buildEducation(),
              _buildProjectDetails(),
              BuildTextField(Labels.profileSummery, provider.profileSummeryController,hint: Labels.type + Labels.profileSummery,maxLines: 5,applyStyling: Theme.of(context).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 6,fontSizeFactor: 1.2, fontWeightDelta: 2),),
              _buildPersonalDetails(),
              _buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmployment(){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Wrap(
      runSpacing: 14,
      children: [
        CommonWidget().buildHeaderText(Labels.employment),
        _buildEmploymentInputs(),
        getAddButton(Labels.add + Labels.employment.toUpperCase(), provider.onClickOfAddEmployment)
      ],
    );
  }

  Widget _buildPersonalDetails(){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Wrap(
      runSpacing: 14,
      children: [
        CommonWidget().buildHeaderText(Labels.personalDetails),
        BuildTextField(Labels.dob, provider.dobController,hint: Labels.dobFormat,),
        _buildGender(),
        BuildTextField(Labels.permanentAddress, provider.permanentAddressController,hint: Labels.type + Labels.permanentAddress,),
        BuildTextField(Labels.hometown, provider.hometownController,hint: Labels.type + Labels.hometown,),
        BuildTextField(Labels.pincode, provider.pincodeController,hint: Labels.type + Labels.pincode,textInputType: TextInputType.number,),
        BuildTextField(Labels.martialStatus, provider.martialStatusController,hint: Labels.type + Labels.martialStatus,),
        BuildTextField(Labels.category, provider.categoryController,hint: Labels.type + Labels.category,),
        BuildTextField(Labels.language, provider.languageController,hint: Labels.type + Labels.language,),
      ],
    );
  }


  Widget _buildEducation(){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Wrap(
      runSpacing: 14,
      children: [
        CommonWidget().buildHeaderText(Labels.education),
        _buildEducationInputs(),
        getAddButton(Labels.add + Labels.education.toUpperCase(), provider.onClickOfAddEducation)
      ],
    );
  }

  Widget _buildProjectDetails(){
    return Wrap(
      runSpacing: 14,
      children: [
        CommonWidget().buildHeaderText(Labels.projects),
        _buildProjectInputs(),
        getAddButton(Labels.add + Labels.projects.toUpperCase(), Provider.of<ResumeProvider>(context, listen: false).onClickOfAddProject)
      ],
    );
  }



  Widget getAddButton(String label ,Function callBack) {

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommonWidget().buildLabelText(label, fontColor : Colors.blue),
          Container(
            width: 38,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.blue,
                size: 21,
              ),
              onPressed: () => callBack() ,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildEmploymentInputs(){
    return Consumer<ResumeProvider>(builder: (_, provider, child) => Wrap(runSpacing: 12, children: [
      ...List.generate( provider.employmentDetails.length,
              (index) => _buildSingleDetail(index)),
    ]));
  }

  Widget _buildEducationInputs(){
    return Consumer<ResumeProvider>(builder: (_, provider, child) => Wrap(runSpacing: 12, children: [
      ...List.generate( provider.educationDetails.length,
              (index) => _buildSingleEducationDetail(index)),
    ]));
  }

  Widget _buildProjectInputs(){
    return Consumer<ResumeProvider>(builder: (_, provider, child) => Wrap(runSpacing: 12, children: [
      ...List.generate( provider.projectDetails.length,
              (index) => _buildSingleProjectDetail(index)),
    ]));
  }


  Widget _buildSingleEducationDetail(int index){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top :20.0),
      child: Wrap(
        runSpacing: 14,
        children: [
          BuildTextField(Labels.education, provider.educationDetails[index].educationController,hint: Labels.type + Labels.education,),
          BuildTextField(Labels.course, provider.educationDetails[index].courseController,hint: Labels.type + Labels.course,),
          BuildTextField(Labels.specialization, provider.educationDetails[index].specializationController,hint: Labels.type + Labels.specialization,),
          BuildTextField(Labels.university, provider.educationDetails[index].universityController,hint: Labels.type + Labels.university,),
          BuildTextField(Labels.passingYear, provider.educationDetails[index].passingOutYearController,hint:  Labels.type + Labels.passingYear,textInputType: TextInputType.number),
          BuildTextField(Labels.gradings, provider.educationDetails[index].gradesMarksController,hint: Labels.type + Labels.gradings,textInputType: TextInputType.number),
        ],
      ),
    );
  }

  Widget _buildSingleProjectDetail(int index){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top :20.0),
      child: Wrap(
        runSpacing: 14,
        children: [
          BuildTextField(Labels.projectTitle, provider.projectDetails[index].projectTitleController,hint: Labels.type + Labels.projectTitle,),
          BuildTextField(Labels.tagProject, provider.projectDetails[index].projectEducationEmploymentController,hint: Labels.type + Labels.tagProject,),
          BuildTextField(Labels.client, provider.projectDetails[index].clientController,hint: Labels.type + Labels.client,),
          _buildCurrentProjectStatus(provider.projectDetails[index]),
          _buildExperienceDetails(index,projectDetail : provider.projectDetails[index]),
          BuildTextField(Labels.projectDetails, provider.projectDetails[index].projectDetailsController,hint: Labels.type + Labels.projectDetails,textInputType: TextInputType.text, maxLines: 5,),
        ],
      ),
    );
  }


  Widget _buildSingleDetail(int index){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top :20.0),
      child: Wrap(
        runSpacing: 14,
        children: [
          BuildTextField(Labels.designation, provider.employmentDetails[index].designationController,hint: Labels.type + Labels.designation,),
          BuildTextField(Labels.organization, provider.employmentDetails[index].organizationController,hint: Labels.type + Labels.organization,),
          _buildCurrentCompanyDetails(provider.employmentDetails[index]),
          _buildExperienceDetails(index,employmentDetail : provider.employmentDetails[index]),
          BuildTextField(Labels.currentSalary, provider.employmentDetails[index].salaryController,hint: Labels.type + Labels.currentSalary,textInputType: TextInputType.number,),
          BuildTextField(Labels.topSkills, provider.employmentDetails[index].skillsController,hint: Labels.type + Labels.topSkills,),
          BuildTextField(Labels.describe, provider.employmentDetails[index].jobProfileController,hint:  Labels.describe,maxLines: 5,),
          BuildTextField(Labels.noticePeriod, provider.employmentDetails[index].noticePeriodController,hint: Labels.type + Labels.noticePeriod + Labels.inMonths,textInputType: TextInputType.number),
        ],
      ),
    );
  }

  Widget _buildExperienceDetails(int index,
      {EmploymentDetails? employmentDetail, ProjectDetails? projectDetail}){

    var startDateController = TextEditingController();
    var endDateController = TextEditingController();

    if(employmentDetail != null && employmentDetail.currentCompany == Constants.companyDetails.first.value) {
      startDateController = employmentDetail.startDateController;
      endDateController = employmentDetail.endDateController;
      endDateController.text =
          DateFormat("dd-MM-yyyy").format(DateTime.now()).toString();
    }
    if(projectDetail != null && projectDetail.projectStatus == Constants.projectStatus.first.value) {
      startDateController = projectDetail.projectStartDateController;
      endDateController = projectDetail.projectEndDateController;
      endDateController.text =
          DateFormat("dd-MM-yyyy").format(DateTime.now()).toString();
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDateTextField(Labels.startDate,startDateController, index),
          _buildDateTextField(Labels.endDate, endDateController,index, endDate: true, projectDetail: projectDetail)
        ],
      ),
    );
  }

  Widget _buildDateTextField(String label,TextEditingController controller, int index, {bool endDate = false, ProjectDetails? projectDetail}){

    return Consumer<ResumeProvider>(builder: (_, provider, child) => Container(
      padding: const EdgeInsets.only(top : 12.0),
      width: MediaQuery.of(context).size.width/2.2,
      child: InkWell(
        onTap: () => provider.selectDateRange(context, controller),
        child: IgnorePointer(
          ignoring: true,
          child: !endDate || (projectDetail != null ? provider.projectDetails[index].projectStatus != Constants.projectStatus.first.value : provider.employmentDetails[index].currentCompany != Constants.companyDetails.first.value) ? TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: label,
              labelStyle: Theme.of(context).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 2),
              suffixIcon : const Icon(
                Icons.calendar_today,color: Colors.blue,),
            ),
            style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
            controller: controller ,
          ) : TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              labelText: label,
              labelStyle: Theme.of(context).textTheme.subtitle1?.apply(color: Colors.black,fontSizeDelta: 2),
            ),
            style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
            controller: controller ,
          ),
        ),
      ),
    ));
  }

  Widget _buildCurrentCompanyDetails(EmploymentDetails companyStatus){
    return Consumer<ResumeProvider>(builder: (_,provider, child) => Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
        CommonWidget().buildLabelText(Labels.currentCompany),
        _buildRadioButtons(Constants.companyDetails, companyStatus.currentCompany,(val) => provider.onChangeOfCompanyDetails(val, companyStatus))
      ],
    ));
  }

  Widget _buildCurrentProjectStatus(ProjectDetails projectDetail){
    return Consumer<ResumeProvider>(builder: (_,provider, child) => Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
        CommonWidget().buildLabelText(Labels.projectStatus),
        _buildRadioButtons(Constants.projectStatus, projectDetail.projectStatus,(val) => provider.onChangeOfProjectStatus(val, projectDetail))
      ],
    ));
  }

  Widget _buildGender(){
    return Consumer<ResumeProvider>(builder: (_,provider, child) => SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 10,
        direction: Axis.vertical,
        children: [
          CommonWidget().buildLabelText(Labels.gender),
          _buildRadioButtons(Constants.gender, provider.gender,(val) => provider.onChangeOfGender(val))
        ],
      ),
    ));
  }


  Widget _buildRadioButtons(List<RadioModel> radioButtonsList, String groupValue,
      void Function(String? v)? onChanged) {

    return Builder(
      builder: (context) =>
          Wrap(spacing: 10, direction: Axis.horizontal, children: [
            for (var radioButton in radioButtonsList)
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                children: [
                  Container(
                    width: 18,
                    height: 25,
                    child: Radio(
                      value: radioButton.value,
                      groupValue: groupValue,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),
                  ),
                  Text(radioButton.label,
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
          ]),
    );
  }

  _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: OutlinedButton(onPressed: () {
        FocusScope.of(context).unfocus();
        Navigator.pushNamed(
          context,
          Routes.previewDetails,
        );
      }, child: Text(Labels.preview.toUpperCase()))),
    );
  }
}
