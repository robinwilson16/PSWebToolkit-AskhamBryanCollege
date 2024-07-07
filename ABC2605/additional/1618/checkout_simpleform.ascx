<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_simpleform.ascx.vb" Inherits="webcontrols_checkout_enrolments" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<h3><asp:Label runat="server" ID="lblcourse"></asp:Label></h3>
<h3><asp:Label runat="server" ID="lblAge"></asp:Label></h3>
<h3><asp:Label runat="server" ID="lblOfferingType"></asp:Label></h3>
<h3><asp:Label runat="server" ID="lblEnrolmentType"></asp:Label></h3>
<h3><asp:Label runat="server" ID="lblMoA"></asp:Label></h3>
<h3><asp:Label runat="server" ID="lblLevel"></asp:Label></h3><br />
            
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>



<div class="container">
   <div class="row">
      <div class="col-sm-12 columns form-group"> 
        <h2>Personal Details</h2><p>Please note all fields marked with <strong>*</strong> are required. </p>
          </div>
  </div>

  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"  CustomCaption="* Date of birth"/>
          </div>

   </div>
  </div>

   <!--  <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx"/> -->
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="checkout_employment_adult_aspx" CausesValidation="true" EnableEnterKey="true" />


