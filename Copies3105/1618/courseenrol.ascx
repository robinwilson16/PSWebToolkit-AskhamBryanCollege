<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="courseenrol.ascx.vb" Inherits="courseenrol"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

        <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->
    <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" />

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
            <asp:BoundField DataField="SiteDescription" HeaderText="Campus" />
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="false">
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


<h2>EXAMPLE - wording required</h2>
  <div class="alert alert-danger"><h4>To avoid timeouts, ensure all of your previous connections have been closed, before you begin the enrolment form......</h4></div>

<p><strong>Please ensure you have the following information available in order to make a successful submission:</strong></p>

  <ul>
      <li>Your address details, mobile number and email address</li>
       <li>Yuor parent / guardian or emrgency contact details</li>
      <li>If you have any English or Maths qualifications, their grades.</li>
 
  </ul>

<p><strong>Please note the following important information</strong></p>
<ul>
    <li>Remember to click the <strong>Submit button at the end of the form</strong>, otherwise we will not receive your enrolment</li>
    <li>Submitting this form does not guarantee you a place, it is subject to validation by the college and follow up IAG and IA (if not already done) to ensure this is right course for you.</li>
</ul>
   <div class="alert alert-danger"><h4>This session will remain active for 40 minutes before it expires - you will have to start again if the session expires</h4></div>
        <cc1:CCCButton ID="btnContinue6" runat="server" Text="Start " CssClass="button" LinkResource="checkout_enrolments_1618_aspx" />
