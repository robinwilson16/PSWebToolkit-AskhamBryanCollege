<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply5.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<%--<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>--%>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 49.8%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li id="liEmergency" runat="server">Emergency Contact Details</li> 
                    <li><strong>Employment Qualifications and References</strong></li>
                    <li>Personal Statement</li>
                    <li>Supporting You</li>
                    <li>Data Protection</li>
                    </ol>

<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="CourseInformation" HeaderText="Course Name">
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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="true">
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
    <h2 class="app-title">Employment Qualifications and References</h2>
    <hr />
<div id="divEmployedUnemployed" runat="server">
    <h5>Employment</h5>
      

    <div class="form-input"> 
        <span class="textfieldlabelrequired">Are you currently in employment?</span>
        <asp:DropDownList ID="ddEmployed" runat="server"   EnableViewState="true">
            <asp:ListItem value="">Please select...</asp:ListItem>
            <asp:ListItem Value="10" Text="Yes"></asp:ListItem>
            <asp:ListItem Value="0" Text="No"></asp:ListItem>
        </asp:DropDownList>
    </div>


<div id="divEmployment" runrat="server">
    <p>If in employment please provide details below:<p>
    <p><b>By providing these details, you are giving your consent for them to be contacted prior to your interview at the College for a reference.</b></p>
    
    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerName" ID="txtEmployerName" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Employer’s Company name" />
                </div>
        </div>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress1" ID="txtEmpAddress1" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 1" />
                </div>

        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress2" ID="txtEmpAddress2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 2" />
                </div>
            </div>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress3" ID="txtEmpAddress3" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 3" />
                </div>

        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress4" ID="txtEmpAddress4" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 4" />
                </div>
            </div>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <input type="text" runat="server" id="EmpPostcode" title="Postcode" placeholder="Enter postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
                </div>
           
    </div>
</div>

    <hr />
</div>

    <h5>Education</h5>
      
    <div class="form-input">
         <span class="textfieldlabelrequired">Are you currently in education or training?</span>
         <asp:DropDownList ID="ddStudyElsewhere" CssClass="form-input" runat="server" EnableViewState="true" ClientIDMode="Static">
            <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
            <asp:ListItem Value="0" Text="No"></asp:ListItem>
         </asp:DropDownList>
        
    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudyElsewhere" ID="fldStudyElsewhere" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Are you currently in education" Enabled="True" CustomFieldType="TickBox" />
            </div>

    </div>

<div id="divEducation" runrat="server">
    <p>If in education or training please provide details below:<p>
    <p><b>By providing these details, you are giving your consent for them to be contacted prior to your interview at the College for a reference.</b></p>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined3" ID="txtSchoolTraining" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Name of School/Training Provider" />
                </div>

        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined8" ID="txtHeadMentor" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Name of Head of Year/Mentor" />
                </div>
            </div>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined9" ID="txtAddress1" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 1" />
                </div>

        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined10" ID="txtAddress2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 2" />
                </div>
            </div>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined11" ID="txtAddress3" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 3" />
                </div>

        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined12" ID="txtAddress4" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 4" />
                </div>
            </div>

   <div class="row">
       <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined13" ID="txtPostcode" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Postcode" placeholder="Enter postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
           </div>
        </div>
</div>

    <hr />

    <h5>Qualifications</h5>

    <br />
    
    <span><b>Please make sure that you have double checked that you meet the minimum entry criteria for the course(s) you are applying for.</b></span>
    <p><b>All applications are shortlisted based on the information you provide in this section.</b></p>
    <p>If you are currently awaiting the results of a qualification please provide the predicted grade.</p>
    <p>If you have already achieved a result then please provide the grade and year achieved.</p>
    <p>Please enter the details of your prior qualifications. Use ‘Add row’ to save and add multiple qualifications.</p>

    <asp:Button runat="server" ID="btnNoPriorQualifications" CssClass="button button-orange" Text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />
    <div id="slidingdiv" class="slidingDiv" runat="server">

        <asp:Table class="table table-striped text-center" ID="tblQuals" runat="server">
        </asp:Table>
        <br />
    <asp:button runat="server" id="btnAdd" CssClass="button button-orange" text="Add Row"></asp:button>

    </div>

    <hr />
    
       <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger"  />
    
<div id="divReferences" runat ="server">
    <h5>References</h5>
    <p><b>All applicants must provide names of two referees.</b></p>
    <P><b>IF YOU DO NOT WANT TO USE THE NAMED CONTACT IN THE EDUCATION SECTION, PLEASE COMPLETE THE BOXES BELOW.</b></P>
    <p><b>References are not accepted from close relatives (mother, father, uncle, aunt, brother or sister).</b></p>
    <p>If you are currently in education, training or employment then please use their details for a reference. Please provide the full name and address in the referee box below. Failure to supply this may delay your application/interview.</p>
    <p><b>REFEREE (Full name and address needed)</b></p>
    <p><b>By providing these details, you are giving your consent for them to be contacted prior to your interview at the College.  </b></p>

   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeForename" ID="StudentReferenceField1" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Forename" />
           </div>
   
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeSurname" ID="StudentReferenceField2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Surname" />
           </div>
        </div>

   <div class="row">
       <div class="col-sm-12 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeJobTitle" ID="StudentReferenceField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Position" />
           </div>
        </div>
    
   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeAddress1" ID="StudentReferenceField3" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 1" />
           </div>
   
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeAddress2" ID="StudentReferenceField4" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 2" />
           </div>
        </div>

   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeAddress3" ID="StudentReferenceField5" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 3" />
           </div>
   

       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeAddress4" ID="StudentReferenceField6" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Address Line 4" />
           </div>
        </div>

   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereePostcode" ID="StudentReferenceField7" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Postcode" placeholder="Enter postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
           </div>
   
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentReferenceField StudentReferenceFieldType="RefereeEmail" ID="StudentReferenceField8" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" />
           </div>
        </div>

    <hr />
</div>

    <p>Alternatively, if you are at Askham Bryan College please provide the name of your <b>Tutor</b> and <b>course</b> below.</p>

   <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined15" ID="txtTutorName" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Tutor Name" />
           </div>

       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined16" ID="txtCourse" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Course" />
           </div>
        </div>
</div>


<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />


<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

        <asp:HiddenField  id="NoQuals" value="false" runat="server"  ClientIDMode="static" />
     <asp:HiddenField  id="intQualRows" value="0" runat="server"  ClientIDMode="static" />


<script>

    //hide and show in education or training

    $(document).ready(function () {

        $("#divEducation").hide()


        if ($("#<%=ddStudyElsewhere.ClientID%>").val() == "1") {
            $("#divEducation").show()
                // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {
            $("#divEducation").hide()
                // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }

            // Set EU Fields visibility when 'Yes' radio button is clicked

            $('#<%= ddStudyElsewhere.ClientID %>').change(function () {
          
            if ($("#<%=ddStudyElsewhere.ClientID%>").val() == "1") {
                // alert(ele[1].checked);
                $("#divEducation").slideDown()
                //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {

                $("#divEducation").slideUp()
                //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }


        });
        });
</script>

<script>

    //hide and show in education or training

    $(document).ready(function () {

        $("#divEmployment").hide()


        if ($("#<%=ddEmployed.ClientID%>").val() == "10") {
            $("#divEmployment").show()
            // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $("#divEmployment").hide()
            // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked

        $('#<%= ddEmployed.ClientID %>').change(function () {
          
            if ($("#<%=ddEmployed.ClientID%>").val() == "10") {
                    // alert(ele[1].checked);
                $("#divEmployment").slideDown()
                    //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
                }
                else {

                $("#divEmployment").slideUp()
                    //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
                }


            });
    });
</script>












