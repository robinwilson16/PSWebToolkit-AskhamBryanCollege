<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolments2.ascx.vb" Inherits="webcontrols_checkout_enrolments2" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<!--<br />
<div class="container">
   <div class="row">
      <div class="col-sm-12 columns form-group"> 
                <asp:Label runat="server" ID="lblAge"></asp:Label>
          </div>   

   </div>
       <div class="row">
         
       <div class="col-sm-12 columns form-group"> 
<asp:Label runat="server" ID="lblAgeCourse"></asp:Label>
          </div>
       </div>
    </div>
<br />
    -->

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_parent_guardian.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-clipboard-list"></i> Further Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 40%">40%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-clipboard-list"></i> Further Details</h4>

     <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="fldNationalityID" runat="server" IsRequired="true" CustomCaption="Nationality" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldNationalityIDValidator" runat="server"></asp:CustomValidator>
           </div>
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="fldCountryID" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="Main Country of residence (last 3 years)?" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldCountryIDValidator" runat="server"></asp:CustomValidator>
           </div>
 
    </div>
    <hr />

          <p><strong>For equality of opportunity monitoring, please select to describe your cultural background (groups based on 2011 census) below:</strong></p>
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="fldEthnicGroupID" runat="server" IsRequired="false"  ExcludedIDValues="99" CustomCaption="Ethnicity" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldEthnicGroupIDValidator" runat="server"></asp:CustomValidator>
          </div>
    
   </div>
   <hr />

        
    <div class="form-input">
          <span class="textfieldlabelrequired">Do you consider that you have a learning difficulty, disability or health condition?</span>
      
            <asp:DropDownList runat="server" ID="selectLearnDiff"  CssClass="form-input" AutoPostBack="true">
                <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                <asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>
            </asp:DropDownList>
            <asp:CustomValidator ID="selectLearnDiffValidator" runat="server"></asp:CustomValidator>
          <div style="display:none">
             <cc1:StudentEnrolmentField Visible="true" ClientIDMode="Static" StudentEnrolmentFieldType="LearningDiffOrDisID" ID="fldLearningDiffOrDisID" runat="server" IsRequired="false"   />
      </div>
        <i> *It is your responsibility to disclose any support requirements. This will help the College make reasonable adjustments, limited by funding available.</i>
          </div>
    <br />

<div class="form-input" id="disfields" >
<%--    <div class="panel-heading">Disability Category</div>--%>
    <p></p>
    <asp:Button runat="server" visible="false" ID="btnNoDisability" CssClass="button button-orange" Text="No learning difficulty, disability or health condition" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />

    <div id="slidingdiv" class="slidingDiv" runat="server">
        <%--<asp:Table class="table table-striped text-center" ID="tblDisability" runat="server">--%>
            <%--<tr><th>Qualification</th><th>Subject (if not in list)</th><th>Predicted Grade</th><th>Grade</th><th>Date Awarded</th></tr>--%>
        <%--</asp:Table>--%>

        <p><strong>Learning difficulty, disability or health condition</strong></p>
        <p>Please indicate your primary 'main' condition which could impact on your studies</p>
        <div class="row" runat="server" id="Disabilities">

        </div>

        <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add Row"></asp:Button>

    </div>
    <asp:CustomValidator ID="DisabilitiesValidator" runat="server"></asp:CustomValidator>

</div>

<%--    <div class="row"  id="disfields">
      <div class="col-sm-6 columns form-group"> 
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="stuDisabilityCategory1ID" runat="server" LabelWidth="550" IsRequired="false" CustomCaption="* Please indicate your primary 'main' condition which could impact on your studies" ExcludedIDValues="99"/>
              <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" runat="server" Visible="true" IsRequired="false"  LabelWidth="400" CustomCaption="And, if appropriate, a secondary condition" />
        </div>

      </div>--%>
    <br />
    <hr />
     <div class="row">
         <div class="col-sm-12 columns form-group">
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="LookedAfter" ID="StudentEnrolmentField3" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are currently in care?"/>
          </div>
          </div>
    <br />
      <p>Have you recently left care (care leaver)? - A care leaver is a young person aged 16-25 who has been 'looked after' at some point by a local authority (for example placed with foster carers) since the age of 14, and in care on or after their 16th birthday.</p>
      <div class="row">
         <div class="col-sm-12 columns form-group">
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="StudentEnrolmentField16" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are a care leaver?"/>
          </div>
          </div>
   <p>Do you look after a family member who may have a physical disability, a long-term illness, a mental health problem or drug / alcohol dependencies (young carer)?</p>
          <div class="row">
         <div class="col-sm-12 columns form-group">
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="YoungCarer" ID="StudentEnrolmentField7" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are a young carer?"/>
          </div>
          </div>  


        <%--<cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" />
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" EnableEnterKey="true" />--%>
</div>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
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

<asp:HiddenField ID="NoDisability" Value="false" runat="server" ClientIDMode="static" />
<asp:HiddenField ID="intDisabilityRows" Value="0" runat="server" ClientIDMode="static" />

<script type="text/javascript">
<%--    $(document).ready(function () {

            //$("#disfields").hide();
            if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
            }
            $('#<%= selectLearnDiff.ClientID %>').change(function () {
              //  $('#cboLearningDiffOrDisID').val($(this).val());
            if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
                    return;
                }
                else {
                $("#disfields").hide();
                }
            });


    });--%>
</script>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldNationalityIDInputBox = addSearchableDropDown(cboNationalityID);
        let fldCountryIDInputBox = addSearchableDropDown(cboCountryID);
        let fldEthnicGroupIDInputBox = addSearchableDropDown(cboEthnicGroupID);

        let selectBoxes = document.querySelectorAll(`#aspnetForm select`);

        selectBoxes.forEach(function (select) {
            if (select.name.indexOf(`cboDisabilityCategoryID`) >= 0) {
                let disabilityCategoryIDInputBox = addSearchableDropDown(select);
            }
        });

        let checkBoxes = document.querySelectorAll(`#aspnetForm input[type=checkbox]`);

        checkBoxes.forEach(function (checkbox) {
            if (checkbox.name.indexOf(`chkIsPrimary`) >= 0) {
                checkbox.addEventListener(`change`, function (event) {
                    untickOtherPrimaryOptions(checkbox);
                });
            }
        });
    });

    function untickOtherPrimaryOptions(clickedCheckbox) {
        let checkBoxes = document.querySelectorAll(`#aspnetForm input[type=checkbox]`);

        checkBoxes.forEach(function (checkbox) {
            if (checkbox.name.indexOf(`chkIsPrimary`) >= 0) {
                if (checkbox.id != clickedCheckbox.id) {
                    checkbox.checked = false;
                }
            }
        });
    }
</script>
