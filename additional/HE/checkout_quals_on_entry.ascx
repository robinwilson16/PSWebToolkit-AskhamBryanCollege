<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_quals_on_entry.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_parent_guardian.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_enrolments2.ascx"><i class="fa-solid fa-clipboard-list"></i> <span class="d-none d-sm-inline">Further Details</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-award"></i> Qualifications on Entry</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 50%">50%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-award"></i> Qualifications on Entry (Prior Attainment)</h4>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:studentenrolmentfield id="fldPriorAttainmentLevelID" runat="server" customcaption="What is the highest level of qualification you already have?" ExcludedIDValues="98" isrequired="true" labelwidth="450" StudentEnrolmentFieldType="PriorAttainmentLevelID" ClientIDMode="Static"></cc1:studentenrolmentfield>
            <asp:CustomValidator ID="fldPriorAttainmentLevelIDValidator" runat="server"></asp:CustomValidator>
        <span id="showItem"><a class="btn btn-primary" role="button">Unsure? Click me to help you decide</a></span>
            </div>
    </div>  

       <div id="priorDiv">
               <p>
        Use the following table to help you pick the correct qualification level...
    </p>
    <table class="table table-striped table-bordered">
          <tr class="active"><th>Level</th><th>Academic Qualification Equivalent<div style="float:right" ><span id="hideItem"><a class="btn btn-secondary" role="button">Hide table</a></span></div></th></tr>
           
            <tr>
                <td>Entry Level</td>
                <td>first certificate
GCSE - grades 3, 2, 1 or grades D, E, F, G
level 1 award
level 1 certificate
level 1 diploma
level 1 ESOL
level 1 essential skills
level 1 functional skills
level 1 national vocational qualification (NVQ)
music grades 1, 2 and 3</td>
            </tr>
        <tr>
            <td>Level 1</td>
            <td>For example, GCSE grades 1-3/F-D, First certificate, Level 1 Award/Certificate/Diploma, Functional Skill Level 1
            </td>

        </tr>
        <tr>
            <td>Full Level 2</td>
            <td>GCSE/O Level (5 or more GCSEs grades A*-C),
GCSE (9-1) (5 or more GCSEs grade 4 or above),
2 or 3 AS Levels (for AS qualifications regulated before 1 September 2015),
CSE Grade 1 (5 or more),
1 A Level,
Higher 14-19 Diploma,
QCF Diploma level 2,
QCF Certificate level 2 at 13 or 14 credits undertaken before 2014 to 2015,
Level 2 Principal Learning,
NVQ level 2,
GNVQ Intermediate,
            </td>

        </tr>
        <tr>
            <td>Full Level 3</td>
            <td>A Levels (2 or more advanced level passes),
4 or more AS Levels (for AS qualifications regulated before 1 September 2015),
QCF Diploma Level 3,
QAA Access to HE,
Advanced 14-19 Diploma,
GNVQ Advanced,
NVQ level 3,
AVCE double award,
Tech Levels which are in the 16-19 Performance Tables,
Applied Generals which are in the 16-19 Performance Tables (from 1 August
2015),
QCF Certificate at Level 3 which is 30 to 36 credits</td>

        </tr>
        <tr>
            <td>Level 4</td>
            <td>For example, Certificate of Higher Education, Higher Apprenticeship, HNC</td>

        </tr>
        <tr>
            <td>Level 5</td>
            <td>For example, Diploma of Higher Education, Foundation Degree, HND
            </td>

        </tr>
        <tr>

            <td>Level 6
            </td>
            <td>For example, Degree Apprenticeship, Honours Degree
            </td>


        </tr>
        <tr>
            <td>Level 7
            </td>
            <td>For example, Masters level degree, PgDip

            </td>

        </tr>
        <tr>
            <td>Level 8
            </td>
            <td>For example, Doctorate/PhD

            </td>


        </tr>
    </table>

