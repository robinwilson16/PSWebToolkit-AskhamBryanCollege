<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_parent_guardian.ascx.vb" Inherits="webcontrols_checkout_parent_guardian" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<!--
<br />
<div class="container">
   <div class="row">
      <div class="col-sm-12 columns form-group"> 
                <asp:Label runat="server" ID="lblAge"></asp:Label>
          </div>   

   </div>
       <div class="row">
         
       <div class="col-sm-12 columns form-group"> 
<asp:Label runat="server" ID="lblAgeCourse"></asp:Label>
          </div>
       </div>
    </div>
<br />
    -->

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-users"></i> Emergency Contact Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 30%">30%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-users"></i> <asp:Label runat="server" ID="Contact1Label">Emergency Contact Details</asp:Label></h4>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <p>Please provide details of a <strong>next of kin.</strong> The person must know they are your emergency contact.</p>
        </div>
  </div>

  <div class="row">
      <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentFirstName" ID="fldParentFirstName" runat="server" IsRequired="true" CustomCaption="First name"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentSurname" ID="fldParentSurname" runat="server" IsRequired="true"  CustomCaption="Surname"/>
          </div>
   </div>

          <div class="row">
        <div class="col-sm-12 columns form-group"> 
                       <p><strong>You must provide at least one next of kin phone number below:</strong></p>
            </div>
       </div>
    <div class="row">
        <div class="col-sm-6 columns form-group">
            <span class="textfieldlabelrequired">Mobile Number (eg 07)</span>
    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentMobileTel" ID="fldParentMobileTel" runat="server" IsRequired="false" Placeholder="Mobile numbers beginning 07" CustomCaption="Mobile Number (eg 07)" LabelWidth="0" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
    </div>
   <div class="col-sm-6 columns form-group">
       <span class="textfieldlabelrequired">Contact phone (inc. STD code)</span>
               <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentPhoneNumber" ID="fldParentPhoneNumber" runat="server" CustomCaption="Contact phone (inc. STD code)" LabelWidth="0" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
</div>
    <div class="col-sm-12 columns form-group">
        <asp:CustomValidator ID="fldMobileTelValidator" runat="server"></asp:CustomValidator>
    </div>
 </div>

     <div class="row">
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentEmailAddress" ID="StudentEnrolmentField11" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="Email Address" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"/>
        </div>
         <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentRelationshipID" ID="fldParentRelationshipID" runat="server" IsRequired="true"  CustomCaption="Relationship" ClientIDMode="Static" />
             <asp:CustomValidator ID="fldParentRelationshipIDValidator" runat="server"></asp:CustomValidator>
            </div>
     </div>
   
<%--     <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find an address by entering postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>
      <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
    <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress1" ID="txtAddress1" runat="server" IsRequired="true" CustomCaption="First Line of Address" ClientIDMode="Static" Placeholder="Start typing your address here..." />
    </div>
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress2" ID="txtAddress2" runat="server" IsRequired="false"  CustomCaption="Second Line of Address" ClientIDMode="Static" />
    </div>
</div>
  <div class="row">
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress3" ID="txtAddress3" runat="server" IsRequired="true"  CustomCaption="Town" ClientIDMode="Static" />
    </div>
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress4" ID="txtAddress4" runat="server" IsRequired="true"  CustomCaption="County" ClientIDMode="Static" />
    </div>
      </div>
    <div class="row">
         <div class="col-sm-12 columns form-group"> 
             <label for="postcode" class="textfieldlabelrequired">Postcode</label>
             <input title="Postcode" runat="server" maxlength="9" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Enter postcode here" autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" ClientIDMode="Static" />
             <asp:CustomValidator ID="postcodeValidator" runat="server"></asp:CustomValidator>
             </div>
        </div>
    </div>

 </div>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="checkout_enrolments_HE_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" LinkResource="checkout_enrolments2_HE_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<%--        <cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_enrolments_HE_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  LinkResource="checkout_enrolments2_HE_aspx" CausesValidation="true" EnableEnterKey="true" />--%>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        let fldParentRelationshipIDInputBox = addSearchableDropDown(cboParentRelationshipID);
    });

    // Get Address IO
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
        'txtParentAddress1',
        'jxO2lYlUvUO86UTwrjA57w42776',
        {
            output_fields: {
                formatted_address_0: 'txtParentAddress1',  /* The id of the element bound to 'formatted_address[0]' */
                town_or_city: 'txtParentAddress3',  /* The id of the element bound to 'town_or_city' */
                county: 'txtParentAddress4',  /* The id of the element bound to 'county' */
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
</script>