<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="checkout_dataprotection_apponly.ascx.vb" Inherits="checkout_dataprotection_apponly"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

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
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_other_contacts.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_quals_on_entry.ascx"><i class="fa-solid fa-award"></i> <span class="d-none d-sm-inline">Qualifications on Entry</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_attachments.ascx"><i class="fa-solid fa-paperclip"></i> <span class="d-none d-sm-inline">Documents/Evidence</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-pen-to-square"></i> Declaration</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 90%">90%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-pen-to-square"></i> Declaration</h4>
    <p>
        If I am accepted on to the course for which I am now applying, I agree to observe all <strong><a href="https://www.askham-bryan.ac.uk/college-policies/" target="_blank" rel="noopener"><i class="fa-solid fa-arrow-up-right-from-square"></i> Askham-Bryan College Policies and Procedures</a></strong>
    </p>
    <p>
        I understand that the College will store the information on this form in accordance with data protection legislation.
    </p>
    
        <br />
        <p>
        <asp:CheckBox ID="chkConfirm" runat="server" 
                Text="I agree to observe all Askham-Bryan College Policies and Procedures" Font-Bold="True" />
        <asp:CustomValidator ID="chkConfirmValidator" runat="server"></asp:CustomValidator>
    </p>   
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-file-signature"></i> Signature</h4>

    <uc1:StudentSignature runat="server" ID="StudentSignature" />
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" LinkResource="attachments_abc" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Submit </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" />
            </span>
        </div>
    </div>
</div>
