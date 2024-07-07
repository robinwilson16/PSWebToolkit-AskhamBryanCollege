<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enquiriesASKUS.ascx.vb" Inherits="webcontrols_checkout_enquiriesASKUS" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>


<%--<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none" Visible="true">


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
</div>--%>

  
<div class="form-field-section grey">
    <h2 class="app-title">Session booking - Animal managment</h2>
    




  
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="First Name" />
    </div>

      <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="200"  AutoFocus="true"/>
    </div>
 
   
    <div class=" form-group" >
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="200" HTML5InputType="email" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>
  <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="fldMob" runat="server" IsRequired="false"  LabelWidth="200" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)"/>
    </div>

     <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined8" ID="StudentEnrolmentField5" runat="server" IsRequired="true" LabelWidth="400"
            CustomCaption="Please select a date for your Level 3 Animal Management Companion Pathway Applicant Session" CustomFieldType="Lookup" />
    </div>

         <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Enquiry" ID="StudentEnrolmentFieldEnquiry" runat="server" IsRequired="true" 
            LabelWidth="300" CustomFieldType="Other" HTML5InputType="text" Placeholder="For example additional learning needs, support with access, support with mobility, allergies etc" CustomCaption="Is there anything else we should know to support you with your visit?" />
    </div>



    <p>We would like to keep in touch with you to update you on College news, events and important applicant deadlines</p>
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