<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply5.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address</li>
                    <li>Supporting You</li>
                    <li>Contact Information</li>
                    <li><strong>Education</strong></li>
                    <li>Data Protection</li>
                    </ol>

<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Course Name">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="SiteDescription" HeaderText="Site" />
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="false">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
        </Columns>
        <RowStyle CssClass="searchgridcell" />
        <HeaderStyle CssClass="searchgridheader" />
        <EmptyDataTemplate>
            <p>
                No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.
            </p>
        </EmptyDataTemplate>
    </asp:GridView>
</div>




<div class="form-field-section grey">

    <br />
    <br />
    <h2 class="app-title">Education</h2>

    <cc1:StudentEnrolmentField ID="StudentEnrolmentField37" runat="server" CustomCaption="What is your highest level of Qualification?"
        IsRequired="True" LabelWidth="300" StudentEnrolmentFieldType="PriorAttainmentLevelID"></cc1:StudentEnrolmentField>
    
            <span id="showItem"><a class="btn btn-primary" role="button">Unsure? Click me to help you decide</a></span>
<br />

<div id="priorDiv">
    <p>
        Use the following table to help you pick the correct qualification level...
    </p>
    <table class="table table-striped table-bordered">
        <tr class="active">
            <th>Level</th>
            <th>Academic Qualification Equivalent<div style="float:right" ><span id="hideItem"><a class="btn btn-secondary" role="button">Hide table</a></span></div></th>
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

     <span id="hideItem2"><a class="btn btn-secondary" role="button">Hide table</a></span>
</div>
    <br />

    <br />
    <br />
    <p>Please check you meet the entry requirements for the course for which you are applying.</p>

<p>All applications are shortlisted based on the information you provide in this section.</p>
    <p><b>We need your expected or achieved qualifications to make sure you are applying for the right course. Please include information on all qualifications studied i.e. GCSE, BTEC diplomas, A-levels, NVQs. If you haven’t yet taken your exams, please provide your predicted grades.</b></p>


    <p class="textfieldlabelrequired">Entering Maths & English Qualifications is mandatory </p>
    <br />
    <div class="container">
  <div class="row">
      <div class="col-sm-4 columns form-group">
           <cc1:StudentEnrolmentField id="fldGCSEEng" runat="server" customcaption="* Type of English qualification" CustomFieldType="Lookup" isrequired="true" labelwidth="300" StudentEnrolmentFieldType="ApplicationUserDefined26"></cc1:StudentEnrolmentField>
          </div>
       <div class="col-sm-4 columns form-group">
           <cc1:StudentEnrolmentField id="fldGCSEMat" runat="server" customcaption="* English Grade" CustomFieldType="Lookup" isrequired="true" labelwidth="300" StudentEnrolmentFieldType="ApplicationUserDefined27"></cc1:StudentEnrolmentField>
          </div>
   </div>
   <div class="row">
      <div class="col-sm-4 columns form-group">
           <cc1:StudentEnrolmentField id="StudentEnrolmentField1" runat="server" customcaption="* Type of Maths qualification" CustomFieldType="Lookup" isrequired="true" labelwidth="300" StudentEnrolmentFieldType="ApplicationUserDefined28"></cc1:StudentEnrolmentField>
          </div>
       <div class="col-sm-4 columns form-group">
           <cc1:StudentEnrolmentField id="StudentEnrolmentField2" runat="server" customcaption="* Maths grade" CustomFieldType="Lookup" isrequired="true" labelwidth="300" StudentEnrolmentFieldType="ApplicationUserDefined29"></cc1:StudentEnrolmentField>
          </div>

    </div>
</div>

    <p>If you have no qualifications, then please press 'No prior qualifications'. Use 'Add row' to save and add multiple qualifications. </p>

    <br />

      
       <asp:button runat="server" id="btnNoPriorQualifications" CssClass="button" text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
<br />
    <div id="slidingdiv" class="slidingDiv" runat="server">
<asp:table class="table table-striped text-center" id="tblQuals" runat="server">
<%--<tr><th>Qualification</th><th>Subject (if not in list)</th><th>Predicted Grade</th><th>Grade</th><th>Date Awarded</th></tr>--%>

</asp:table>
    <asp:button runat="server" id="btnAdd" CssClass="button" text="Add Row"></asp:button>

    
    </div>

    <br />

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined3" ID="fldSchoolID" runat="server"  IsRequired="false" LabelWidth="400" CustomCaption="Name of current school / college / employer" />
    </div>


  
        <span class="textfieldlabelrequired1">If an interview is required as part of your application would you prefer</span>   
    <asp:DropDownList ID="rdoInterviewPref" runat="server" EnableViewState="true" ClientIDMode="Static">
          <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
         <asp:ListItem Value="Telephone" Text="Telephone"></asp:ListItem>
         <asp:ListItem Value="Face to Face" Text="Face to Face"></asp:ListItem>
         <asp:ListItem Value="Either" Text="Either"></asp:ListItem>    
    </asp:DropDownList>

    <hr />
    <br />



    
</div>

<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />


<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />



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
    