</div>

    <br />

    <hr />

 <h5>English and Mathematics</h5>
    
    <p><strong>We MUST</strong> know about your level of English (language and literature) Mathematics and Science <strong>you already have.</strong></p>
    <p>Please enter the details of your prior qualifications. Use ‘Add row’ to save and add multiple qualifications.</p>
    <br />

    <asp:Button runat="server" ID="btnNoEnglishandMaths" CssClass="show_hide btn btn-primary" Text="No English Maths and Science qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />
    <div id="slidingdiv" class="slidingDiv" runat="server">

        <%--<asp:Table class="table table-striped text-center" ID="tblQuals" runat="server">
        </asp:Table>
        <br />
    <asp:button runat="server" id="btnAdd" CssClass="button button-orange" text="Add Row"></asp:button>--%>

    <div class="row" runat="server" id="QOEs">

    </div>

    <asp:button runat="server" id="btnAdd" cssClass="btn btn-success" text="Add Row" CausesValidation="false"></asp:button>

    </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-school"></i> Education Details</h4>

    <p>Please only complete if aged under 19</p>

   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined12" ID="txtSchoolAT16" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Name of school attended at age 16" />
           </div>
   

   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined13" ID="txtSchoolTownCity" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="School Town/City" />
           </div>
        </div>
    </div>

      <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudyElsewhere" ID="fldStudyElse" runat="server" Visible="true" LabelWidth="400" IsRequired="false"  CustomCaption="Were you in full-time education or training prior to enrolment?"/>
          </div>
   </div>

    
</div>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger"  />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="checkout_enrolments2_HE_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" LinkResource="checkout_attachments_HE_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<%-- <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_enrolments2_HE_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" LinkResource="checkout_attachments_HE_aspx" CausesValidation="true" EnableEnterKey="true" />--%>
<br />

    
        <asp:HiddenField  id="NoQuals" value="false" runat="server"  ClientIDMode="static" />
     <asp:HiddenField  id="intQualRows" value="0" runat="server"  ClientIDMode="static" />
    

<script type="text/javascript">
     var divToHide = $('div#priorDiv');
     var hideBtn = $('span#hideItem');
     var hideBtn2 = $('span#hideItem2');
     var showBtn = $('span#showItem');

     showBtn.click(function () {
         divToHide.show();
     });

     hideBtn.click(function () {
         divToHide.hide();
     });

     hideBtn2.click(function () {
         divToHide.hide();
     });

     $(document).ready(function () {
         //alert();
         divToHide.hide();
   <%--          $("#divYourQuals").hide();
           $('#<%= fldPriorAttainmentLevelID.ClientID %>').change(function () {
                if ($("#<%=fldPriorAttainmentLevelID.ClientID%>").val() == "99") {
                    $("#divYourQuals").hide();
                    return;
                }
                else {
                   $("#divYourQuals").show();
                }
            });--%>

        });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldPriorAttainmentLevelIDInputBox = addSearchableDropDown(cboPriorAttainmentLevelID);

        //QOE Area
        let selectBoxes = document.querySelectorAll(`#aspnetForm select`);

        selectBoxes.forEach(function (select) {
            if (select.name.indexOf(`cboQualID`) >= 0) {
                //Each row containing a QualID field

                let subjectInputBox = addSearchableDropDown(select);
            }
            else if (select.name.indexOf(`cboGrade`) >= 0) {
                //Each row containing a QualID field

                let gradeInputBox = addSearchableDropDown(select);
            };
        });
    });
</script>

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
                let gradeFieldNum = parseInt(subjectFieldNum) + 4 //Was 6

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

                //let predictedGradeInputBox = addSearchableDropDown(predictedGradeDropDown);
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
                        //predictedGradeDropDown.innerHTML = gradeGCSEDropDown.innerHTML;
                    }
                    else {
                        gradeDropDown.innerHTML = gradeAllDropDown.innerHTML;
                        //predictedGradeDropDown.innerHTML = gradeAllDropDown.innerHTML;
                    }
                    gradeDropDown.selectedIndex = 0;
                    //predictedGradeDropDown.selectedIndex = 0;
                });
            }
        });
    });
</script>