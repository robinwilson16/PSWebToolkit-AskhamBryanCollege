<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_bursary.ascx.vb" Inherits="checkout_bursary" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>



  <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />
    <div class="form-field-section grey">
  
<h2 class="app-title">Additional Learning Support Questionnaire - Further Education</h2>  



           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined10" ID="StudentEnrolmentField17" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Date of completion" CustomFieldType="date" HTML5InputType="date" />
    </div>
            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined11" ID="StudentEnrolmentField2" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Referral Type" CustomFieldType="Lookup" />
    </div>
          <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined12" ID="StudentEnrolmentField18" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Staff Name" CustomFieldType="text" />
    </div>
           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined14" ID="StudentEnrolmentField19" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Student Type" CustomFieldType="Lookup" />
    </div>




   <h3>Student Details</h3>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true"  LabelWidth="400" CustomCaption="First Name" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true"  LabelWidth="400" CustomCaption="Surname" />
    </div>
     
     <div class=" form-group">
        <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"   LabelWidth="400" ClientIDMode="Static"/>
    </div>

           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField20" runat="server" CustomCaption="Mobile" IsRequired="false" LabelWidth="300" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)" />
    </div>

    <div class="form-input">
        <cc1:StudentEmailField StudentEnrolmentFieldType="EmailAddress" ID="StudentEmailField1" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Personal Email Address" />
    </div>

           <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="StudentEnrolmentField3" runat="server" IsRequired="true"  LabelWidth="400" CustomCaption="Student reference number" />
    </div>

            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined15" ID="StudentEnrolmentField4" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Campus" CustomFieldType="Lookup" />
    </div>


            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined16" ID="StudentEnrolmentField5" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Current course / applied for" CustomFieldType="text" />
    </div>

            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined17" ID="StudentEnrolmentField6" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Course Manager, if known" CustomFieldType="text" />
    </div>


         <p class="textfieldlabelrequired">Do you have an educational health care plan</p>
    <asp:RadioButtonList ID="HasEHCP" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" ID="StudentEnrolmentField14" runat="server" LabelWidth="400" />


    </div>
        

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


        
         <p class="textfieldlabelrequired">Do you have a My Support Plan</p>
    <asp:RadioButtonList ID="rdoMySupport" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined18" ID="fldMySupport" runat="server" LabelWidth="400" CustomFieldType="TickBox" />


    </div>
        

<script>

    $(document).ready(function () {



        var ele = document.getElementsByName("<%= rdoMySupport.UniqueID%>")
        if (ele[0].checked) {

            $('#ctl00_MainContentPlaceholder_ctl00_fldMySupport_chkApplicationUserDefined18').prop('checked', true);
        }
        else if (ele[1].checked) {

            $('#ctl00_MainContentPlaceholder_ctl00_fldMySupport_chkApplicationUserDefined18').prop('checked', false);
        }

        else {

            $('#ctl00_MainContentPlaceholder_ctl00_fldMySupport_chkApplicationUserDefined18').prop('checked', false);
        }
        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= rdoMySupport.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= rdoMySupport.UniqueID%>")
            if (ele[0].checked) {

                $('#ctl00_MainContentPlaceholder_ctl00_fldMySupport_chkApplicationUserDefined18').prop('checked', true);
            }
            else if (ele[1].checked) {

                $('#ctl00_MainContentPlaceholder_ctl00_fldMySupport_chkApplicationUserDefined18').prop('checked', false);
            }

            else {

                $('#ctl00_MainContentPlaceholder_ctl00_fldMySupport_chkApplicationUserDefined18').prop('checked', false);
            }


        };
    });
