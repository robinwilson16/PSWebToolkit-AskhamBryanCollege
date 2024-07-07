<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enquiriesGENERAL.ascx.vb" Inherits="webcontrols_checkout_enquiriesGENERAL" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>


  
<div class="form-field-section grey">
    <h2 class="app-title">General Enquiries</h2>
    
 
<br />
    <br />
   
   
   
    <%--<div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Enquiry" ID="fldEnquiry" runat="server" CustomFieldType="Other" IsRequired="true" LabelWidth="200" CustomCaption="Please provide some details about your enquiry"/>
    </div>--%>
  
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldfirstname" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="First Name"/>
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
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Enquiry" ID="fldEnquiry" runat="server" IsRequired="true" 
            LabelWidth="200" CustomFieldType="Other" HTML5InputType="text" Placeholder="Your message / any questions you have:" />
    </div>
      
   
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="fldMOb" runat="server" IsRequired="true"  LabelWidth="200" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)"/>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Email" ID="fldEmail" runat="server" IsRequired="true" LabelWidth="200" HTML5InputType="email" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>

      <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" IsRequired="false"  LabelWidth="200" CustomCaption="Home Telephone" />
    </div>

    <asp:CheckBox ID="acceptmarketing" runat="server" Text="I am happy to receive information about future college courses & events">
     
    </asp:CheckBox>

    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcceptMarketingConsent" ID="AcceptMarketingTick" runat="server" LabelWidth="400" />
        </div>
    <br />
        <br />

        <br />
    


     
        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx" Visible="false"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" LinkResource="checkout_makepayment_aspx" CausesValidation="true" CssClass="button" />
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