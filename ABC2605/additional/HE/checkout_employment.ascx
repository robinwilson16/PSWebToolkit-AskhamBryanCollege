<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_employment.ascx.vb" Inherits="webcontrols_checkout_employment" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 62.5%;" aria-valuenow="62.5" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li>Further Details</li>
                    <li>Qualifications</li>
                    <li><Strong>Employment</Strong></li>
                    <li>Attachments</li>
                    <li>Photo</li>
                    <li>Declarations</li>
                    </ol>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    
       <script type="text/javascript">
         $(document).ready(function () {

            if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                     $("#divEmploymentLength").show();
          

                 }
                 else if (($("#<%=selectEmployed.ClientID%>").val() == "11") || $("#<%=selectEmployed.ClientID%>").val() == "12") {
                $("#divUnEmploymentLength").show();
             }
             $('#<%= selectEmployed.ClientID %>').change(function () {
                 $("#divEmploymentLength").hide();
           
                 $("#divUnEmploymentLength").hide();
           
                 $("#<%=selectEmploymentLength.ClientID%>").val("")
                 $("#<%=selectEmploymentIntensity.ClientID%>").val("")
                 $("#<%=selectLengthUnemployed.ClientID%>").val("")
                 if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                     $("#divEmploymentLength").show();
             
                     return;
                 }
                 else if (($("#<%=selectEmployed.ClientID%>").val() == "11") || $("#<%=selectEmployed.ClientID%>").val() == "12") {
                     $("#divUnEmploymentLength").show();
                     return;
                 }
             });
         });
 
       </script>

<div class="form-field-section grey">

  <div class="row">
      <div class="col-sm-12 columns form-group"> 
           <h2>Employment Status</h2>
          </div>
      </div>

      <div class="row">
        <div class="form-input"> 
             <span class="textfieldlabelrequired">Please tell us your employment status</span>
             <asp:DropDownList ID="selectEmployed" runat="server"   EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
             <asp:ListItem value="10">In paid employment</asp:ListItem>
            <asp:ListItem value="11">Not in paid employment, looking for work and available to start work</asp:ListItem>
            <asp:ListItem value="12">Not in paid employment, not looking for work and/or not available to start work</asp:ListItem>
             </asp:DropDownList>
          </div>
      </div>
    <!-- START YES Employed - These are all related to YES employed -->


      <div class="row"  id="divEmploymentLength" style="display:none">
            <div class="form-input">
         <span class="textfieldlabelrequired">Are you self Employed?</span>
        <asp:RadioButtonList runat="server" ID="rdoSelfEmp" >
            <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>        
        </asp:RadioButtonList>
              </div>
          <div class="form-input">
              <span class="textfieldlabelrequired">Length of time in employment</span>
             <asp:DropDownList ID="selectEmploymentLength" runat="server"   EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="1">Upto 3 months</asp:ListItem>
             <asp:ListItem value="2">4-6 months</asp:ListItem>
            <asp:ListItem value="3">7-12 months</asp:ListItem>
                 <asp:ListItem value="4">Over 12 months</asp:ListItem>
             </asp:DropDownList>
          </div>

        <div class="form-input">
              <span class="textfieldlabelrequired">Hours per week</span>
             <asp:DropDownList ID="selectEmploymentIntensity" runat="server"    EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="5">Employed for 0 to 10 hours per week</asp:ListItem>
             <asp:ListItem value="6">Employed for 11 to 20 hours per week</asp:ListItem>
            <asp:ListItem value="7">Employed for 21 to 30 hours per week</asp:ListItem>
                 <asp:ListItem value="8">Employed for 31+ hours per week</asp:ListItem>
             </asp:DropDownList>
          </div>
         <div class="form-input">
                 <span class="textfieldlabelrequired">Employed From date</span>
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="DateFrom"  ID="StudentEmploymentHistoryField2" runat="server" IsRequired="false" Width="150" CustomFieldType="Date"
           CustomCaption=" " />
          </div>
      </div>

   <div class="row"  id="divUnEmploymentLength" style="display:none">
        <div class="form-input"> 
              <span class="textfieldlabelrequired">Length of time unemployed</span>
             <asp:DropDownList ID="selectLengthUnemployed" runat="server"  EnableViewState="true">
             <asp:ListItem value="">Please select...</asp:ListItem>
                 <asp:ListItem value="1">Less than 6 months</asp:ListItem>
             <asp:ListItem value="2">6-11 months</asp:ListItem>
            <asp:ListItem value="3">12-23 months</asp:ListItem>
                 <asp:ListItem value="4">24-25 months</asp:ListItem>
                          <asp:ListItem value="5">Over 36 months</asp:ListItem>
             </asp:DropDownList>
          </div>
 
      </div>
    </div>
      
<!--
  <asp:button runat="server" id="btnNoPreviousEmployment" cssClass="show_hide btn btn-primary" text="No previous employment" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
    -->
 <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_quals_on_entry_HE_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" />
<br />

