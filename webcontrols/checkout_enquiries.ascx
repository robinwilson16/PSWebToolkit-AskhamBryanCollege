<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enquiries.ascx.vb" Inherits="webcontrols_checkout_enquiries" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>



  
<div class="form-field-section grey">
    <h2 class="app-title">Enquiry form</h2>

        <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="200" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="200"  AutoFocus="true"/>
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="false" StudentEnrolmentFieldType="DateOfBirth"  LabelWidth="200" ClientIDMode="Static" />
    </div>
 
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server"  LabelWidth="200" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$"/>
    </div>
    <div class=" form-group">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="200" HTML5InputType="email" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>

        <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined1" ID="fldType" runat="server" IsRequired="true" LabelWidth="300" CustomFieldType="Lookup" CustomCaption="Nature of Enquiry"  />
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Enquiry" ID="StudentEnrolmentFieldEnquiry" runat="server" IsRequired="true" 
            LabelWidth="200" CustomFieldType="Other" HTML5InputType="text" Placeholder="Please provide details of your enquiry" />
    </div>
</div>

        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" LinkResource="checkout_makepayment_aspx" CausesValidation="true" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />