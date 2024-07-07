<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>



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
    <h2 class="app-title">Personal Details</h2>
    <hr />



    <br />



    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="300" />
    </div>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="First Name" />
    </div>
    <p><i>This should be your legal name. This will then be used for all our communications, official documents (e.g. certificates), and correspondence.</i></p>

    <%--  <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Middle Name(s)" />
    </div>--%>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="StudentEnrolmentField10" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname" />
    </div>

     <div class=" form-group">
        <cc1:StudentEnrolmentField ID="datepicker" runat="server" IsRequired="false" StudentEnrolmentFieldType="DateOfBirth" LabelWidth="200" ClientIDMode="Static" Placeholder="dd/mm/yyyy" />
    </div>

      <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="StudentEnrolmentField12" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Ethnic Origin" />
    </div>



    <%--    <p>Have you ever been known under a different surname? </p>
    <asp:RadioButtonList ID="rdoSurname" runat="server" CssClass="form-input" ClientIDMode="Static">

        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
        <asp:ListItem Value="2" Text="No"></asp:ListItem>

    </asp:RadioButtonList>

    <div class="surnamefields">

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SurnameAtBirth" ID="StudentEnrolmentField38" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Previous Surname" />
        </div>

    </div>--%>




    <%--
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="KnownAs" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Known as  (First Name)" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined2" ID="StudentEnrolmentField31" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Known As (Surname)" />
    </div>--%>


    <%--<div class="form-input">
        <p class="textfieldlabelrequired">Date of Birth</p>
        <asp:TextBox ID="DoB" runat="server" type="date" />
    </div>--%>
    <%--    <div class="form-input">
        <cc1:StudentEnrolmentField ID="StudentEnrolmentField2" runat="server" IsRequired="true" StudentEnrolmentFieldType="sex" LabelWidth="300" ClientIDMode="Static" CustomCaption="Legal Sex" />

    </div>--%>

  

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField4" runat="server" CustomCaption="Contact Number (Home Telephone)" IsRequired="false" LabelWidth="300" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField5" runat="server" CustomCaption="Mobile" IsRequired="false" LabelWidth="300" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)" />
    </div>

    <div class="form-input">
        <cc1:StudentEmailField StudentEnrolmentFieldType="EmailAddress" ID="StudentEnrolmentField7" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Email Address" />
    </div>
    <p><i>Please supply your personal email address.  This is the address we will send any digital certificates to</i></p>

 
           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="NINum" runat="server" IsRequired="false" LabelWidth="400"
            CustomCaption="National Insurance No." Pattern="^(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]$" Title="Please match requested format (AB123456C) all caps" />

    </div>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="fldNationalityID" runat="server" LabelWidth="300" IsRequired="true"
            CustomCaption="Nationality" />
    </div>


    <div class="form-input">
        <span class="textfieldlabelrequired">Will you have lived continuously in the UK for more than 3 years on the first day of your course?</span>
        <asp:RadioButtonList runat="server" ID="RadioButtonListEU" CssClass="form-input" ToolTip="Have you been a full, legal resident in England or the European Union / Economic Area (excluding Wales, Scotland and Northern Ireland) throughout the past three years for any purpose other than study">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>
            <%--<asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>--%>
        </asp:RadioButtonList>

    </div>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsHomeFees" ID="HomeFees" runat="server" LabelWidth="400" />

    </div>




    <div class="form-input">
        <span class="textfieldlabelrequired">Do you have any convictions, cautions, reprimands, final warnings or pending court cases which are not protected as defined by the Rehabilitation of Offenders Act 1974 (Exceptions) Order 1975 (as amended in 2013)?  </span>
        <asp:RadioButtonList runat="server" ID="RadioButtonList1" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
            <asp:ListItem Text="No" Value="3"></asp:ListItem>
       
        </asp:RadioButtonList>
    </div>





    <h2 class="app-title">Address</h2>
    <hr />

 



        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress1" runat="server" CustomCaption="Property/Street"
                IsRequired="true" StudentEnrolmentFieldType="Address1" LabelWidth="200" />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress2" runat="server" CustomCaption="Address Line 2"
                IsRequired="true" StudentEnrolmentFieldType="Address2" LabelWidth="300" />
        </div>
        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress3" runat="server" CustomCaption="Town / City"
                IsRequired="true" StudentEnrolmentFieldType="Address3" LabelWidth="200" />
        </div>
        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress4" runat="server" CustomCaption="County"
                IsRequired="true" StudentEnrolmentFieldType="Address4" LabelWidth="200" />
        </div>


        <div class=" form-group">

            <p class="textfieldlabelrequired">Postcode</p>
            <input type="text" runat="server" id="postcode" title="Postcode" placeholder="Enter Postcode" />

        </div>




























    <hr />

    <br />

    <h2 class="app-title">Next of Kin details </h2>


    <p>Please provide details of at least one emergency contact. If you are under 18 please could you please provide the details of a parent/carer, We will use the information to contact a parent/carer about your progress, attendance, and to invite them to parents evenings. </p>



    <hr />

    <h3>Emergency Contact Details</h3>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1" ID="StudentEnrolmentField15" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Name (Full Name)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="StudentEnrolmentField16" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Relationship" />
    </div>

 

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="contacttel" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Phone number" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1EmailAddress" ID="StudentEnrolmentField18" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Emergency Contact Email Address" />
    </div>

    <div class="form-input">
        <span class="textfieldlabelrequired">Are you living with this person?</span>
        <asp:RadioButtonList runat="server" ID="LivesWithContact1">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>

        </asp:RadioButtonList>

    </div>


    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsLivingWithcontact1" ID="LivingWithContact1" runat="server" LabelWidth="400" />
    </div>





    <div class="parentaddress">



        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 1</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address1" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 1" />
        </div>
        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 2</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address2" ID="StudentEnrolmentField33" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 2" />
        </div>
        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 3</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address3" ID="StudentEnrolmentField17" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 3" />
        </div>
        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 4</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address4" ID="StudentEnrolmentField20" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 4" />
        </div>
        <div class="form-input">
            <p class="textfieldlabelrequired">Postcode</p>
            <input type="text" runat="server" id="Contact1Postcode" title="Postcode" placeholder="Enter Postcode" class="textfieldlabelrequired" />
        </div>

    </div>

    </div>





