<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_parent_guardian.ascx.vb" Inherits="webcontrols_checkout_parent_guardian" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<!--
<br />
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
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-users"></i> Emergency Contact Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 30%">30%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-users"></i> <asp:Label runat="server" ID="Contact1Label">Emergency Contact Details</asp:Label></h4>

    <div class="row">
      <div class="col-sm-12 columns form-group"> 
            <p><strong>If you are aged under 18, we MUST</strong> have details of a <strong>parent, guardian or carer</strong> we can contact in case of an emergency. <strong>If aged 18 or over</strong>, please provide details of a <strong>next of kin.</strong> The person must know they are your emergency contact.</p>
        </div>
  </div>

  <div class="row">
      <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentFirstName" ID="fldParentFirstName" runat="server" IsRequired="true" CustomCaption="First name"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentSurname" ID="fldParentSurname" runat="server" IsRequired="true"  CustomCaption="Surname"/>
          </div>
   </div>

          <div class="row">
        <div class="col-sm-12 columns form-group"> 
                       <p><strong>You must provide at least one Parent, Guardian or Carer phone number below:</strong></p>
            </div>
       </div>
    <div class="row">
            <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentMobileTel" ID="StudentEmailField1" runat="server" IsRequired="false" Placeholder="Mobile numbers beginning 07" CustomCaption="Mobile Number (eg 07)" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
        </div>
       <div class="col-sm-6 columns form-group">
                   <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentPhoneNumber" ID="StudentEnrolmentField10" runat="server" LabelWidth="350" CustomCaption="Contact phone (inc. STD code)" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
    </div>
     </div>

     <div class="row">
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentEmailAddress" ID="fldEmail" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="Email Address" />
        </div>
         <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentRelationshipID" ID="fldParentRelationshipID" runat="server" IsRequired="true"  CustomCaption="Relationship" ClientIDMode="Static" />
            </div>
     </div>
   
<%--     <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find an address by entering postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>
      <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
    <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress1" ID="txtAddress1" runat="server" IsRequired="true" CustomCaption="First Line of Address" />
    </div>
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress2" ID="txtAddress2" runat="server" IsRequired="false"  CustomCaption="Second Line of Address"  />
    </div>
</div>
  <div class="row">
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress3" ID="txtAddress3" runat="server" IsRequired="true"  CustomCaption="Town"  />
    </div>
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress4" ID="txtAddress4" runat="server" IsRequired="true"  CustomCaption="County"  />
    </div>
      </div>
    <div class="row">
         <div class="col-sm-12 columns form-group">
             <label for="postcode" class="textfieldlabelrequired">Postcode</label>
             <input title="Postcode" runat="server" maxlength="9" type="text" id="postcode" class="form-control" name="pre[postalcode]" autocomplete="off"   />
             </div>
        </div>
    </div>

    <%If ConsentRequired = True %>
    <hr />

        <div class="row">
            <div class="col-sm-12 columns form-group">
                <p><strong>As you are under 18,</strong> we would also like to discuss your progress on your course with your parents/guardian/carer. Please confirm if you consent to us doing so. You can withdraw your consent at any time by contacting Student Records. <strong>We reserve the right to discuss e.g. your attendance, behaviour, financial matters including bursaries and any safeguarding issues with your named contacts.</strong></p>
         <span class="textfieldlabelrequired"> Please confirm</span>
         <asp:DropDownList runat="server" ID="ddConsent" CssClass="form-group" ClientIDMode ="Static">
            <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
         </asp:DropDownList>
            </div>
        </div>
    <%End If %>
 </div>




        <%--<cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_enrolments_1618_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  LinkResource="checkout_enrolments2_1618_aspx" CausesValidation="true" EnableEnterKey="true" />--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="checkout_enrolments_1618_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" LinkResource="checkout_enrolments2_1618_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldParentRelationshipIDInputBox = addSearchableDropDown(cboParentRelationshipID);
    });
</script>