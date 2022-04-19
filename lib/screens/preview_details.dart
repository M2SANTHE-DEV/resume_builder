import 'package:build_resume/utils/labels.dart';
import 'package:build_resume/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/resume_provider.dart';

class PreviewDetails extends StatefulWidget {
  const PreviewDetails({Key? key}) : super(key: key);

  @override
  _PreviewDetailsState createState() => _PreviewDetailsState();
}

class _PreviewDetailsState extends State<PreviewDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(Labels.previewResumeDetails,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                  color: Colors.black, fontSizeDelta: 8, fontWeightDelta: 1)),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody(){

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Wrap(
        spacing: 20,
        direction: Axis.vertical,
        children: [
          _buildHeadLine(),
          _buildKeySkills()
        ],
      ),
    );
  }

  Widget _buildHeadLine(){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
        CommonWidget().buildHeaderText(Labels.resumeHeadLine),
        CommonWidget().buildLabelText(provider.resumeHeadlineController.text),
      ],
    );
  }

  Widget _buildKeySkills(){
    var provider = Provider.of<ResumeProvider>(context, listen: false);

    return Wrap(
      spacing: 10,
      direction: Axis.vertical,
      children: [
        CommonWidget().buildHeaderText(Labels.keySkills),
        CommonWidget().buildLabelText(provider.keySkillsController.text),
      ],
    );
  }


}