<div class="form-field-section grey">


    <h2 class="app-title">Learner Support</h2>
    <hr />



    <p>We collect information relating to special educational needs, disabilities and additional support so our learning support team can work with you to ensure that you receive the appropriate help and advice to achieve your full potential</p>





    <div class="form-input">
        <span class="textfieldlabelrequired">Do you have any disabilities or learning difficulties?</span>
        <asp:RadioButtonList runat="server" ID="rdoLearnDiff" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>

        </asp:RadioButtonList>

    </div>


    <p class="textfieldlabelrequired">Do you consider yourself to have any special Eduacational needs?</p>
    <asp:RadioButtonList ID="AdditionalSupport" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasSpecialEducationNeeds" ID="StudentEnrolmentField6" runat="server" LabelWidth="400" />


    </div>



 






    <p class="textfieldlabelrequired">Do you have an educational health care plan</p>
    <asp:RadioButtonList ID="HasEHCP" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" ID="StudentEnrolmentField14" runat="server" LabelWidth="400" />


    </div>

     <p class="textfieldlabelrequired">Have you recently left Care? </p>
    <asp:RadioButtonList ID="NotHECareLeaver" runat="server" EnableViewState="true">

        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
        <asp:ListItem Value="2" Text="No"></asp:ListItem>

    </asp:RadioButtonList>


    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="fldCareLeaver" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Care Leaver" Enabled="True" CustomFieldType="TickBox" />
    </div>



    <script>


        $(document).ready(function () {




            var rdo = document.getElementsByName("<%= NotHECareLeaver.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_fldCareLeaver_chkCareLeaver').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_fldCareLeaver_chkCareLeaver').prop('checked', false);
            }

            // Set EU Fields visibility when 'Yes' radio button is clicked
            var RadioButtonListEU = document.getElementById("<%= NotHECareLeaver.ClientID%>")
            RadioButtonListEU.onchange = function () {
                var rdo = document.getElementsByName("<%= NotHECareLeaver.UniqueID%>")
                if (rdo[0].checked) {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldCareLeaver_chkCareLeaver').prop('checked', true);
                }
                else {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldCareLeaver_chkCareLeaver').prop('checked', false);
                }



            };
        });

    </script>






    <br />
    <br />
    <h2 class="app-title">Education</h2>

    <cc1:StudentEnrolmentField ID="StudentEnrolmentField37" runat="server" CustomCaption="What is your highest level of Qualification?"
        IsRequired="True" LabelWidth="300" StudentEnrolmentFieldType="PriorAttainmentLevelID"></cc1:StudentEnrolmentField>



    <p>
        Use the following table to help you pick the correct qualification level...
    </p>
    <table class="table table-striped table-bordered">
        <tr class="active">
            <th>Level</th>
            <th>Academic Qualification Equivalent</th>
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





    <br />





    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SchoolID" ID="fldSchoolID" runat="server" Placeholder="--Please Select--" IsRequired="false" LabelWidth="400" CustomCaption="Previous/Current School" />
    </div>




    <br />
    <br />

    <p><b>We need your expected or achieved qualifications to make sure you are applying for the right course. Please include information on all qualifications studied i.e. GCSE, BTEC diplomas, A-levels, NVQs. If you haven’t yet taken your exams, please provide your predicted grades.</b></p>


    <p class="textfieldlabelrequired">Entering Maths & English Qualifications is mandatory </p>
    <br />


    <p>If you have no qualifications, then please press ‘No prior qualifications’. Use ‘Add row’ to save and add multiple qualifications. </p>

    <p>To remove items, please press ‘No prior qualifications’ then press ‘Add Qualifications’ </p>
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

    <hr />
    <br />


    <div id="refs" runat="server" visible="False">

        <h2 class="app-title">References</h2>

        <p>
            Please enter the details of your referees, who we may contact in the event that you are enrolled at the college.
        </p>



        <asp:Button runat="server" ID="btnNoReferences" CssClass="show_hide btn btn-primary" Text="No references" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
        <br />
        <br />
        <div id="Div2" class="slidingDiv" runat="server">
            <div class="table-responsive">
                <table class="table text-center" id="tblReferences" runat="server">
                </table>
            </div>
            <asp:Button runat="server" ID="Button2" CssClass="btn btn-success" Text="Add Row" CausesValidation="false"></asp:Button>

        </div>

    </div>





    

        <h4>Please let us know any additional information that may help us with your application.</h4>

        <div class="form-group">
            <cc1:StudentEnrolmentField runat="server" StudentEnrolmentFieldType="Notes" CustomCaption="Notes" CustomFieldType="other" ClientIDMode="Static" />
     
        </div>


    <p class="textfieldlabelrequired">We would like to keep in touch with you to update you on College news, events and important applicant deadlines:</p>

    <asp:RadioButtonList ID="rdoConsent" runat="server">
        <asp:ListItem Value="1" Text="Yes">
            
        </asp:ListItem>
         <asp:ListItem Value="0" Text="No">
            
        </asp:ListItem>
    </asp:RadioButtonList>

     <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcceptMArketingConsent" ID="fldConsent" runat="server" IsRequired="false" LabelWidth="300" CustomCaption=" " Enabled="True" CustomFieldType="TickBox" />
    </div>



    <script>


        $(document).ready(function () {




            var rdo = document.getElementsByName("<%= rdoConsent.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', false);
            }

     
            var RadioButtonListEU = document.getElementById("<%= rdoConsent.ClientID%>")
            RadioButtonListEU.onchange = function () {
                var rdo = document.getElementsByName("<%= rdoConsent.UniqueID%>")
                if (rdo[0].checked) {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', true);
                }
                else {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', false);
                }



            };
        });

    </script>





