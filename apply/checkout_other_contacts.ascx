<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_other_contacts.ascx.vb" Inherits="webcontrols_checkout_other_contacts" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%
'Dim OfferingID As Integer
'If WorkingData.ShoppingCart.Items.Count > 0 Then
'    OfferingID = WorkingData.ShoppingCart.Items(0).OfferingID
'Else
'    OfferingID = 0
'End If
%>

<br />
<br />

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
<li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_applications.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/supporting_you.ascx"><i class="fa-solid fa-hand-holding-medical"></i> <span class="d-none d-sm-inline">Supporting You</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-users"></i> Emergency Contact Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 60%">60%</div>
</div>


<div class="bd-callout bd-callout-askham-warning bd-callout-fees">
    <h4><i class="fa-solid fa-triangle-exclamation"></i> Required Information</h4>
    <p>
        <%If Is19Plus = True %>
            You must provide us with at least one emergency contact.
        <%Else %>
            As you were born after <%=DateIsAdult.ToShortDateString %> you must provide us with the details of at least one parent or guardian.
        <%End If %>
    </p>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-users"></i> <asp:Label runat="server" ID="Contact1Label">Contact Details - Emergency Contact 1</asp:Label></h4>
<%--    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1ContactTypeID" ID="fldContact1ContactTypeID" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="Contact Type" />
    </div>--%>
    <div class=" form-group">
        <label for="Contact1Forename" style="font-weight: bold">Forename</label>
        <input runat="server" type="text" id="Contact1Forename" class="form-control" name="Contact1Forename" IsRequired="true" ClientIDMode="Static" title="Please enter a valid Forename" />
        <asp:CustomValidator ID="Contact1ForenameValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <label for="Contact1Surname" style="font-weight: bold">Surname</label>
        <input runat="server" type="text" id="Contact1Surname" class="form-control" name="Contact1Surname" IsRequired="true" ClientIDMode="Static" title="Please enter a valid Surname" />
        <asp:CustomValidator ID="Contact1SurnameValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group d-none">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1" ID="fldContact1" runat="server" IsRequired="false" LabelWidth="200" ClientIDMode="Static" CustomCaption="Name" />
    </div>    
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Title" ID="fldContact1Title" runat="server" IsRequired="false" LabelWidth="200" ClientIDMode="Static" CustomCaption="Title" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="fldContact1RelationshipID" runat="server" IsRequired="true" LabelWidth="200" ClientIDMode="Static" CustomCaption="Relationship" />
    </div>
    <div class=" form-group">
        <span class="textfieldlabelrequired">Mobile</span>
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1MobileTel" ID="fldContact1MobileTel" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Mobile" />
        <asp:CustomValidator ID="fldContact1MobileTelValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <span class="textfieldlabelrequired">Home Landline</span>
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="fldContact1Tel" runat="server" LabelWidth="0" CustomCaption="Home Landline" />
        <asp:CustomValidator ID="fldContact1TelValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1EmailAddress" ID="fldContact1EmailAddress" runat="server" LabelWidth="200" CustomCaption="Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>
    
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsLivingWithContact1" ID="fldIsLivingWithContact1" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="Are You Living with this Person?" />
    </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-users"></i> <asp:Label runat="server" ID="Contact2Label">Contact Details - Emergency Contact 2</asp:Label></h4>
    <%--<div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2ContactTypeID" ID="fldContact2ContactTypeID" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="Contact Type" />
    </div>--%>
    <div class="mb-3">
        <label for="Contact2Forename" style="font-weight: normal">Forename</label>
        <input runat="server" type="text" id="Contact2Forename" class="form-control" name="Contact2Forename" IsRequired="false" ClientIDMode="Static" title="Please enter a valid Forename" />
    </div>
    <div class="mb-3">
        <label for="Contact2Surname" style="font-weight: normal">Surname</label>
        <input runat="server" type="text" id="Contact2Surname" class="form-control" name="Contact2Surname" IsRequired="false" ClientIDMode="Static" title="Please enter a valid Surname" />
    </div>
    <div class=" form-group d-none">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2" ID="fldContact2" runat="server" IsRequired="false" LabelWidth="200" ClientIDMode="Static" CustomCaption="Contact2 Name" />
    </div>    
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Title" ID="fldContact2Title" runat="server" IsRequired="false" LabelWidth="200" ClientIDMode="Static" CustomCaption="Title" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2RelationshipID" ID="fldContact2RelationshipID" runat="server" IsRequired="false" LabelWidth="200" ClientIDMode="Static" CustomCaption="Relationship" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2MobileTel" ID="fldContact2MobileTel" runat="server" IsRequired="false" LabelWidth="200" CustomCaption="Mobile" />
        <asp:CustomValidator ID="fldContact2MobileTelValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Tel" ID="fldContact2Tel" runat="server" LabelWidth="200" CustomCaption="Home Landline" />
        <asp:CustomValidator ID="fldContact2TelValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2EmailAddress" ID="fldContact2EmailAddress" runat="server" LabelWidth="200" CustomCaption="Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsLivingWithContact2" ID="fldIsLivingWithContact2" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Are You Living with this Person?" />
    </div>
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

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

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let contact1Forename = document.getElementById(`Contact1Forename`);
        let contact1Surname = document.getElementById(`Contact1Surname`);
        let contact2Forename = document.getElementById(`Contact2Forename`);
        let contact2Surname = document.getElementById(`Contact2Surname`);

        contact1Forename.addEventListener(`keyup`, function (event) {
            updateContactName(`txtContact1`, `Contact1Forename`, `Contact1Surname`);
        });
        contact1Surname.addEventListener(`keyup`, function (event) {
            updateContactName(`txtContact1`, `Contact1Forename`, `Contact1Surname`);
        });
        contact2Forename.addEventListener(`keyup`, function (event) {
            updateContactName(`txtContact2`, `Contact2Forename`, `Contact2Surname`);
        });
        contact2Surname.addEventListener(`keyup`, function (event) {
            updateContactName(`txtContact2`, `Contact2Forename`, `Contact2Surname`);
        });

        //Re-order fields so most common values are moved to the top
        let titleContact1Dropdown = document.getElementById(`cboContact1Title`);
        sortSelectMoveToTop(titleContact1Dropdown, "Ms");
        sortSelectMoveToTop(titleContact1Dropdown, "Miss");
        sortSelectMoveToTop(titleContact1Dropdown, "Mrs");
        sortSelectMoveToTop(titleContact1Dropdown, "Mr");
        sortSelectMoveToTop(titleContact1Dropdown, "");
        let titleContact1DropdownInputBox = addSearchableDropDown(titleContact1Dropdown);

        let fldContact1RelationshipID = document.getElementById(`cboContact1RelationshipID`);
        sortSelectMoveToTop(fldContact1RelationshipID, "3080");
        let fldContact1RelationshipIDInputBox = addSearchableDropDown(fldContact1RelationshipID);

        let titleContact2Dropdown = document.getElementById(`cboContact2Title`);
        sortSelectMoveToTop(titleContact2Dropdown, "Ms");
        sortSelectMoveToTop(titleContact2Dropdown, "Miss");
        sortSelectMoveToTop(titleContact2Dropdown, "Mrs");
        sortSelectMoveToTop(titleContact2Dropdown, "Mr");
        sortSelectMoveToTop(titleContact2Dropdown, "");
        let titleContact2DropdownInputBox = addSearchableDropDown(titleContact2Dropdown);

        let fldContact2RelationshipID = document.getElementById(`cboContact2RelationshipID`);
        sortSelectMoveToTop(fldContact2RelationshipID, "3080");
        let fldContact2RelationshipIDInputBox = addSearchableDropDown(fldContact2RelationshipID);
    });
</script>