<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC5.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/checkout_enrolFC.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/checkout_enrolFC2.ascx"><i class="fa-solid fa-address-book"></i> <span class="d-none d-sm-inline">Address</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/checkout_enrolFC3.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/checkout_enrolFC4.ascx"><i class="fa-solid fa-hand-holding-medical"></i> <span class="d-none d-sm-inline">Supporting You</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-award"></i> Education and Employment</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 70%">70%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-graduation-cap"></i> Course Information</h4>

    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="true">
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
    </asp:GridView>--%>

                <div class="container">
            <%For Each crs In tblOffering %>
                <%
'Dim OfferingRow = OfferingDataTable.FetchByOfferingID(crs.OfferingID)
                %>
                <div class="row">
                    <div class="col-md">
                        <div class="card mt-3">
                            <div class="card-body">
                                <h4><i class="fa-solid fa-award"></i> <%=crs.Name%></h4>
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Start Date:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.StartDate)), crs.StartDate.Value.ToString("dd/MM/yyyy"), "")%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>End Date:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.EndDate)), crs.EndDate.Value.ToString("dd/MM/yyyy"), "")%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Course Code:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=crs.Code%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Campus:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=crs.SiteDescription%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Total Fees:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.TotalFeeAmount)), crs.TotalFeeAmount.Value.ToString("C0"), "")%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%Next%>
        </div>
    </div>




<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-award"></i> Education</h4>

    <cc1:StudentEnrolmentField ID="StudentEnrolmentField37" runat="server" CustomCaption="What is the highest level of qualification you already have?"
        IsRequired="True" LabelWidth="500" StudentEnrolmentFieldType="PriorAttainmentLevelID"></cc1:StudentEnrolmentField>

            <span id="showItem"><a class="btn btn-primary" role="button">Unsure? Click me to help you decide</a></span>
<br />

<div id="priorDiv">
    <p>
        Use the following table to help you pick the correct qualification level...
    </p>
    <table class="table table-striped table-bordered">
        <tr class="active">
            <th>Level</th>
            <th>Academic Qualification Equivalent<div style="float:right" ><span id="hideItem"><a class="btn btn-secondary" role="button">Hide table</a></span></div>
</th>

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

        <div class="form-input">
            <span class="textfieldlabelrequired">Were you in full-time education or training prior to enrolment?</span>
            <asp:RadioButtonList runat="server" ID="rdoStillAt">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <div class="displaynone">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsFulltime" ID="fulltime" runat="server" LabelWidth="400" />
        </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-city"></i> Employment</h4>

    <asp:HiddenField runat="server" ID="HiddenFieldForEmploymentvalue" />

        <div class="form-input">
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentStatusID" ID="Field_EmploymentStatusID" runat="server" IsRequired="True" LabelWidth="300"
            CustomCaption="Employment Status" ClientIDMode="Static"
            ExcludedIDValues="98" />
        </div>
    
    <div class="Employedfields" id="Employedfields" runat="server">

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="NINum" runat="server" IsRequired="false" LabelWidth="400" Visible="true"
            CustomCaption="National Insurance (NI) Number" Pattern="^(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]$" Title="Please match requested format (AB123456C) all caps" />
        </div>  

     <%--<div class="form-input">

            <span class="textfieldlabelrequired">Are you self employed?</span>
            <asp:RadioButtonList runat="server" ID="rdoSelfEmp">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
   
      </div>--%>

        <div class="form-input">
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="IsSelfEmployed" ID="chkIsSelfEmployed" runat="server" LabelWidth="400" CustomCaption ="Are you self employed?" />
        </div>



        <%-- <div class="form-input">
         <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="isSelfEmployed" ID="Field_IsSelfEmployed" runat="server" IsRequired="false" LabelWidth="300"
           CustomCaption="Are You Self Employed?" />
    </div>
        --%>

        <%--             <div class="form-input">
                 <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfEmploymentID" ID="Field_LengthOfEmployment" runat="server" IsRequired="false" LabelWidth="300"
                   CustomCaption="Employment Length" />
            </div>--%>

        <div class="form-input">
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentIntensityID" ID="Field_EmploymentIntensityID" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="I work (hours per week)" />
        </div>
        <div class="form-input">
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfEmploymentID" ID="StudentEmploymentHistoryField1" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="I have worked (number of months)" />
        </div>



        <div class="form-input">
          
           <%-- <span class="textfieldlabelrequired">Prior to enrolment I was in full time education.</span>
            <asp:RadioButtonList runat="server" ID="RadioButtonList1">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>--%>
         
        </div>
        <div class="displaynone">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsFulltime" ID="StudentEnrolmentField1" runat="server" LabelWidth="400" />
        </div>
        <%--    <p><i>Please enter the name of your current employer</i></p>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerName" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Name" ClientIDMode="Static" />
        </div>
        <hr />
       
        <div class="form-input">
            <label for="employerpostcode" style="width: 300px; font-weight: normal;">Employer Postcode</label><input type="text" class="form-control" runat="server" id="employerpostcode" title="Postcode" placeholder="Enter Postcode" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerEmail" ID="StudentEnrolmentField35" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
        </div>--%>
        <%--     <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerTel" ID="StudentEnrolmentField36" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Contact Number" />
        </div>--%>
    </div>
    <div class="UnEmployedFieldsToHide" id="UnEmployedFieldsToHide" runat="server">
        <div class="form-input">
            <span class="textfieldlabelrequired">Unemployed for (number of months) </span>
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfUnemploymentID" ID="Field_LengthOfUnemploymentID" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption=" " />
        </div>
    </div>


