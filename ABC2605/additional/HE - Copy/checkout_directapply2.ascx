<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply2.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 33.2%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li><strong>Emergency Contact Details</strong></li>
                    <li>Employment Qualifications and References</li>
                    <li>Personal Statement</li>
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

    <h2 class ="app-title">Emergency Contact Details</h2>
    <hr />
    <p>This must be an adult and the person must know they are your emergency contact.</p>
 
    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1" ID="StudentEnrolmentField15" runat="server" IsRequired="True" LabelWidth="300" CustomCaption="Full name" />
                </div>
    </div>
    
    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="StudentEnrolmentField16" runat="server" IsRequired="True" LabelWidth="300" CustomCaption="Realtionship to you" ExcludedIDValues ="1,2,3,6,8,10,14,15,16" />
                </div>
    </div>

    <div class="row">
        <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="Contact1Tel" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Home phone (inc. STD code)"  Title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/> 
                </div>

        <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1WorkTel" ID="Contact1WorkTel" runat="server" IsRequired="false" LabelWidth="300"  CustomCaption="Work phone (inc. STD code)" Title="The format of the work telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$" />
                </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1MobileTel" ID="Contact1MobileTel" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Mobile" Title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
                </div>
    </div>

        <div class="form-input">
            <span class="textfieldlabelrequired1">Are you living with this person?</span>
            <asp:RadioButtonList runat="server" ID="LivesWithContact1">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsLivingWithcontact1" ID="LivingWithContact1" runat="server" LabelWidth="400" />
    </div>


    <div class="parentaddress">

    <div class="row">
        <div class="col-sm-6 columns form-group">
            <span class="textfieldlabelrequired1">Address Line 1</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address1" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 1" />
                    </div>

        <div class="col-sm-6 columns form-group">
            <span class="textfieldlabelrequired1">Address Line 2</span>
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address2" ID="StudentEnrolmentField33" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 2" />
                    </div>
    </div>

    <div class="row">
        <div class="col-sm-6 columns form-group">
            <span class="textfieldlabelrequired1">Address Line 3</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address3" ID="StudentEnrolmentField17" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 3" />
                </div>

        <div class="col-sm-6 columns form-group">
            <span class="textfieldlabelrequired1">Address Line 4</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address4" ID="StudentEnrolmentField20" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 4" />
                </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group">
            <span class="textfieldlabelrequired1">Postcode</span>
            <input type="text" runat="server" id="Contact1Postcode" title="Postcode" placeholder="Enter Postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
                </div>

    </div>
    </div>

</div>


    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />

<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />



   




<script>

    $(document).ready(function () {

        $('.parentaddress').hide()

        var ele = document.getElementsByName("<%= LivesWithContact1.UniqueID%>")
        if (ele[0].checked) {
            $(".parentaddress").show()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $(".parentaddress").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= LivesWithContact1.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= LivesWithContact1.UniqueID%>")
            if (ele[0].checked) {
                $(".parentaddress").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {

                $(".parentaddress").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }



        };
    });
</script>