<h2 class="app-title">Data protection statement</h2>

    <p>

I agree to the College processing my personal and sensitive data to assess my application and shortlist interviewees. I also agree to the College sharing my details with relevant organisations to support my application. The College retains Personal Data for at least 1 year for unsuccessful applicants and at least 6 years from completion of course for successful ones. The College holds Personal Data in accordance with the College data retention policy which is available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>. All data will remain at all times within the UK and European Economic Area (“EEA”). You can withdraw your consent for this processing at any time (though this may have consequences for your application). If you have any concerns about the way Askham Bryan College is using your Personal Data, you can contact the College’s Data Protection Officer, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> If you are still not satisfied with the response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a>

I confirm that the information provided on this form is accurate and true.

I have read and agree with the above Data Protection Statement.</p>



 <p class="textfieldlabelrequired">Signature</p>
     <uc1:StudentSignature runat="server" ID="StudentSignature" />



    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" LinkResource="checkout_home_aspx" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />

        </div>
<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />





<script>

    $(document).ready(function () {

        $('.parentaddress').hide()

        var ele = document.getElementsByName("<%= LivesWithContact1.UniqueID%>")
        if (ele[0].checked) {
            $(".parentaddress").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $(".parentaddress").show()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= LivesWithContact1.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= LivesWithContact1.UniqueID%>")
            if (ele[0].checked) {
                $(".parentaddress").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {

                $(".parentaddress").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }



        };
    });
</script>


<script>

    $(document).ready(function () {

       // $('.UKResident').hide()

        var ele = document.getElementsByName("<%= RadioButtonListEU.UniqueID%>")
        if (ele[1].checked) {
          //  $(".UKResident").show()
            $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
        }
        else if (ele[0].checked) {
           // $(".UKResident").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', true);
        }

        else {
           // $(".UKResident").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
        }
        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= RadioButtonListEU.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= RadioButtonListEU.UniqueID%>")
            if (ele[1].checked) {
               // $(".UKResident").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
            }
            else if (ele[0].checked) {
              //  $(".UKResident").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', true);
            }

            else {
              //  $(".UKResident").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
            }


        };
    });
</script>

<script>





    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= AdditionalSupport.UniqueID%>")
        if (rdo[0].checked) {
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', true);
        }
        else {
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var RadioButtonListEU = document.getElementById("<%= AdditionalSupport.ClientID%>")
        RadioButtonListEU.onchange = function () {
            var rdo = document.getElementsByName("<%= AdditionalSupport.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', false);
            }



        };
    });
</script>


<script>

    $(document).ready(function () {

   

        var ele = document.getElementsByName("<%= HasEHCP.UniqueID%>")
        if (ele[0].checked) {
      
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', true);
        }
        else if (ele[1].checked) {
   
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
        }

        else {
        
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
        }
        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= HasEHCP.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= HasEHCP.UniqueID%>")
            if (ele[0].checked) {
          
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', true);
            }
            else if (ele[1].checked) {
         
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
            }

            else {
             
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
            }


        };
    });
</script>
