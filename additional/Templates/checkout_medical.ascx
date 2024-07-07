<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_medical.ascx.vb" Inherits="checkout_medical" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>



  <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />
    <div class="form-field-section grey">
  
<h2 class="app-title">Medical Declaration Form</h2>  



           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined10" ID="StudentEnrolmentField17" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Date of completion" CustomFieldType="date" HTML5InputType="date" />
    </div>
          
          <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined12" ID="StudentEnrolmentField18" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Staff Name" CustomFieldType="text" />
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
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined15" ID="StudentEnrolmentField4" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Campus" CustomFieldType="Lookup" />
    </div>


            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined16" ID="StudentEnrolmentField5" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Current course / applied for" CustomFieldType="text" />
    </div>


        <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined28" ID="StudentEnrolmentField2" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Medical Conditions" CustomFieldType="text" />
    </div>

            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined28" ID="StudentEnrolmentField3" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Medication, time to be taken, quantity to be taken" CustomFieldType="text" />
    </div>

       <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined29" ID="StudentEnrolmentField6" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Medical, behavioural or emotional conditions - implications of symptoms for course" CustomFieldType="text" />
    </div>

   <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined30" ID="StudentEnrolmentField7" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="Medical, behavioural or emotional conditions - implications of symptoms for residence (if applicable):" CustomFieldType="text" />
    </div>

         <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined24" ID="StudentEnrolmentField12" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="Support Needed" CustomFieldType="text" />
    </div>
           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined4" ID="StudentEnrolmentField8" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="Name and address of Doctor/Consultant" CustomFieldType="text" />
    </div>




        </div>


<div class="form-field-section grey">
    <h2 class="app-title">Data protection</h2>

     <br />
    <hr />

    <p>I give consent for the College to approach my doctor to supply any further information in support of my application</p>

     <p>The information you have provided is subject to the General Data Protection Regulation (“GDPR”) and the Data Protection Act 2018. It will be stored on paper and digitally on computer, so the College can process your booking and for various administrative purposes. By submitting this booking form you agree to the College processing your personal and sensitive data in this way, to enable the College to provide you with access to this event. You also agree that in the event you are under 18 years of age, the College may contact your parent, guardian or carer. Your personal data will not be subject to any automated decision making and all data will remain within the UK at all times. You have the right to withdraw this consent at any time; but please note, that in the event you do, this could have consequences in terms of the College being able to contact you about your booking and allowing you to attend the event. The College will retain the data for a maximum period of 2 years.</p>

    <p>If you have any concerns about how your data is to be used, you understand that you can contact the College’s Data Protection Officer at If you have any concerns about the way Askham Bryan College is using your Personal Data, you can contact the College’s Data Protection Officer, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> If you are still not satisfied with the response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a></p>


    <p>For further details as to your rights under GDPR and the Data Protection Act 2018 please go to <a href="https://ico.org.uk/for-organisations/data-protection-act-2018/" target="_blank">https://ico.org.uk/for-organisations/data-protection-act-2018/</a> and <a href="https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr" target="_blank">https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr</a>. The College’s Data Protection Policy and its core data protection policies including its Retention Policy and Subject Access Request Policy are available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>, hard copies of which are available on request.</p>
    
    
    <p>Please enter your signature in the box below to confirm you have read and understood and agree to the above statements.</p>

   
 




       <p><b>By signing this form I give permission for the College to contact my previous school/college and/or Local Authority or other professionals working with me for information on my support requirements.  I agree for College to contact me if required to discuss further.</b></p>
  


         <uc1:StudentSignature runat="server" ID="StudentSignature" />



    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" />
     </div>



    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />






