<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply6.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li id="liEmergency" runat="server">Emergency Contact Details</li> 
                    <li>Employment Qualifications and References</li>
                    <li>Personal Statement</li>
                    <li>Supporting You</li>
                    <li><strong>Data Protection</strong></li>
                    </ol>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>

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

    
    

<h2 class="app-title">Data Protection and Declaration</h2>

    <h5>Data protection statement</h5>

    <p>I agree to the College processing my personal and sensitive data to assess my application and shortlist interviewees. I also agree to the College sharing my details with relevant organisations to support my application.  The College retains data for 2 months for unsuccessful applicants, 10 years for successful ones.
    The College holds personal data in accordance with the College data retention policy which is available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>. All data will remain at all times within the UK and European Economic Area (“EEA”). Applicants can withdraw consent at any time (though this may have consequences for your application).
    Concerns can be reported to the College Data Protection Officer <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> and complaints made to the ICO <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a></p>
    <p>I confirm that the information given on this form is true, complete and accurate and no information or other material information has been omitted. I accept that if this is not the case, UCAS shall have the right to cancel my application and I shall have no claim against UCAS or any other higher education institution or college in relation thereto. I give my consent to the processing of my data by UCAS and educational establishments. I also accept that, having completed and signed the form, I do not have the right to further choices within the UCAS scheme and will not approach any other university or college in the UCAS scheme. You have the right to cancel this application. If you decide not to take up your place at the university or college you must do this by informing the university or college who have offered you the place as soon as possible.</p>
     
    <hr />

    <h5>Declaration</h5>

    <div class="form-input">
        <p><B>Please read the following statements.</B></p>
        
     <ul>
         <li>I agree that the information provided on this form is accurate and true.</li>
         <li>I have read and agree with the statements above.</li>
     </ul>  
    </div>
       
    <div class="form-input">
        <p><b>Please tick to acknowledge the above statements.</b></p>
            <asp:CheckBox ID="chkConfirm" runat="server" Text="" Font-Bold="True" CausesValidation="True" />

    </div>

    <hr />

    <h5>Future Marketing</h5>

    <span class="textfieldlabelrequired">We would like to keep in touch with you regarding College information and other College events. </span>

    <asp:DropDownList ID="rdoConsent" runat="server">
        <asp:ListItem Value="" Text="--please select-"></asp:ListItem>
        <asp:ListItem Value="1" Text="Yes - please use my contact details to keep me informed about College information and events"></asp:ListItem>
        <asp:ListItem Value="0" Text="No - I do not wish to be contacted about College information and events"></asp:ListItem>
    </asp:DropDownList>

</div>
   
    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" CausesValidation="true" CssClass="button" />



<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<style>

    input[type=checkbox]{

        margin-inline-start:100px;
        width:50px;
        height:30px;
     

    }
</style>
  

