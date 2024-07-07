<%@ Control Language="VB" AutoEventWireup="false"  CodeFile="checkout_enrolments.ascx.vb" Inherits="webcontrols_checkout_enrolments" %>

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
 --> <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" Visible="false"/>
   
   <cc1:OfferingFeesDisplayAll runat="server" Visible="false" />

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-user"></i> Personal Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 20%">20%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-user"></i> Personal Details</h4>

   <div class="row">
      <div class="col-sm-12 columns form-group"> 
          <p>Please note all fields marked with  <span class="textfieldlabelrequired"></span> are required. <br /><br />
            Please give your full legal name. The Education & Skills Funding Agency requires the College to collect legal gender.</p>
          </div>
  </div>
      <div class="row">
      <div class="col-sm-12 columns form-group"> 
               <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="fldTitle" runat="server" IsRequired="true" CustomCaption="Title" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldTitleValidator" runat="server"></asp:CustomValidator>
          </div>
  </div>
  <div class="row" id="divRefno" runat="server" visible="false">
      <div class="col-sm-12 columns form-group"> 
    <h4>If you have already applied to the College or studied at the College as a student, your ID is <strong><asp:Label ID="lblRefno" runat="server"></asp:Label></strong> </h4>
          </div>
  </div>
    <div class="row">
    <div class="col-sm-6 columns form-group">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstName" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Forenames or given name" />
     </div>
        <div class="col-sm-6 columns form-group">       
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname or family name" />
     </div>
    </div>
  <div class="row">
      <div class="col-sm-6 columns form-group">            
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField7" runat="server" IsRequired="false" LabelWidth="300"  CustomCaption="Preferred or familiar name (if different)" />
          </div>
      <div class="col-sm-6 columns form-group">  <cc1:StudentEnrolmentField StudentEnrolmentFieldType="knownas" ID="StudentEnrolmentField8" runat="server" IsRequired="false"  LabelWidth="300" CustomCaption="Previous surname or family name" />   
          </div>
   </div>
  <div class="row">
      <div class="col-sm-12 columns form-group"> 
          <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth" placeholder="dd/mm/yyyy" CustomCaption="Date of birth" HTML5InputType="date" />
          </div>
      <div class="col-sm-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Sex" ID="fldGender" runat="server" LabelWidth="300" CustomCaption="Legal Gender" IsRequired="true" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldGenderValidator" runat="server"></asp:CustomValidator>
          </div>
      <div class="col-sm-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PreferredPronounID" ID="fldPronoun" runat="server" CustomCaption="Preferred Pronoun" IsRequired="true" ClientIDMode="Static" />
          </div>
   </div>

</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-magnifying-glass"></i> Monitoring and Support</h4>

    <p>For equality of opportunity monitoring we would appreciate your answers to the following questions.</p>

        <div class="row">
       <div class="col-sm-12 columns form-group"> 
            <%--<cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined6" ID="StudentEnrolmentField15" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Which of the following options best describes your sexual orientation?" /> <%-- Was UDF6 --%>
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SexualOrientationCode" ID="SexualOrientationCode" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Which of the following options best describes your sexual orientation?" ClientIDMode="Static" /> <%-- Was UDF6 --%>
           </div>
       <div class="col-sm-12 columns form-group"> 
            <%--<cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined7" ID="StudentEnrolmentField16" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="350" CustomCaption="What Gender do you identify as?" /> <%-- Was UDF7 --%>
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="GenderType" ID="GenderType" runat="server"  IsRequired="false"  LabelWidth="350" CustomCaption="What Gender do you identify as?" ClientIDMode="Static" /> <%-- Was UDF7 --%>
           </div>