<%--    <br />
    <p>Please check you meet the entry requirements for the course for which you are applying.</p>

<p>All applications are shortlisted based on the information you provide in this section.</p>
    <p><b>We need your expected or achieved qualifications to make sure you are applying for the right course. Please include information on all qualifications studied i.e. GCSE, BTEC diplomas, A-levels, NVQs. If you haven’t yet taken your exams, please provide your predicted grades.</b></p>


    <p class="textfieldlabelrequired">Entering Maths & English Qualifications is mandatory </p>
    <br />


    <p>If you have no qualifications, then please press ‘No prior qualifications’. Use ‘Add row’ to save and add multiple qualifications. </p>

    <br />

    <asp:Button runat="server" ID="btnNoPriorQualifications" CssClass="button button-orange" Text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />
    <div id="slidingdiv" class="slidingDiv" runat="server">

        <asp:Table class="table table-striped text-center" ID="tblQuals" runat="server">
        </asp:Table>
        <br />
        <asp:Button runat="server" ID="btnAdd" CssClass="button button-orange" Text="Add row" CausesValidation="false"></asp:Button>

    </div>

    <br />

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined6" ID="fldSchoolID" runat="server"  IsRequired="false" LabelWidth="400" CustomCaption="Name of current school / college / employer" />
    </div>

  
        <span class="textfieldlabelrequired1">If an interview is required as part of your application would you prefer</span>   
    <asp:DropDownList ID="rdoInterviewPref" runat="server">
          <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
         <asp:ListItem Value="Telephone" Text="Telephone"></asp:ListItem>
         <asp:ListItem Value="Face to Face" Text="Face to Face"></asp:ListItem>
         <asp:ListItem Value="Either" Text="Either"></asp:ListItem>    
    </asp:DropDownList>

    <hr />
    <br />--%>
 
</div>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
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

<%--<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />--%>


<script type="text/javascript">
    $(document).ready(function () {



        $('.Employedfields').hide();
        $('.EmployerFieldsToHide').hide();
        $('.UnEmployedFieldsToHide').hide();

        var rdo = document.getElementById("cboEmploymentStatusID")

        

        if (rdo.value == "10") {
            $('.Employedfields').slideDown()
            $('.Employedfields').show()
            $('.UnEmployedFieldsToHide').hide()
            $('.UnEmployedFieldsToHide').slideUp()
        }
        else if (rdo.value == "11") {
            $('.Employedfields').slideUp()
            $('.Employedfields').hide()
            $('.UnEmployedFieldsToHide').slideDown()
            $('.UnEmployedFieldsToHide').show()
        }
        else if (rdo.value == "12") {
            //alert(rdo.value)
            $('.Employedfields').slideUp()
            $('.Employedfields').hide()
            $('.UnEmployedFieldsToHide').slideDown()
            $('.UnEmployedFieldsToHide').show()
        }
        else {
            $('.Employedfields').slideDown()
            $('.Employedfields').show()
            $('.UnEmployedFieldsToHide').slideDown()
            $('.UnEmployedFieldsToHide').show()
        }

        $('#cboEmploymentStatusID').change(function () {

            $('#cboEmploymentStatusID').val($(this).val());


            if ($(this).val() == "10") {
                $('.Employedfields').slideDown()
                $('.UnEmployedFieldsToHide').slideUp()
            }
            else if ($(this).val() == "11") {
                $('.Employedfields').slideUp()
                $('.UnEmployedFieldsToHide').slideDown()
            }
            else if ($(this).val() == "12") {
                $('.Employedfields').slideUp()
                $('.UnEmployedFieldsToHide').slideDown()
            }
            else {
                $('.Employedfields').slideUp()
                $('.UnEmployedFieldsToHide').slideUp()
            }

        });
    });
</script>




<%--<script>

    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= rdoSelfEmp.UniqueID%>")
        if (rdo[0].checked) {
            $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', true);
        }
        else {
            $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var RadioButtonListEU = document.getElementById("<%= rdoSelfEmp.ClientID%>")
        RadioButtonListEU.onchange = function () {
            var rdo = document.getElementsByName("<%= rdoSelfEmp.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', false);
            }



        };
    });
</script>--%>

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

    













