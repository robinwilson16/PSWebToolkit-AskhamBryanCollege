<%@ control  Language="VB"  AutoEventWireup="false" CodeFile="checkout_quals_on_entry.ascx.vb" Inherits="checkout_quals_on_entry" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%
'Dim OfferingID As Integer
'If WorkingData.ShoppingCart.Items.Count > 0 Then
'    OfferingID = WorkingData.ShoppingCart.Items(0).OfferingID
'Else
'    OfferingID = 0
'End If
%>

<br />
<br />

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_applications.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/supporting_you.ascx"><i class="fa-solid fa-hand-holding-medical"></i> <span class="d-none d-sm-inline">Supporting You</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_other_contacts.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-award"></i> Qualifications on Entry</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 70%">70%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-award"></i> Qualifications on Entry</h4>
     
   <p>
       If you have not yet taken your exams, please provide us with your predicted grades. 
       Please include information on all qualifications. ie GCSE, NVQs, BTEC, Diplomas, A levels or any other subjects you may have studied. </p> 
    <p>
        Please enter the details of your prior qualifications, choosing from the drop-down lists below.
    </p>

    <asp:button runat="server" id="btnNoPriorQualifications" cssClass="show_hide btn btn-primary" text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
<br />
    <div id="slidingdiv" class="slidingDiv" runat="server">
<%--<asp:table class="table table-striped text-center" id="tblQuals" runat="server">
<tr><th>Qualification</th><th>Subject (if not in list)</th><th>Predicted Grade</th><th>Grade</th><th>Date Awarded</th></tr>

</asp:table>--%>

    <div class="row" runat="server" id="QOEs">

    </div>

    <asp:button runat="server" id="btnAdd" cssClass="btn btn-success" text="Add Row"></asp:button>

    </div>
   
    </div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"  />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" LinkResource="other_contacts_abc" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>
  
<asp:HiddenField  id="NoQuals" value="false" runat="server"  ClientIDMode="static" />
<asp:HiddenField  id="intQualRows" value="0" runat="server"  ClientIDMode="static" />

<select id="GradeList" runat="server" ClientIDMode="Static" hidden>

</select>

<select id="GradeListGCSE" runat="server" ClientIDMode="Static" hidden>

</select>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let gradeAllDropDown = document.getElementById(`GradeList`);
        let gradeGCSEDropDown = document.getElementById(`GradeListGCSE`);

        let selectBoxes = document.querySelectorAll(`#aspnetForm select`);

        let qoeChangeEvent = new Event('change');

        selectBoxes.forEach(function (select) {
            if (select.name.indexOf(`cboQualID`) >= 0) {
                //Get elements
                let subjectDropdown = select.id;
                let subjectFieldNum = subjectDropdown.replace(`ctl00_MainContentPlaceholder_ctl00_ctl`, ``).replace(`_cboQualID`, ``);
                let subjectCustomFieldNum = parseInt(subjectFieldNum) + 2
                let predictedGradeFieldNum = parseInt(subjectFieldNum) + 4
                let gradeFieldNum = parseInt(subjectFieldNum) + 6

                let subjectCustomFieldNumTxt =
                    subjectCustomFieldNum.toLocaleString(
                        `en-GB`,
                        {
                            minimumIntegerDigits: 2,
                            useGrouping: false
                        }
                    );

                let predictedGradeFieldNumTxt =
                    predictedGradeFieldNum.toLocaleString(
                        `en-GB`,
                        {
                            minimumIntegerDigits: 2,
                            useGrouping: false
                        }
                    );

                let gradeFieldNumTxt =
                    gradeFieldNum.toLocaleString(
                        `en-GB`,
                        {
                            minimumIntegerDigits: 2,
                            useGrouping: false
                        }
                    );

                let subjectInputBox = addSearchableDropDown(select);

                let subjectCustomField = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_ctl${subjectCustomFieldNumTxt}_txtSubject`);
                let predictedGradeDropDown = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_ctl${predictedGradeFieldNumTxt}_cboPredictedGrade`);
                let gradeDropDown = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_ctl${gradeFieldNumTxt}_cboGrade`);

                let predictedGradeInputBox = addSearchableDropDown(predictedGradeDropDown);
                let gradeInputBox = addSearchableDropDown(gradeDropDown);

                //If custom field entered then clear original drop-down
                subjectCustomField.addEventListener(`change`, function (event) {
                    select.value = ``;
                    subjectInputBox.value = `-- Please Select --`;

                    //select.dispatchEvent(qoeChangeEvent);
                });

                select.addEventListener(`change`, function (event) {
                    //Clear custom value if one chosen from drop-down
                    subjectCustomField.value = ``;

                    let selectText = select.options[select.selectedIndex].text;

                    if (selectText.indexOf("GCSE") >= 0) {
                        gradeDropDown.innerHTML = gradeGCSEDropDown.innerHTML;
                        predictedGradeDropDown.innerHTML = gradeGCSEDropDown.innerHTML;
                    }
                    else {
                        gradeDropDown.innerHTML = gradeAllDropDown.innerHTML;
                        predictedGradeDropDown.innerHTML = gradeAllDropDown.innerHTML;
                    }
                    gradeDropDown.selectedIndex = 0;
                    predictedGradeDropDown.selectedIndex = 0;
                });
            }
        });
    });
</script>