</script>




         <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="fldDisabilityCategory1ID" CustomCaption="Primary Disability/Learning Difficulty" StudentEnrolmentFieldType="DisabilityCategory1ID" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="fldDisabilityCategory2ID" CustomCaption="Secondary Disability/Learning Difficulty" StudentEnrolmentFieldType="DisabilityCategory2ID" LabelWidth="300" />
        </div>


        
        <p>For Medical conditions / temporary disabilties,  how does this impact on your studies?</p>

        <div class="form-group">
            <cc1:StudentEnrolmentField runat="server" StudentEnrolmentFieldType="DisabilityNotes" CustomCaption="Notes" CustomFieldType="other" ClientIDMode="Static" />
          
        </div>



         <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined19" ID="StudentEnrolmentField7" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Previous exam access arrangement requirements (e.g extra time, scribe, laptop)" CustomFieldType="text" />
    </div>


             <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined20" ID="StudentEnrolmentField8" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="If a new applicant, do you need any additional reasonable adjustments at open events, the interview process or enrolment" CustomFieldType="lookup" />
    </div>

            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined21" ID="StudentEnrolmentField9" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="What additional reasonable adjustments do you require?" CustomFieldType="text" />
    </div>

               <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined22" ID="StudentEnrolmentField10" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Name of current or last school/college attended - if existing students on a current programme enter ABC (Askham Bryan College)" CustomFieldType="text" />
    </div>

        
               <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined23" ID="StudentEnrolmentField11" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Have you previously had support at school/college" CustomFieldType="lookup" />
    </div>
            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined24" ID="StudentEnrolmentField12" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="If yes - please describe which support you have had" CustomFieldType="text" />
    </div>

         <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined25" ID="StudentEnrolmentField13" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Do you have any specialist or professional reports regarding your diagnosis and/or support needs? e.g.  Educational Psychologist report or specialist assessor" CustomFieldType="lookup" />
    </div>

             <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined26" ID="StudentEnrolmentField15" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Contact name and details other professionals involved e.g.  social worker, epilepsy nurse or CAMHS" CustomFieldType="text" />
    </div>

          <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined27" ID="StudentEnrolmentField16" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="If so, please specify" CustomFieldType="text" />
    </div>

</div>

    

  

<div class="form-field-section grey">
    <h2 class="app-title">Data protection</h2>

     <br />
    <hr />

     <p>The information you have provided is subject to the General Data Protection Regulation (“GDPR”) and the Data Protection Act 2018. It will be stored on paper and digitally on computer, so the College can process your booking and for various administrative purposes. By submitting this booking form you agree to the College processing your personal and sensitive data in this way, to enable the College to provide you with access to this event. You also agree that in the event you are under 18 years of age, the College may contact your parent, guardian or carer. Your personal data will not be subject to any automated decision making and all data will remain within the UK at all times. You have the right to withdraw this consent at any time; but please note, that in the event you do, this could have consequences in terms of the College being able to contact you about your booking and allowing you to attend the event. The College will retain the data for a maximum period of 2 years.</p>

    <p>If you have any concerns about how your data is to be used, you understand that you can contact the College’s Data Protection Officer at If you have any concerns about the way Askham Bryan College is using your Personal Data, you can contact the College’s Data Protection Officer, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> If you are still not satisfied with the response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a></p>


    <p>For further details as to your rights under GDPR and the Data Protection Act 2018 please go to <a href="https://ico.org.uk/for-organisations/data-protection-act-2018/" target="_blank">https://ico.org.uk/for-organisations/data-protection-act-2018/</a> and <a href="https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr" target="_blank">https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr</a>. The College’s Data Protection Policy and its core data protection policies including its Retention Policy and Subject Access Request Policy are available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>, hard copies of which are available on request.</p>
    
    
    <p>Please enter your signature in the box below to confirm you have read and understood the above statement.</p>

   
 




       <p><b>By signing this form I give permission for the College to contact my previous school/college and/or Local Authority or other professionals working with me for information on my support requirements.  I agree for College to contact me if required to discuss further.</b></p>
  


         <uc1:StudentSignature runat="server" ID="StudentSignature" />



    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" />
     </div>



    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />






