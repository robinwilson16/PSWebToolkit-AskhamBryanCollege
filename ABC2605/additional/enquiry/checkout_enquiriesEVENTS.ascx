<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enquiriesEVENTS.ascx.vb" Inherits="webcontrols_checkout_enquiriesEVENTS" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>
  
<div class="form-field-section grey">
    <h2 class="app-title">Event Bookings</h2>
    
      
<br />
    <br />


   
  
  
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldForename" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="First Name" />
    </div>

      <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="200"  AutoFocus="true"/>
    </div>
   
   <p>To enable us to track your form (and not confuse you with someone else with the same name) please confirm your date of birth below: </p>
   <div class="form-group">
       <p class="textfieldlabelrequired">Date of Birth</p>
         <asp:TextBox ID="DoB" runat="server" Type="date"></asp:TextBox>

         </div>
    
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="fldMob" runat="server" IsRequired="false"  LabelWidth="200" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)"/>
    </div>
   
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Email" ID="fldEmail" runat="server" IsRequired="true" LabelWidth="200" HTML5InputType="email" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>  
    
     <div class=" form-group">
  
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SchoolID" ID="StudentEnrolmentField5" runat="server" IsRequired="false" LabelWidth="400" ExcludedIDValues="209,2927,638,3432,182463,182635,1490,1489,184225,2793,48" 
            CustomCaption=" Current / previous School / College" />
    </div>
  
    
 
    <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined2" ID="StudentEnrolmentField4" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="Nearest village or town or city to home (This is to help us plan our transport routes)" CustomFieldType="text" />
    </div>

 
    
    <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined3" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="Would you like information about apprenticeships during your visit?" CustomFieldType="lookup" />
    </div>


    <p>Our York campus offers a range of courses and our Middlesbrough campus offers Animal Management, Equine, Land & Wildlife and Foundation Learning options - if you would like to find out about another area during your visit to either of these campuses please let us know here. </p>
       
    <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined4" ID="StudentEnrolmentField2" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="Interested?" CustomFieldType="lookup" />
    </div>

    
    <p><i>Please note our Information Evenings are drop in sessions so please arrive in sufficient time to visit all of the subject stands you are interested in. We will do our best to accommodate additional requests depending on staff and facility access availability.</i></p>


    <br />

       
    <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined5" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="How many extra people will be with you - maximum 2" CustomFieldType="Number" />
    </div>

    
       <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined6" ID="StudentEnrolmentField6" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="Do you have any additional access or support needs you feel it would be helpful for us to know about?" CustomFieldType="text" />
    </div>
    <p><i>Our site is quite large and some of our older buildings have steps / narrow entrances,
We provide additional support for those who are, or have recently been, in care</i></p>
  

       <div class=" form-group">
      <p class="textfieldlabelrequired">How did you find out about us?</p>
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HeardAboutCollegeID" ID="StudentEnrolmentField8" runat="server" IsRequired="true" LabelWidth="0"
            CustomCaption="How did you find out about college?" />
    </div>


        <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined7" ID="StudentEnrolmentField7" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="Have you already submitted an application form for Askham Bryan College?" CustomFieldType="lookup" />
    </div>








    <p>We would like to keep in touch with you to update you on College news, events and important applicant deadlines:</p>

     <asp:CheckBox ID="acceptmarketing" runat="server" Text="I am happy to receive information about future college courses & events">
     
    </asp:CheckBox>

    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcceptMarketingConsent" ID="AcceptMarketingTick" runat="server" LabelWidth="400" />
        </div>
  
      <br />
    <hr />

    <p>The information you have provided is subject to the General Data Protection Regulation (“GDPR”) and the Data Protection Act 2018. It will be stored on paper and digitally on computer, so the College can process your booking and for various administrative purposes. By submitting this booking form you agree to the College processing your personal and sensitive data in this way, to enable the College to provide you with access to this event. You also agree that in the event you are under 18 years of age, the College may contact your parent, guardian or carer. Your personal data will not be subject to any automated decision making and all data will remain within the UK at all times. You have the right to withdraw this consent at any time; but please note, that in the event you do, this could have consequences in terms of the College being able to contact you about your booking and allowing you to attend the event. The College will retain the data for a maximum period of 2 years.</p>

    <p>If you have any concerns about how your data is to be used, you understand that you can contact the College’s Data Protection Officer at If you have any concerns about the way Askham Bryan College is using your Personal Data, you can contact the College’s Data Protection Officer, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> If you are still not satisfied with the response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a></p>


    <p>For further details as to your rights under GDPR and the Data Protection Act 2018 please go to <a href="https://ico.org.uk/for-organisations/data-protection-act-2018/" target="_blank">https://ico.org.uk/for-organisations/data-protection-act-2018/</a> and <a href="https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr" target="_blank">https://ico.org.uk/for-organisations/guide-to-the-general-data-protection-regulation-gdpr</a>. The College’s Data Protection Policy and its core data protection policies including its Retention Policy and Subject Access Request Policy are available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>, hard copies of which are available on request.</p>
    
    
    <p>Please enter your signature in the box below to confirm you have read and understood the above statement.</p>

         <uc1:StudentSignature runat="server" ID="StudentSignature" />


        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx" Visible="false"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" LinkResource="checkout_makepayment_aspx" CausesValidation="true" CssClass="button"/>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    </div>
<script>

    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= acceptmarketing.UniqueID%>")
        if (rdo[0].checked) {
            $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', true);
        }
        else {
            $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var RadioButtonListEU = document.getElementById("<%= acceptmarketing.ClientID%>")
        RadioButtonListEU.onchange = function () {
            var rdo = document.getElementsByName("<%= acceptmarketing.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', false);
            }



        };
    });
</script>

