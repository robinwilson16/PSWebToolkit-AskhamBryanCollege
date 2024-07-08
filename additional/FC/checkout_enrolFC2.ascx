<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC2.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-address-book"></i> Address</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 25%">25%</div>
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
    <h4><i class="fa-solid fa-address-book"></i> Address Details</h4>

        <h4>Home/Permanent address</h4>
 
            <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" ClientIDMode="Static" CustomCaption="First Line of Address" Placeholder="Start typing your address here..." />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress2" StudentEnrolmentFieldType="Address2" ClientIDMode="Static" CustomCaption="Second Line of Address" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress3" StudentEnrolmentFieldType="Address3" IsRequired="true" ClientIDMode="Static" CustomCaption="Town" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress4" StudentEnrolmentFieldType="Address4" IsRequired="true" ClientIDMode="Static" CustomCaption="County" />
    </div>
<%--    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldStudentFirstLanguageID" CustomFieldType="Lookup" StudentEnrolmentFieldType="StudentFirstLanguageID" />
    </div>--%>
    <div class=" form-group">
        <label for="postcode" class="textfieldlabelrequired">Postcode</label>
        <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="" autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode" ClientIDMode="Static" />
        <%--pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" Title="Please enter a valid Postcode"--%>
        <asp:CustomValidator ID="postcodeValidator" runat="server"></asp:CustomValidator>
    </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField4" runat="server" CustomCaption="Home phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="txtMobile" runat="server" CustomCaption="Personal mobile" IsRequired="true" LabelWidth="300" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)" />
        </div>

        <div class="form-input">
            <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="fldEmail" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Personal e-mail" />
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
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress1" StudentEnrolmentFieldType="AltAddress1" IsRequired="false" ClientIDMode="Static" CustomCaption="First Line of Address" Placeholder="Start typing your address here..." />
            <asp:CustomValidator ID="AltAddress1Validator" runat="server"></asp:CustomValidator>
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress2" StudentEnrolmentFieldType="AltAddress2" ClientIDMode="Static" CustomCaption="Second Line of Address" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress3" StudentEnrolmentFieldType="AltAddress3" IsRequired="false" ClientIDMode="Static" CustomCaption="Town" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="AltAddress4" StudentEnrolmentFieldType="AltAddress4" IsRequired="false" ClientIDMode="Static" CustomCaption="County" />
        </div>

        <div class="form-input">
            <label for="AltPostcode" class="textfieldlabelrequired">Postcode</label>
            <input type="text" runat="server" id="AltPostcode" title="Postcode" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" ClientIDMode="Static" />
            <asp:CustomValidator ID="AltPostcodeValidator" runat="server"></asp:CustomValidator>
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AltTel1" ID="AltTel1" runat="server" CustomCaption="Term phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" ClientIDMode="Static" />
        </div>

    </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="NINum" runat="server" IsRequired="false" LabelWidth="400" Visible="false"
            CustomCaption="National Insurance Number (if known)" Pattern="^(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]$" Title="Please match requested format (AB123456C) all caps" />
        </div>

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

<%--<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />--%>

<script>

    $(document).ready(function () {

        $('.altaddress').hide();

        // Hide or Show Learning Difficulty 
        var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
        if (rdo[0].checked) {
            $(".altaddress").hide();
        }
        else if (rdo[1].checked) {
            $(".altaddress").show();
        }
        else {
            $(".altaddress").hide();
        }

        // Set Learning Difficulty Fields visibility when Learning Difficulty 'Yes' radio button is clicked
        var rdo1 = document.getElementById("<%= RadioButtonListAlt.ClientID%>")
        rdo1.onchange = function () {
            var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
            if (rdo[0].checked) {
                $(".altaddress").slideUp();
                clearAltAddress();
            }
            else if (rdo[1].checked) {
                $(".altaddress").slideDown();
            }
            else {
                $(".altaddress").slideUp();
                clearAltAddress();
            }


        };
    });

    function clearAltAddress() {
        let altAddress1 = document.getElementById(`txtAltAddress1`);
        let altAddress2 = document.getElementById(`txtAltAddress2`);
        let altAddress3 = document.getElementById(`txtAltAddress3`);
        let altAddress4 = document.getElementById(`txtAltAddress4`);
        let altPostcode = document.getElementById(`AltPostcode`);
        let altTel1 = document.getElementById(`txtAltTel1`);

        altAddress1.value = ``;
        altAddress2.value = ``;
        altAddress3.value = ``;
        altAddress4.value = ``;
        altPostcode.value = ``;
        altTel1.value = ``;
    }

