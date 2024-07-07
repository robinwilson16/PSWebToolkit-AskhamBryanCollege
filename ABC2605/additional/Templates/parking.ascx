<%@ Control Language="VB" AutoEventWireup="false" CodeFile="parking.ascx.vb" Inherits="parking" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%--<ol class="breadcrumb" runat="server">
<li class="active">Results Day</li>
</ol>--%>
<div class="intro-block"><h1>Parking Permit</h1></div>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

  
        <div class="form-field-section grey">
            <h3>Details  </h3>

            <h4>Please provide your basic information, and vehicle details</h4>

            <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="StudentEnrolmentField2" runat="server" IsRequired="True" LabelWidth="300" CustomCaption="Student Reference Number (Found in your Email)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="First Name" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname" />
    </div>  
     <div class=" form-group">
        <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"  LabelWidth="300" ClientIDMode="Static"/>
    </div>    
        

<br />
<hr />


  <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CarMake" ID="StudentEnrolmentField3" runat="server" IsRequired="True" LabelWidth="300" CustomCaption="Vehicle Make" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CarModel" ID="StudentEnrolmentField4" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Vehicle Model" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CarColour" ID="StudentEnrolmentField5" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Vehicle Colour" />
    </div>  
     <div class=" form-group">
        <cc1:StudentEnrolmentField id="StudentEnrolmentField6" runat="server" IsRequired="true" StudentEnrolmentFieldType="CarReg"  LabelWidth="300" ClientIDMode="Static" CustomCaption="Registration Number (Number Plate)" />
    </div>    
        </div>

<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" />