<%--       <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined8" ID="StudentEnrolmentField17" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Do you identify as the same gender as registered at birth?" />
           </div>--%>
    </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-hashtag"></i> NI and Criminal Convictions</h4>

    <h5>National Insurance</h5>
    <div class="row">
      <div class="col-sm-12 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="StudentEnrolmentField20" runat="server"  IsRequired="false" LabelWidth="400" CustomCaption="National Insurance (NI) Number" title="The format of the number is two prefix letters, six digits and one suffix letter. Use UPPER CASE for letters.  An example is AB123456C. Neither of the first two letters can be D, F, I, Q, U or V. The second letter also cannot be O. The prefixes BG, GB, NK, KN, TN, NT and ZZ are not allowed" Pattern="^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$"/>
          </div>
   </div>

    <hr />
    <h5>Criminal Convictions</h5>

        <p>We must ask you to provide details of any <strong>unspent</strong> criminal convictions. You do not need to tell us about any spent convictions, as defined by the Rehabilitation of Offenders Act 1974, unless your course involves access to children and young adults under the age of 18. If you are enrolled to such a course, any failure to disclose such convictions may result in the College asking you to withdraw. Any information you give will be completely confidential and is only considered in relation to this enrolment.</p>
        
<%--        <span class="textfieldlabelrequired">Do you have any unspent criminal convictions?</span>
        <asp:DropDownList runat="server" ID="rdoCC" CssClass="form-group">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
       
        </asp:DropDownList>--%>

      <div class="row">
            <div class="col-sm-12 columns form-group"> 
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CriminalConvictionID" ID="fldCriminalConvictionID" runat="server" IsRequired="true" LabelWidth="400"   CustomCaption="Do you have any unspent criminal convictions?" />
                <asp:CustomValidator ID="fldCriminalConvictionIDValidator" runat="server"></asp:CustomValidator>
        </div>
        
      </div>
    <p>If ‘Yes’, this will be referred to the College Admissions Panel.</p>

<%--      <div class="row">
            <div class="col-sm-12 columns form-group"> 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined60" ID="txtYesCriminalConviction" runat="server" IsRequired="false" CustomCaption="If yes, you are required to give full details. This will be referred to the College Admissions Panel." LabelWidth="650"/>
        </div>
      </div>--%>

<!--
<div class="container">
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          </div>
       <div class="col-sm-6 columns form-group"> 
          </div>
   </div>
</div>
    -->
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-address-book"></i> Address and Contact Details</h4>


<%--    <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find your address, enter postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>

        <p><strong>Home/Permanent address</strong></p>

