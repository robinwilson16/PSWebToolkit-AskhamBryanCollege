<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC3.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/checkout_enrolFC.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/checkout_enrolFC2.ascx"><i class="fa-solid fa-address-book"></i> <span class="d-none d-sm-inline">Address</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-users"></i> Emergency Contact Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 40%">40%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-graduation-cap"></i> Course Information</h4>

    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
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
    </asp:GridView>--%>


                <div class="container">
            <%For Each crs In tblOffering %>
                <%
'Dim OfferingRow = OfferingDataTable.FetchByOfferingID(crs.OfferingID)
                %>
                <div class="row">
                    <div class="col-md">
                        <div class="card mt-3">
                            <div class="card-body">
                                <h4><i class="fa-solid fa-award"></i> <%=crs.Name%></h4>
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Start Date:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.StartDate)), crs.StartDate.Value.ToString("dd/MM/yyyy"), "")%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>End Date:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.EndDate)), crs.EndDate.Value.ToString("dd/MM/yyyy"), "")%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Course Code:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=crs.Code%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Campus:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=crs.SiteDescription%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Total Fees:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.TotalFeeAmount)), crs.TotalFeeAmount.Value.ToString("C0"), "")%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%Next%>
        </div>
    </div>


<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-users"></i> <asp:Label runat="server" ID="Contact1Label">Emergency Contact Details</asp:Label></h4>

    <p><strong>If you are aged under 18, we MUST have details of a parent, guardian or carer we can contact in case of an emergency. If aged 18 or over, please provide details of a next of kin. The person must know they are your emergency contact.</strong></p>


    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1" ID="StudentEnrolmentField15" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Full name" />
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="StudentEnrolmentField16" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Relationship to you" ExcludedIDValues ="3079,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127,3128,3129,3130,3131,3132,3133,3134,3135,3136,3137,3138,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181,3182,3183,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,3215,3216,3217,3218,3219" ClientIDMode="Static" />
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="contacttel" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Contact phone (inc. STD code)" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1MobileTel" ID="StudentEnrolmentField1" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Mobile" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>

    <%--<div class=" form-group">
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
        </div>--%>

</div>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<%--    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />--%>




<%--<script>

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
</script>--%>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldContact1RelationshipID = document.getElementById(`cboContact1RelationshipID`);
        sortSelectMoveToTop(fldContact1RelationshipID, "3080");
        let fldContact1RelationshipIDInputBox = addSearchableDropDown(fldContact1RelationshipID);
    });
</script>