<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_consent.ascx.vb" Inherits="checkout_consent" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>



  <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />
    <div class="form-field-section grey">
  
<h2 class="app-title">Askham Bryan College - Consent and Indemnity Form</h2>  





 

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


        <h3>Sedcond contact (optinal)</h3>

          

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2" ID="StudentEnrolmentField2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Emergency Contact Name (Full Name)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2RelationshipID" ID="StudentEnrolmentField6" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Emergency Contact Relationship" />
    </div>

 

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Tel" ID="StudentEnrolmentField7" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Emergency Contact Phone number" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2EmailAddress" ID="StudentEnrolmentField8" runat="server" IsRequired="false" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Emergency Contact Email Address" />
    </div>

     
        <h3>Doctor / GP details</h3>

        <p>Please enter all details for the doctor / GP Practice (Name, address, telephone number)</p>
         <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Notes" ID="StudentEnrolmentField9" runat="server" IsRequired="false" LabelWidth="300"  />
    </div>


        <p>It is advised that students attending College for the first time should be vaccinated against MMR, Tetanus and Meningitis/septicaemia (MenACWY vaccine) before they arrive.
Please contact your GP (not College) for further information</p>

           <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined2" ID="StudentEnrolmentField10" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Please give details of any vaccinations received" CustomFieldType="text" />
    </div>


        
        <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined28" ID="StudentEnrolmentField11" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Medical Conditions" CustomFieldType="text" />
    </div>

            <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined28" ID="StudentEnrolmentField12" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="Allergies" CustomFieldType="text" />
    </div>

       <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined29" ID="StudentEnrolmentField13" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Please list any known mental health and or anxiety conditions" CustomFieldType="text" />
    </div>

         <div class="form-group">
            <cc1:StudentEnrolmentField runat="server" StudentEnrolmentFieldType="DisabilityNotes" CustomCaption="Please let us know anything else you think we should be aware of" CustomFieldType="other" ClientIDMode="Static" />
         
        </div>

        
</div>

    

  

<div class="form-field-section grey">
    <h2 class="app-title">Data protection</h2>

     <br />
    <hr />

    <p>Please note, we need the information to make sure the College medical insurance remains valid, (not applicable to work placements as these are covered by their own public and employee liability policies)</p>

    <p>During their time at College, learners may be required to attend off-site College activities. The College will take all reasonable and necessary precautions to ensure the welfare and safety of all participants.  At all times during such activities, learners are subject to College policies and must conduct themselves so as to bring credit to themselves and the College</p>

    <p>All participants will be covered by insurance taken out by the College for the duration of the activity.  The participant or, if he/she is aged under 18, his/her parent or guardian, hereby undertakes to indemnify the College in the event of any loss or damage whatsoever caused by the participant during the activity, and to reimburse the College for any expenditure incurred by the participant</p>

     <p>The information you have provided is subject to the General Data Protection Regulation (“GDPR”) and the Data Protection Act 2018. It will be stored on paper and digitally on computer, so the College can process your booking and for various administrative purposes. By submitting this booking form you agree to the College processing your personal and sensitive data in this way, to enable the College to provide you with access to this event. You also agree that in the event you are under 18 years of age, the College may contact your parent, guardian or carer. Your personal data will not be subject to any automated decision making and all data will remain within the UK at all times. You have the right to withdraw this consent at any time; but please note, that in the event you do, this could have consequences in terms of the College being able to contact you about your booking and allowing you to attend the event. The College will retain the data for a maximum period of 2 years.</p>

    <p>If you have any concerns about how your data is to be used, you understand that you can contact the College’s Data Protection Officer at If you have any concerns about the way Askham Bryan College is using your Personal Data, you can contact the College’s Data Protection Officer, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> If you are still not satisfied with the response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a></p>


    <p>For further details as to your rights under GDPR and the Data Protection Act 2018 please go to <a href="https://ico.org.uk/for-organisations/data-protection-act-2018/" target="_blank">https://ico.org.uk/for-organisations/data-protection-act-2018/</a> and <a href="https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr" target="_blank">https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr</a>. The College’s Data Protection Policy and its core data protection policies including its Retention Policy and Subject Access Request Policy are available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>, hard copies of which are available on request.</p>
    
    
    <p>Please enter your signature in the box below to confirm you have read and understood the above statement.</p>

   
 
    <ul>
        <li>I confirm that the above details are true to the best of my knowledge and belief.</li>
        <li>I hereby consent to the above named learner participating in activities relevant to his/her course whilst at Askham Bryan College and I understand and agree to the terms of the indemnity set out above.</li>
        <li>I hereby consent to the Group Leader to authorise urgent medical treatment, should it be deemed necessary in any emergency, and in the event of my express consent being immediately unobtainable.</li>
        <li>I understand that under certain circumstances the College may disclose to my employer/work placement provider, certain medical information that is relevant to the placement.</li>
    </ul>


    <h3>Photo consent</h3>

    <p>Askham Bryan College (including all campuses) would like to take your image (photo/or video) for promotional purposes. These images may be sent out to the media with a press release, used for marketing materials and/or on the College websites and social media channels. Names may be used in the publication of images. In some circumstances we would also like to share your personal data (images or photographs of you) with other select project partners. We will not use the images taken, or any other information you provide, for any other purpose without your consent.</p>


    <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField36" CustomCaption="Accept Consent" StudentEnrolmentFieldType="AcceptMarketingConsent" LabelWidth="300" IsRequired="False" />
        </div>



       <p><b>By signing this form I have read, understand and agree to the statements above</b></p>
  

    <p><b>Please note that if you do not give consent, you will not be able to participate in any off site or additional activities.</b></p>

         <uc1:StudentSignature runat="server" ID="StudentSignature" />



    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" />
     </div>



    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />






