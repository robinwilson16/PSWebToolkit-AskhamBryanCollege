<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply6.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address</li>
                    <li>Supporting You</li>
                    <li>Contact Information</li>
                    <li>Education</li>
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

    
    

<h2 class="app-title">Data protection and Declaration</h2>

    <h5>Data protection statement</h5>
    <p>I agree to the College processing my personal and sensitive data to assess my application and shortlist interviewees. I also agree to the College sharing my details with relevant organisations to support my application. The College retains Personal Data for at least 1 year for unsuccessful applicants and at least 6 years from completion of course for successful ones. </p>
    <p>The College holds Personal Data in accordance with the College data retention policy which is available at <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a>. All data will remain at all times within the UK and European Economic Area ("EEA"). You can withdraw your consent for this processing at any time (though this may have consequences for your application). </p>
    <p>If you have any concerns about the way Askham Bryan College is using your Personal Data, you can contact the College’s Data Protection Officer, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> If you are still not satisfied with the response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a></p>
   
     <hr />

       <h5>Future Marketing</h5>
    <span class="textfieldlabelrequired">We would like to keep in touch with you to update you on College news, events and important applicant deadlines</span>

    <asp:DropDownList ID="rdoConsent" runat="server">
        <asp:ListItem Value="" Text="--please select-"></asp:ListItem>
        <asp:ListItem Value="1" Text="Yes - please use my contact details to keep me informed"></asp:ListItem>
        <asp:ListItem Value="0" Text="No - I do not wish to be contacted about College information and events"></asp:ListItem>
    </asp:DropDownList>

     <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SentMarketingInfo" ID="fldConsent" runat="server" IsRequired="true" LabelWidth="300" CustomCaption=" " Enabled="True" CustomFieldType="TickBox" />
    </div>

    <br />
    <hr />
    <h5>Declaration</h5>
 
        <div id="divAdult" runat="server">


        <span class="textfieldlabelrequired">Please note, over 19s are usually liable for course fees. For course fees, these will be higher if you live in a devolved authority area. You may be able to find support based on your personal circumstances. Please tick to confirm you acknowledge this. to 'I acknowledge that course for under 19s are free however over 19s are usually liable for course fees. For course fees, these will be higher if you live in a devolved authority area. You may be able to find support based on your personal circumstances. Please tick to confirm you acknowledge this.</span>
            <div class="form-input">
            <asp:CheckBox ID="rdoAdult" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" />
                </div>
        </div>

    <br />
    <span class="textfieldlabelrequired">Please tick to confirm the information provided is accurate and true and that you have read and agree with the data protection statement. </span>
       <div class="form-input">

     <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" /> 
    </div>
 

    <p><i>Applications submitted online will automatically be sent to the Applications Team - you do not need to do anything else.</i></p>
   
    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" CausesValidation="true" CssClass="button" />


</div>
<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<style>

    input[type=checkbox]{

        margin:100px;
        width:50px;
        height:30px;
     

    }
</style>
  


    <script>


        $(document).ready(function () {




            var rdo = document.getElementsByName("<%= rdoConsent.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', false);
            }


            var RadioButtonListEU = document.getElementById("<%= rdoConsent.ClientID%>")
            RadioButtonListEU.onchange = function () {
                var rdo = document.getElementsByName("<%= rdoConsent.UniqueID%>")
                if (rdo[0].checked) {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', true);
                }
                else {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', false);
                }



            };
        });

    </script>