</script>
  
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        //Add better label for Email Confirmation
        let emailConfirm = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_fldEmail`);
        let emailConfirmLabel = emailConfirm.querySelector('div:last-of-type').firstElementChild;

        if (emailConfirmLabel != null) {
            emailConfirmLabel.innerHTML = `Confirm Personal Email`;
        }

        // Get Address IO -- Main Address
        document.addEventListener("getaddress-autocomplete-suggestions", function (e) {
            console.log(e.suggestions);
        });

        document.addEventListener("getaddress-autocomplete-suggestions-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        document.addEventListener("getaddress-autocomplete-address-selected", function (e) {
            console.log(e.address);

            //postcode.dispatchEvent(postCodeKeyup);
        });

        document.addEventListener("getaddress-autocomplete-address-selected-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        getAddress.autocomplete(
            'txtAddress1',
            'jxO2lYlUvUO86UTwrjA57w42776',
            {
                output_fields: {
                    formatted_address_0: 'txtAddress1',  /* The id of the element bound to 'formatted_address[0]' */
                    town_or_city: 'txtAddress3',  /* The id of the element bound to 'town_or_city' */
                    county: 'txtAddress4',  /* The id of the element bound to 'county' */
                    postcode: 'postcode'  /* The id of the element bound to 'postcode' */
                },
                id_prefix: 'getAddress-autocomplete-native',  /* The id of the textbox and list container */
                delay: 200, /* millisecond delay between keypress and API call */
                minimum_characters: 2,  /* minimum characters to initiate an API call */
                select_on_focus: true,  /* if true, highlights textbox characters on focus*/
                alt_autocomplete_url: undefined,  /* alterative local autocomplete URL (when API key is not used) */
                alt_get_url: undefined,  /* alterative local get URL (when API key is not used) */
                suggestion_count: 6, /* number of retreived suggestions (max 20) */
                filter: undefined, /* the suggestion filter (see Autocomplete API)*/
                bind_output_fields: true, /* if true, bind the output_fields to the address*/
                input_focus_on_select: true,  /* if true, sets the focus to the textbox after selecting an address*/
                debug: false, /* if true, logs behavior */
                enable_get: true /* if true, retreives address on select */
            }
        );

        //Alt Address
        getAddress.autocomplete(
            'txtAltAddress1',
            'jxO2lYlUvUO86UTwrjA57w42776',
            {
                output_fields: {
                    formatted_address_0: 'txtAltAddress1',  /* The id of the element bound to 'formatted_address[0]' */
                    town_or_city: 'txtAltAddress3',  /* The id of the element bound to 'town_or_city' */
                    county: 'txtAltAddress4',  /* The id of the element bound to 'county' */
                    postcode: 'AltPostcode'  /* The id of the element bound to 'postcode' */
                },
                id_prefix: 'getAddress-autocomplete-native',  /* The id of the textbox and list container */
                delay: 200, /* millisecond delay between keypress and API call */
                minimum_characters: 2,  /* minimum characters to initiate an API call */
                select_on_focus: true,  /* if true, highlights textbox characters on focus*/
                alt_autocomplete_url: undefined,  /* alterative local autocomplete URL (when API key is not used) */
                alt_get_url: undefined,  /* alterative local get URL (when API key is not used) */
                suggestion_count: 6, /* number of retreived suggestions (max 20) */
                filter: undefined, /* the suggestion filter (see Autocomplete API)*/
                bind_output_fields: true, /* if true, bind the output_fields to the address*/
                input_focus_on_select: true,  /* if true, sets the focus to the textbox after selecting an address*/
                debug: false, /* if true, logs behavior */
                enable_get: true /* if true, retreives address on select */
            }
        );
    });
</script>