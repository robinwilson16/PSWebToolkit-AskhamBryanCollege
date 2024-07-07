<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply4.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 66.4%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li id="liEmergency" runat="server">Emergency Contact Details</li> 
                    <li>Employment Qualifications and References</li>
                    <li><strong>Personal Statement</strong></li>
                    <li>Supporting You</li>
                    <li>Data Protection</li>
                    </ol>

<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="CourseInformation" HeaderText="Course Name">
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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="true">
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
    <h2 class="app-title">Your Personal Statment</h2>
    <hr />

<div id="divPersonalStatement" runat="server" visible="true">
    <div class="form-input">
        <p>You are required to provide a personal statment to support your application. Please Include:</p>
        
     <ul>
         <li>Why have you chosen to study this course? Do you have a specific career in mind for the future?</li>
         <li>Tell us about any of your achievements e.g. sports teams, voluntary work, success in school, extra curriculum activities.</li>
         <li>What are your hobbies and interests outside of study?</li>
     </ul> 

        <strong>Please limit your personal statement to no more than 1 A4 side.</strong>
        <asp:TextBox  class="form-control z-depth-1" runat="server" TextMode="MultiLine" ID="personalstatement" rows="20" Columns="100" Width="100%"  placeholder="Write something here..."></asp:TextBox>

    </div>
</div>

</div>


    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />

<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />


