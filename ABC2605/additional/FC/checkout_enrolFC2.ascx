<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC2.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 30%;" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li><strong>Address and Contact Details</strong></li>                   
                    <li>Emergency Contact Details</li>
                    <li>Supporting You</li>
                    <li>Education and Employment</li>
                    <li>Payment and Privacy Notice</li>
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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="true">
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


    
    <h2 class="app-title">Address and Contact Details</h2>
    <hr />

        <h4>Home/Permanent address</h4>
 
        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress1" runat="server" CustomCaption="Property/Street"
                IsRequired="true" StudentEnrolmentFieldType="Address1" LabelWidth="200" />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress2" runat="server" CustomCaption="Address Line 2"
                IsRequired="true" StudentEnrolmentFieldType="Address2" LabelWidth="300" />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress3" runat="server" CustomCaption="Town/City"
                IsRequired="true" StudentEnrolmentFieldType="Address3" LabelWidth="200" />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress4" runat="server" CustomCaption="County"
                IsRequired="true" StudentEnrolmentFieldType="Address4" LabelWidth="200" />
        </div>

        <div class=" form-group">
            <p class="textfieldlabelrequired">Postcode</p>
            <input type="text" runat="server" id="postcode" title="Postcode" placeholder="Enter Postcode" maxlength="8" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField4" runat="server" CustomCaption="Home phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField5" runat="server" CustomCaption="Personal mobile" IsRequired="true" LabelWidth="300" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)" />
        </div>

        <div class="form-input">
            <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField7" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Personal e-mail" />
        </div>

        <div class="form-input">
        <span class="textfieldlabelrequired">Is your term time address different to your home address?</span>
        <asp:RadioButtonList runat="server" ID="RadioButtonListAlt" CssClass="form-input">
            <asp:ListItem Text="No, it is the same" Value="2"></asp:ListItem>
            <asp:ListItem Text="Yes, it is different" Value="1"></asp:ListItem>
  

        </asp:RadioButtonList>
  
    </div>

    <div class="altaddress">
        <h4>Term Time Address</h4>


        <p><strong>Term Time address (if different from Home/Permanent address)</strong></p>


        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField19" runat="server" CustomCaption="Property/Street"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress1" LabelWidth="300" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField6" runat="server" CustomCaption="Address Line 2"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress2" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField14" runat="server" CustomCaption="Town/City"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress3" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField21" runat="server" CustomCaption="County"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress4" LabelWidth="300" />
        </div>

        <div class="form-input">
            <p>Postcode</p><input type="text" runat="server" id="Postcode1" title="Postcode" placeholder="Enter Postcode" maxlength="8" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AltTel1" ID="StudentEnrolmentField1" runat="server" CustomCaption="Term phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
        </div>

    </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="NINum" runat="server" IsRequired="false" LabelWidth="400" Visible="false"
            CustomCaption="National Insurance Number (if known)" Pattern="^(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]$" Title="Please match requested format (AB123456C) all caps" />
        </div>

</DIV>



<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />
<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />



<script>

    $(document).ready(function () {

        $('.altaddress').hide();

        // Hide or Show Learning Difficulty 
        var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
        if (rdo[0].checked) {
            $(".altaddress").hide();
        }
        else {
            $(".altaddress").show();
        }

        // Set Learning Difficulty Fields visibility when Learning Difficulty 'Yes' radio button is clicked
        var rdo1 = document.getElementById("<%= RadioButtonListAlt.ClientID%>")
        rdo1.onchange = function () {
            var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
            if (rdo[0].checked) {
                $(".altaddress").slideUp();
            }
            else {
                $(".altaddress").slideDown();
            }


        };
    });

</script>
  