<div id="divAddresslines" runat="server" visible="true">
    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" ClientIDMode="Static" CustomCaption="First Line of Address" Placeholder="Start typing your address here..." />
        </div>
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress2" StudentEnrolmentFieldType="Address2" ClientIDMode="Static" CustomCaption="Second Line of Address" />
        </div>
    </div>
  
    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress3" StudentEnrolmentFieldType="Address3" IsRequired="true" ClientIDMode="Static" CustomCaption="Town" />
        </div>
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="fldAddress4" StudentEnrolmentFieldType="Address4" IsRequired="true" ClientIDMode="Static" CustomCaption="County" />
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 columns form-group">
            <label for="postcode" class="textfieldlabelrequired">Postcode</label>
            <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="" autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode" ClientIDMode="Static" />
            <%--pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" Title="Please enter a valid Postcode"--%>    
            <asp:CustomValidator ID="postcodeValidator" runat="server"></asp:CustomValidator>
            </div> 
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 columns form-group">
            <p><strong>You must provide at least one phone number below:</strong></p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField CustomCaption="Personal Mobile" StudentEnrolmentFieldType="MobileTel" ID="fldMobileTel" runat="server" Placeholder="Mobile numbers beginning 07" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$"/>
        </div>
        <div class="col-sm-6 columns form-group"> 
                <cc1:StudentEnrolmentField CustomCaption="Home phone (inc. STD code)" LabelWidth="350" StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
        </div>
        <div class="col-sm-12 columns form-group">
            <asp:CustomValidator ID="fldMobileTelValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
              <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="fldEmail" runat="server" IsRequired="true"  CustomCaption="Personal Email"  />
        </div>
    </div>

    <div class="form-input">
        <span class="textfieldlabelrequired">Will you be living in College accommodation?</span>
        <asp:RadioButtonList runat="server" ID="ddCollegeAccomodation" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>
        </asp:RadioButtonList>
  
    </div>

    <div class="form-input">
        <span class="textfieldlabelrequired">Is your term time address different to your home address?</span>
        <asp:RadioButtonList runat="server" ID="RadioButtonListAlt" CssClass="form-input">
            <asp:ListItem Text="No, it is the same" Value="2"></asp:ListItem>
            <asp:ListItem Text="Yes, it is different" Value="1"></asp:ListItem>
        </asp:RadioButtonList>
  
    </div>

    <div class="altaddress">
    <br />
        <h5>Term Time Address</h5>


        <p>Term Time address (if different from Home/Permanent address)</p>

  <div class="row">
      <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField ID="AltAddress1" runat="server" CustomCaption="Address Line 1" IsRequired="false" StudentEnrolmentFieldType="AltAddress1" LabelWidth="300" ClientIDMode="Static" />
            <asp:CustomValidator ID="AltAddress1Validator" runat="server"></asp:CustomValidator>
        </div>
      <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField ID="AltAddress2" runat="server" CustomCaption="Address Line 2" IsRequired="false" StudentEnrolmentFieldType="AltAddress2" LabelWidth="300" ClientIDMode="Static" />
        </div>
   </div>

  <div class="row">
      <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField ID="AltAddress3" runat="server" CustomCaption="Address Line 3" IsRequired="false" StudentEnrolmentFieldType="AltAddress3" LabelWidth="300" ClientIDMode="Static" />
        </div>
      <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField ID="AltAddress4" runat="server" CustomCaption="Address Line 4" IsRequired="false" StudentEnrolmentFieldType="AltAddress4" LabelWidth="300" ClientIDMode="Static" />
        </div>
   </div>

    <div class="row">
         <div class="col-sm-12 columns form-group">
            <span class="textfieldlabelrequired1">Postcode</span>
            <input type="text" runat="server" id="AltPostcode" title="Postcode" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" ClientIDMode="Static" />
            <asp:CustomValidator ID="AltPostcodeValidator" runat="server"></asp:CustomValidator>
        </div>

         <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AltTel1" ID="AltTel1" runat="server" CustomCaption="Term phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" ClientIDMode="Static" />
        </div>
    </div>

    <br />
    
 </div>
</div>


      <!--  <cc1:CCCButton id="btnBack2" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx"/> -->
<%--        <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button"  LinkResource="courseenrol1618_aspx" />

 <cc1:CCCButton  runat="server" Text="Continue" CausesValidation="true" CssClass="button" ID="btnContinue" />--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="courseenrol1618_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
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
<asp:Label ID="Test" runat="server" />

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
        //Provide better descriptions for Sex fields
        let fldSex = document.getElementById("cboSex");
        fldSex.options[1].textContent = "Female";
        fldSex.options[2].textContent = "Male";

        //Put most common promouns first - uses custom JS function
        let pronounDropdown = document.getElementById(`cboPreferredPronounID`);
        sortSelectMoveToTop(pronounDropdown, "T");
        sortSelectMoveToTop(pronounDropdown, "U");
        sortSelectMoveToTop(pronounDropdown, "I");
        sortSelectMoveToTop(pronounDropdown, "S");
        sortSelectMoveToTop(pronounDropdown, "H");
        sortSelectMoveToTop(pronounDropdown, "");

        let fldTitleInputBox = addSearchableDropDown(cboTitle);
        let fldSexInputBox = addSearchableDropDown(cboSex);
        let fldPreferredPronounIDInputBox = addSearchableDropDown(cboPreferredPronounID);
        let fldSexualOrientationCodeInputBox = addSearchableDropDown(cboSexualOrientationCode);
        let fldGenderTypeInputBox = addSearchableDropDown(cboGenderType);

        //Add better label for Email Confirmation
        let emailConfirm = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_fldEmail`);
        let emailConfirmLabel = emailConfirm.querySelector('div:last-of-type').firstElementChild;

        if (emailConfirmLabel != null) {
            emailConfirmLabel.innerHTML = `Confirm Personal Email`;
        }
    });
</script>
