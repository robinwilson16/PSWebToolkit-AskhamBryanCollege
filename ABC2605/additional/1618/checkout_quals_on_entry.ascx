<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_quals_on_entry.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li>Further Details</li>
                    <li><Strong>Qualifications</Strong></li>
                    <li>Employment</li>
                    <li>Attachments</li>
                    <li>Photo</li>
                    <li>Declarations</li>
                    </ol>



<div class="form-field-section grey">

 
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
          <h2>Quals on Entry (Prior attainment) </h2>
          </div>
  </div>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:studentenrolmentfield id="fldPriorAttainmentLevelID" runat="server" customcaption="What is the highest level of qualification you already have?" ExcludedIDValues="98" isrequired="true" labelwidth="450" StudentEnrolmentFieldType="PriorAttainmentLevelID"></cc1:studentenrolmentfield>
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

    <br />
 <h4>English and Mathematics</h4>
    
    <p><strong>We MUST</strong> know about your level of English (language and literature) and Mathematics <strong>you already have.</strong></p>
    <p>Please enter the details of your prior qualifications. Use ‘Add row’ to save and add multiple qualifications.</p>
    <br />

    <asp:Button runat="server" ID="btnNoPriorQualifications" CssClass="button button-orange" Text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />
    <div id="slidingdiv" class="slidingDiv" runat="server">

        <asp:Table class="table table-striped text-center" ID="tblQuals" runat="server">
        </asp:Table>
        <br />
    <asp:button runat="server" id="btnAdd" CssClass="button button-orange" text="Add Row"></asp:button>

    </div>

    <br />

       <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger"  />

    <br />

 <h4>Education Details</h4>

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

 <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_enrolments2_1618_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" LinkResource="checkout_employment_1618_aspx" CausesValidation="true" EnableEnterKey="true" />
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











