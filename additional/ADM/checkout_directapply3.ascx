<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply3.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 45%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address</li>
                    <li><strong>Supporting You</strong></li>
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
    <h2 class="app-title">Supporting You</h2>
    <hr />


    <!--
        <p>We collect information relating to special educational needs, disabilities and additional support so our learning support team can work with you to ensure that you receive the appropriate help and advice to achieve your full potential.</p>
    -->

        <span> Askham Bryan College welcomes applicants from ex-offenders and considers them on their merits. </span>
    <p></p>
        <span class="textfieldlabelrequired">Do you have any unspent conditional cautions or convictions? <br />and/or <br /> Do you have any spent cautions or convictions, which are not protected as defined by the Rehabilitation of Offenders Act 1974 (Exemptions Order) 1975 (as amended in 2020) (sex crimes, crimes of violence)?</span>
        <asp:DropDownList runat="server" ID="rdoCC" CssClass="form-group">
          <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
            <asp:ListItem Text="No" Value="3"></asp:ListItem>
       
        </asp:DropDownList>



       <div class="form-input">
        <span class="textfieldlabelrequired">Are you applying as an international student?</span>
        <asp:DropDownList runat="server" ID="rdoOverseas" CssClass="form-input">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No - I confirm I hold UK citizenship" Value="0"></asp:ListItem>

        </asp:DropDownList>

    </div>

         <span class="textfieldlabelrequired">Are you in or have you recently left Local Authority Care?</span>
         <asp:DropDownList ID="NotHECareLeaver" runat="server" EnableViewState="true">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
            <asp:ListItem Value="0" Text="No"></asp:ListItem>

        </asp:DropDownList>


    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="fldCareLeaver" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Care Leaver" Enabled="True" CustomFieldType="TickBox" />
    </div>


    <div class="form-input">
        <span class="textfieldlabelrequired">Do consider yourself to have a learning difficulty and/or disability?</span>
        <asp:DropDownList runat="server" ID="rdoLearnDiff" CssClass="form-input" EnableViewState="true" ClientIDMode="Static">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>

        </asp:DropDownList>

    </div>

    <div class="Disability">

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="disCat1" runat="server" CustomCaption="Please provide your main learning diffculty/disability" IsRequired="false" LabelWidth="400" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" ID="StudentEnrolmentField1" runat="server" CustomCaption="Let us know if you have any other learning diffculty/disability" IsRequired="false" LabelWidth="400" />
    </div>
    </div>

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ApplicationUserDefined5" ID="StudentEnrolmentField2" CustomFieldType="Lookup" runat="server" IsRequired="true"  LabelWidth="450" CustomCaption="What  examination support have you previously received?" />

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasSpecialEducationNeeds" ID="StudentEnrolmentField6" runat="server" LabelWidth="400" />


    </div>

    <span class="textfieldlabelrequired">Do you have an Educational Health and Care Plan (EHCP)?</span>
    <asp:DropDownList ID="HasEHCP" runat="server">
        <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:DropDownList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" ID="StudentEnrolmentField14" runat="server" LabelWidth="400" />

    </div>


</div>


    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />

<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />


<script>

    //hide and show disability
        $(document).ready(function () {

        $('.Disability').hide()

    
        if ($("#<%=rdoLearnDiff.ClientID%>").val()=="1") {
            $(".Disability").show()
           // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $(".Disability").hide()
           // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
      
        $('#<%= rdoLearnDiff.ClientID %>').change(function () {
          
            if ($("#<%=rdoLearnDiff.ClientID%>").val()=="1") {
               // alert(ele[1].checked);
                $(".Disability").slideDown()
              //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {

                $(".Disability").slideUp()
              //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }


        });
    });
</script>


