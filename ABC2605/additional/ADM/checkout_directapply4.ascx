<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply4.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address</li>
                    <li>Supporting You</li>
                    <li><strong>Contact Information</strong></li>
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


   

    <h2 class="app-title">More about you - alternative contact information</h2>

    <hr />

    <p>Please provide Next of Kin (alternative contact in case of emergency) details.</p>
    <p>If under 18 these must be details of your parent / guardian / carer.</p>
    <p>Please note that if you are aged between 16-18 or have an EHCP, by providing these details, you also consent to your parent / guardian / carer being contacted about your application and any interviews at the College.</p>





    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1" ID="StudentEnrolmentField15" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Next of Kin Name" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="StudentEnrolmentField16" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Next of Kin relationship to student" ExcludedIDValues ="3079,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127,3128,3129,3130,3131,3132,3133,3134,3135,3136,3137,3138,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181,3182,3183,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,3215,3216,3217,3218,3219" />
    </div>


    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="contacttel" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Next of Kin mobile / contact telephone number" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1EmailAddress" ID="StudentEnrolmentField18" runat="server" IsRequired="false" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Next of Kin email" />
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



        <div class=" form-group">
            <span class="textfieldlabelrequired1">Contact Address Line 1</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address1" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 1" />
        </div>
        <div class=" form-group">
            <span class="textfieldlabelrequired1">Contact Address Line 2</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address2" ID="StudentEnrolmentField33" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 2" />
        </div>
        <div class=" form-group">
            <span class="textfieldlabelrequired1">Contact Address Line 3</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address3" ID="StudentEnrolmentField17" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 3" />
        </div>
        <div class=" form-group">
            <span class="textfieldlabelrequired1">Contact Address Line 4</span>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address4" ID="StudentEnrolmentField20" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 4" />
        </div>
        <div class="form-input">
            <span class="textfieldlabelrequired1">Postcode</span>
            <input type="text" runat="server" id="Contact1Postcode" title="Postcode" placeholder="Enter Postcode" class="textfieldlabelrequired" />
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
            $(".parentaddress").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $(".parentaddress").show()
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








