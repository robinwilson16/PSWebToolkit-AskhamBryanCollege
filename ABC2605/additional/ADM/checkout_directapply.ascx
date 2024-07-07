<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 15%;" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li><strong>Personal Details</strong></li>
                    <li>Address</li>                   
                    <li>Supporting You</li>
                    <li>Contact Information</li>
                    <li>Education</li>
                    <li>Data Protection</li>
                    </ol>



<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Course Name">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="SiteDescription" HeaderText="Site" />
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="false">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
        </Columns>
        <RowStyle CssClass="searchgridcell" />
        <HeaderStyle CssClass="searchgridheader" />
        <EmptyDataTemplate>
            <p>
                No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.
            </p>
        </EmptyDataTemplate>
    </asp:GridView>
</div>



<div class="form-field-section grey">
    <h2 class="app-title">Personal Details</h2>
    <hr />

    <p><strong>Please note that all fields on this form marked with a <span class="textfieldlabelrequired"></span> must be completed in order to submit the form.</strong></p>

    <br />
 
          <div class="form-input">    
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="StudentEnrolmentField3" runat="server" IsRequired="true"  />
     </div>
       <div class="form-input">      
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Sex" ID="fldSex" runat="server" IsRequired="true"  CustomCaption="Gender at birth"/>
     </div>`
         <div class="form-input">      
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PreferredPronounID" ID="StudentEnrolmentField4" runat="server" IsRequired="true"  CustomCaption="Preferred Pronoun"/>
     </div>


    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="First Name" />
    </div>
    <p><i>This should be your legal name. This will then be used for all our communications, official documents (e.g. certificates), and correspondence.</i></p>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="knownas" ID="StudentEnrolmentField2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Known as name (if different to legal first name)" />
    </div>

    <%--<div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Middle Name(s)" />
    </div>--%>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="StudentEnrolmentField10" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Last Name" />
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField ID="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth" CustomCaption ="Date of Birth dd/mm/yyyy" LabelWidth="300" ClientIDMode="Static" Placeholder="dd/mm/yyyy" />
    </div>

    <div class="form-input">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField7" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Email Address" />
    </div>

</DIV>


 <cc1:CCCButton ID="btnBack" runat="server" Text="Start Again" LinkResource="checkout_home_aspx" CssClass="button" Visible ="true" /> 
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />
<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />




   