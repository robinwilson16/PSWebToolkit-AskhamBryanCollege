<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_employment.ascx.vb" Inherits="webcontrols_checkout_employment" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_parent_guardian.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_enrolments2.ascx"><i class="fa-solid fa-clipboard-list"></i> <span class="d-none d-sm-inline">Further Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_quals_on_entry.ascx"><i class="fa-solid fa-award"></i> <span class="d-none d-sm-inline">Qualifications on Entry</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-city"></i> Employment Status</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 60%">60%</div>
</div>
    
       <script type="text/javascript">
         $(document).ready(function () {

            if ($("#<%=selectEmployed.ClientID%>").val() == "10") {
                     $("#divEmploymentLength").show();
          

                 }
                 else if ($("#<%=selectEmployed.ClientID%>").val() == "11") {
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
                 else if ($("#<%=selectEmployed.ClientID%>").val() == "11") {
                     $("#divUnEmploymentLength").show();
                     return;
                 }
             });
         });
 
       </script>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-city"></i> Employment Status</h4>

      <div class="row">
          <div class="form-input"> 
              <span class="textfieldlabelrequired">What will be your employment status the day before you start your studies?</span>
             <asp:DropDownList ID="selectEmployed" runat="server"   EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="10">In paid employment</asp:ListItem>
             <asp:ListItem value="11">Not in paid employment, looking for work</asp:ListItem>
             <asp:ListItem value="12">Not in paid employment, not looking for work</asp:ListItem>
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
              <span class="textfieldlabelrequired">I have worked (number of months)</span>
             <asp:DropDownList ID="selectEmploymentLength" runat="server"   EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="1">Upto 3 months</asp:ListItem>
             <asp:ListItem value="2">4 to 6 months</asp:ListItem>
             <asp:ListItem value="3">7 to 12 months</asp:ListItem>
             <asp:ListItem value="4">Over 12 months</asp:ListItem>
             </asp:DropDownList>
          </div>

        <div class="form-input">
              <span class="textfieldlabelrequired">I work (hours per week)</span>
             <asp:DropDownList ID="selectEmploymentIntensity" runat="server"    EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="5">Employed for 1 to 10 hours per week</asp:ListItem>
             <asp:ListItem value="6">Employed for 11 to 20 hours per week</asp:ListItem>
             <asp:ListItem value="7">Employed for 21 to 30 hours per week</asp:ListItem>
             <asp:ListItem value="8">Employed for 31+ hours per week</asp:ListItem>
             </asp:DropDownList>
          </div>

         <div class="form-input">
                 <span class="textfieldlabelrequired">Employed From date</span>
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="DateFrom"  ID="StudentEmploymentHistoryField2" runat="server" IsRequired="false" Width="150" CustomFieldType="Date"
           CustomCaption=" " HTML5InputType="date" />
          </div>
      </div>

   <div class="row"  id="divUnEmploymentLength" style="display:none">
        <div class="form-input"> 
              <span class="textfieldlabelrequired">Length of time unemployed</span>
             <asp:DropDownList ID="selectLengthUnemployed" runat="server"  EnableViewState="true" ClientIDMode="Static">
             <asp:ListItem value="">--Please Select--</asp:ListItem>
             <asp:ListItem value="1">Less than 6 months</asp:ListItem>
             <asp:ListItem value="2">6 to 11 months</asp:ListItem>
             <asp:ListItem value="3">12 to 23 months</asp:ListItem>
             <asp:ListItem value="4">24 to 35 months</asp:ListItem>
             <asp:ListItem value="5">36 months or over</asp:ListItem>
             </asp:DropDownList>
          </div>
 
      </div>
    </div>
      
<!--
  <asp:button runat="server" id="btnNoPreviousEmployment" cssClass="show_hide btn btn-primary" text="No previous employment" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
    -->
<%-- <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_quals_on_entry_1618_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" />--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="checkout_quals_on_entry_1618_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldEmployedInputBox = addSearchableDropDown(selectEmployed);
        let fldEmploymentLengthInputBox = addSearchableDropDown(selectEmploymentLength);
        let fldEmploymentIntensityInputBox = addSearchableDropDown(selectEmploymentIntensity);
        let fldLengthUnemployedInputBox = addSearchableDropDown(selectLengthUnemployed);
    });
</script>