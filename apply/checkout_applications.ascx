<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_applications.ascx.vb" Inherits="checkout_applications" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%
'Dim OfferingID As Integer
'If WorkingData.ShoppingCart.Items.Count > 0 Then
'    OfferingID = WorkingData.ShoppingCart.Items(0).OfferingID
'Else
'    OfferingID = 0
'End If
%>

<br />
<br />

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-user"></i> Personal Details</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 40%">40%</div>
</div>


<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-user"></i> Personal Details</h4>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstForename" runat="server" IsRequired="true" LabelWidth="200" Placeholder="Legal Name" CustomCaption="Forename (Legal Name)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="fldOtherForenames" runat="server" LabelWidth="200" CustomCaption="Middle Name" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="200" AutoFocus="true" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="KnownAs" ID="fldKnownAs" runat="server" LabelWidth="200" Placeholder="e.g. Billy instead of William" CustomCaption="Known As Name (if different to legal first name)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="fldTitle" runat="server" ClientIDMode="Static" IsRequired="true" LabelWidth="200" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField ID="fldDateOfBirth" runat="server" IsRequired="false" StudentEnrolmentFieldType="DateOfBirth" LabelWidth="200" ClientIDMode="Static" Placeholder="dd/mm/yyyy" HTML5InputType="date" />
        <asp:CustomValidator ID="fldDateOfBirthValidator" runat="server"></asp:CustomValidator>
        <div class="alert alert-secondary" role="alert" id="AgeInfo">
            &nbsp;
        </div>
    </div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Sex" ID="fldSex" runat="server" ClientIDMode="Static" LabelWidth="200" />
    </div>
    <div class=" form-group">
        <%--CCCPS-77565 Add preferredpronoun field--%>
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PreferredPronounID" ID="fldPreferredPronounID" runat="server" ClientIDMode="Static" IsRequired="true" LabelWidth="200" CustomCaption="Preferred Pronoun" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="fldNINumber" runat="server" LabelWidth="200" CustomCaption="National Insurance Number (if known)" />
        <asp:CustomValidator ID="fldNINumberValidate" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SchoolID" ID="fldSchoolID" runat="server" LabelWidth="200" ClientIDMode="Static" CustomCaption="Previous School" />
    </div>
    <div class=" form-group d-none" id="PreviousSchoolOtherName">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined15" ID="fldStudentDetailUserDefined15" runat="server" LabelWidth="200" ClientIDMode="Static" CustomCaption="Name of Previous School (Other)" />
    </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-comment"></i> Contact Details</h4>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="fldMobileTel" runat="server" LabelWidth="200" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Mobile Telephone Number" />
        <asp:CustomValidator ID="fldMobileTelValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" LabelWidth="200" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?#(\d{4}|\d{3}))?$" Title="Please enter a valid Telephone Number" CustomCaption="Alternative Contact Number" />
        <asp:CustomValidator ID="fldTelValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="fldEmail" runat="server" IsRequired="false" LabelWidth="200" HTML5InputType="email" CustomCaption="Personal Email Address" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid Email Address" />
        <asp:CustomValidator ID="fldEmailValidator" runat="server"></asp:CustomValidator>
    </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-address-book"></i> Address Details</h4>

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
    <div class="alert alert-secondary" role="alert" id="DevolvedPostCodeAreaInfo">
        &nbsp;
    </div>
</div>

<div class="bd-callout bd-callout-askham-warning bd-callout-fees d-none" id="DevolvedFeesInfo">
    <h4><i class="fa-solid fa-landmark"></i> Funding Details</h4>
    <p>
        Please note, over 19s are usually liable for course fees. As you live in the <span id="DevolvedAreaName">[DEVOLVED AREA]</span> devolved area <strong>your course fees will be higher</strong>. 
    </p>
    <p>
        Askham Bryan College receives government funding which allows us to offer courses at a lower cost. The guidelines relating to devolution means that we cannot apply this funding to learners who live in devolved areas. 
    </p>
    <p>
        Before committing to a course with Askham Bryan College, we would recommend that you explore options to study the course the course in your local area.
    </p>
    <p>
        If you would prefer to continue your application with Askham Bryan College please note that the price of the course <strong>could be doubled the advertised cost</strong>. Definitive fees can only be confirmed at point of enrolment (usually in September).
    </p>
    <p>
        You may be able to find support for these fees based on your personal circumstances. Please confirm you acknowledge this.
    </p>
    <div class=" form-group">
        <asp:Checkbox runat="server" ID="ConfirmNoFundingAvailable" Text="I confirm my acknowledgement" />
        <asp:CustomValidator ID="ConfirmNoFundingAvailableValidator" runat="server"></asp:CustomValidator>
        <asp:Textbox runat="server" ID="Age31stAug" Placeholder="Age31stAug" type="number" ClientIDMode="Static" class="d-none" />
        <asp:Textbox runat="server" ID="ExpectedSourceOfFundingID" Placeholder="ExpectedSourceOfFundingID" type="number" ClientIDMode="Static" class="d-none" />
        <asp:Textbox runat="server" ID="ExpectedSourceOfFundingName" Placeholder="ExpectedSourceOfFundingName" ClientIDMode="Static" class="d-none" />
        <asp:Checkbox runat="server" ID="DevolutionAreaIsFunded" Text="DevolutionAreaIsFunded" ClientIDMode="Static" class="d-none" />
    </div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-camera"></i> Photo Upload</h4>

    <p>Please upload your photo if you can to help speed up the enrolment process later.</p>
    
    <div class="alert alert-secondary" role="alert">
        <h5 class="alert-heading mb-3">To ensure your photo is suitable and there are no delays to obtaining your ID card please consider the following:</h5>
        <div class="row">
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body">
                        <asp:Image ID="Image1" runat="server" class="img-fluid" />
                    </div>
                    <div class="card-footer">
                        <asp:Label ID="PhotoFilename" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-9 mb-3">
                <div class="card">
                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item NoBorder">Include your head and shoulders.</li>
                            <li class="list-group-item NoBorder">Be appropriately dressed for a learning environment.</li>
                            <li class="list-group-item NoBorder">Ensure no other people are visible on the photo. Use a clear background if possible.</li>
                            <li class="list-group-item NoBorder">Be facing forwards and looking straight at the camera.</li>
                            <li class="list-group-item NoBorder">Ensure your face is not covered and your eyes are visible without hair in the way.</li>
                            <li class="list-group-item NoBorder">Not wear any hats or head coverings (unless it's for religious or medical reasons).</li>
                            <li class="list-group-item NoBorder">Check the environment is well-lit and the picture is not blurred.</li>
                            <li class="list-group-item NoBorder">Make sure the file is not too large to send to us.</li>
                        </ul>    
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mb-3">
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
            ControlToValidate="FileUpload1"
            ErrorMessage="Only .jpg, .png, .jpeg, .gif, .heic Files are allowed" Font-Bold="True"
            Font-Size="Medium"
            ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|heic|JPG|JPEG|PNG|GIF|HEIC)$"></asp:RegularExpressionValidator>
        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" IsRequired="false" ClientIDMode="Static" />
        <input type="text" id="PhotoPath" runat="server" class="form-control d-none" ClientIDMode="Static" />
        <asp:CustomValidator ID="PhotoPathValidator" runat="server"></asp:CustomValidator>

        <asp:LinkButton ID="UploadPhoto" runat="server" OnClick="Upload" CssClass="btn btn-primary mb-3" CausesValidation="false"><i class="fa-solid fa-upload"></i> Upload and Preview</asp:LinkButton>

        <p><strong>Browse for your photo and click to upload it and review how it looks above. If it does not look right, browse for another and click to upload again.</strong></p>
        <p><i>Please ensure your photo is oriented the correct way round</i></p>
        <p>Once you are happy your photo looks acceptable please click on the Next button below</p>
    </div>
    <p class="mt-5"><strong>Not Able To Upload Your Photograph</strong></p>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="StudentDetailUserDefined24" CustomFieldType="Lookup" StudentEnrolmentFieldType="StudentDetailUserDefined24" ClientIDMode="Static" CustomCaption="Can't upload your photo at the moment - please select a reason why" />
    </div>
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

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
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="supporting_you_abc" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        //Provide better descriptions for Sex fields
        let fldSex = document.getElementById("cboSex");
        fldSex.options[1].textContent = "Female";
        fldSex.options[2].textContent = "Male";
        let fldSexInputBox = addSearchableDropDown(fldSex);

        //Re-order fields so most common values are moved to the top
        let titleDropdown = document.getElementById(`cboTitle`);
        sortSelectMoveToTop(titleDropdown, "Ms");
        sortSelectMoveToTop(titleDropdown, "Miss");
        sortSelectMoveToTop(titleDropdown, "Mrs");
        sortSelectMoveToTop(titleDropdown, "Mr");
        sortSelectMoveToTop(titleDropdown, "");
        let titleDropdownInputBox = addSearchableDropDown(titleDropdown);

        let pronounDropdown = document.getElementById(`cboPreferredPronounID`);
        sortSelectMoveToTop(pronounDropdown, "T");
        sortSelectMoveToTop(pronounDropdown, "U");
        sortSelectMoveToTop(pronounDropdown, "I");
        sortSelectMoveToTop(pronounDropdown, "S");
        sortSelectMoveToTop(pronounDropdown, "H");
        sortSelectMoveToTop(pronounDropdown, "");
        let pronounDropdownInputBox = addSearchableDropDown(pronounDropdown);

        //Add better label for Email Confirmation
        let emailConfirm = document.getElementById(`ctl00_MainContentPlaceholder_ctl00_fldEmail`);
        let emailConfirmLabel = emailConfirm.querySelector('div:last-of-type').firstElementChild;

        if (emailConfirmLabel != null) {
            emailConfirmLabel.innerHTML = `Confirm Personal Email`;
        }

        //Calculate age and show under input box
        let dob = document.getElementById(`txtDateOfBirth`);
        let postCodeKeyup = new Event('keyup');

        if (dob.value !== null) {
            //If DOB already has a value then attempt to show age from DOB
            //alert(`|` + dob.value + `|`);
            showAge();
        }
        dob.addEventListener(`keyup`, function (event) {
            showAge();
            postcode.dispatchEvent(postCodeKeyup);
        });

        //School
        let fldSchoolID = document.getElementById(`cboSchoolID`);
        let fldSchoolIDInputGroup = addSearchableDropDownWithButton(fldSchoolID, `<i class="fa-solid fa-circle-question"></i> School Not Listed`);
        let fldSchoolIDInputBox = fldSchoolIDInputGroup.firstElementChild;
        let schoolNotFoundButton = fldSchoolIDInputBox.nextElementSibling;
        let otherschoolDiv = document.getElementById(`PreviousSchoolOtherName`);
        let otherSchoolValue = document.getElementById(`txtStudentDetailUserDefined15`);

        //Show other school option if value has already been entered (if navigating back through form)
        if (otherSchoolValue.value !== ``) {
            showHideOtherSchoolDiv();
        }

        schoolNotFoundButton.addEventListener(`click`, function (event) {
            showHideOtherSchoolDiv();
        });

        fldSchoolIDInputBox.addEventListener(`change`, function (event) {
            //If value entered into main school box then clear custom one
            if (schoolNotFoundButton.classList.contains("btn-secondary")) {
                showHideOtherSchoolDiv();
            }
        });

        function showHideOtherSchoolDiv() {
            if (schoolNotFoundButton.classList.contains("btn-outline-secondary")) {
                //Pressed
                fldSchoolID.value = null; //Clear any value in box to left
                fldSchoolIDInputBox.value = null; //Clear any value in box to left
                schoolNotFoundButton.classList.remove("btn-outline-secondary");
                schoolNotFoundButton.classList.add("btn-secondary");
                otherschoolDiv.classList.remove("d-none");
            }
            else {
                //Unpressed
                schoolNotFoundButton.classList.remove("btn-secondary");
                schoolNotFoundButton.classList.add("btn-outline-secondary");
                otherSchoolValue.value = null; //Clear custom value
                otherschoolDiv.classList.add("d-none");
            }
        }

        function showAge() {
            let today = new Date();
            let date31stAug = new Date(today.getFullYear() + `-08-31`);
            let dateOfBirth = new Date(dob.value);
            let age31stAug = calculateAge(dateOfBirth);
            let AgeInfo = document.getElementById(`AgeInfo`);
            let AgeField = document.getElementById(`Age31stAug`);

            if (isNaN(dateOfBirth) || (dateOfBirth === ` `)) {
                AgeInfo.innerHTML = `&nbsp;`;
                AgeField.value = ``;
            }
            else {
                AgeInfo.innerHTML = `<i class="fa-solid fa-calendar-day"></i> Age on ${date31stAug.getDate()}${nth(date31stAug.getDate())} ${date31stAug.toLocaleString(`default`, { month: `long` })} ${date31stAug.getFullYear()}: <kbd>${age31stAug}</kbd>`;
                AgeField.value = age31stAug;
            }
        }

        let postcode = document.getElementById(`postcode`);

        postcode.addEventListener(`keyup`, function (event) {
            if (isPostCode(postcode.value) === true) {
                getFundingSourceinfo(postcode.value);
            }
        });

        //Check entry when page is loaded too
        postcode.dispatchEvent(postCodeKeyup);

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

            postcode.dispatchEvent(postCodeKeyup);
        });

        document.addEventListener("getaddress-autocomplete-address-selected-failed", function (e) {
            console.log(e.status);
            console.log(e.message);
        });

        getAddress.autocomplete(
            'txtAddress1',
            'ValpcU5HuEilvydhXVDAFw41587',
            /*options*/{
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

        FileUpload1.addEventListener(`change`, function (event) {
            event.preventDefault();

            if (FileUpload1.files[0] == null) {
                PhotoPath.value = ``;
            }
            else {
                PhotoPath.value = FileUpload1.files[0].name;

                let fldStudentDetailUserDefined24 = document.getElementById(`cboStudentDetailUserDefined24`);
                fldStudentDetailUserDefined24.value = ``;
            }
        });
    });
    
    function isPostCode(postcode) {
        postcode = postcode.replace(/\s/g, "");
        const regex = /^[A-Z]{1,2}[0-9]{1,2}[A-Z]{0,1} ?[0-9][A-Z]{2}$/i;
        return regex.test(postcode);
    }

    async function getFundingSourceinfo(postcode) {
        await fetch(`https://mis.askham-bryan.ac.uk/ProSolutionData/DevolvedAreaPostCode/${postcode}`, {
            method: `GET`,
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Origin': 'https://mis.askham-bryan.ac.uk/'
            }
        })
            .then(response => response.json())
            .then(response => showFundingSourceInfo(response));
    }

    function showFundingSourceInfo(devolvedPostCode) {
        console.log(JSON.stringify(devolvedPostCode));

        let DevolvedPostCodeAreaInfo = document.getElementById(`DevolvedPostCodeAreaInfo`);
        let fundingIsAvailable = true;
        let fundingMessage = null;

        let Age31stAug = document.getElementById(`Age31stAug`);
        let ExpectedSourceOfFundingID = document.getElementById(`ExpectedSourceOfFundingID`);
        let ExpectedSourceOfFundingName = document.getElementById(`ExpectedSourceOfFundingName`);
        let DevolutionAreaIsFunded = document.getElementById(`DevolutionAreaIsFunded`);
        let DevolvedFeesInfo = document.getElementById(`DevolvedFeesInfo`);

        if (Age31stAug.value < 19) {
            //If 16-18
            let fundSource1618 = `Education and Skills Funding Agency (ESFA) - 16-19`
            ExpectedSourceOfFundingID.value = 107;
            ExpectedSourceOfFundingName.value = fundSource1618;
            DevolvedAreaName.innerHTML = fundSource1618;

            fundingMessage = `<i class="fa-solid fa-circle-check"></i> Funding Available from ${fundSource1618}`;
            fundingIsAvailable = true
            DevolutionAreaIsFunded.checked = true;
            DevolvedFeesInfo.classList.add(`d-none`);

            //Reset in case DOB changed
            DevolvedPostCodeAreaInfo.classList.remove(`alert-secondary`);
            DevolvedPostCodeAreaInfo.classList.remove(`alert-danger`);
            DevolvedPostCodeAreaInfo.classList.add(`alert-success`);

            DevolvedFeesInfo.classList.add(`d-none`);
        }
        else {
            if (devolvedPostCode.status === 404) {
                fundingMessage = `<i class="fa-solid fa-circle-check"></i> Cannot determine if funding is available. Please re-enter your post code above to check again`;
                fundingIsAvailable = false;
                DevolutionAreaIsFunded.checked = false;
            }
            else {
                //Set hidden fields on page
                ExpectedSourceOfFundingID.value = devolvedPostCode.fundingSourceCode;
                ExpectedSourceOfFundingName.value = devolvedPostCode.fundingSourceName;
                DevolvedAreaName.innerHTML = devolvedPostCode.fundingSourceName;

                if (devolvedPostCode.isSOFOffered === true) {
                    fundingMessage = `<i class="fa-solid fa-circle-check"></i> Funding Available from ${devolvedPostCode.fundingSourceName}`;
                    fundingIsAvailable = true;
                    DevolutionAreaIsFunded.checked = true;
                }
                else {
                    fundingMessage = `<i class="fa-solid fa-circle-xmark"></i> No Funding Available from ${devolvedPostCode.fundingSourceName}`;
                    fundingIsAvailable = false;
                    DevolutionAreaIsFunded.checked = false;
                }
            }

            if (fundingIsAvailable === true) {
                DevolvedPostCodeAreaInfo.classList.remove(`alert-secondary`);
                DevolvedPostCodeAreaInfo.classList.remove(`alert-danger`);
                DevolvedPostCodeAreaInfo.classList.add(`alert-success`);

                DevolvedFeesInfo.classList.add(`d-none`);
            }
            else {
                DevolvedPostCodeAreaInfo.classList.remove(`alert-secondary`);
                DevolvedPostCodeAreaInfo.classList.remove(`alert-success`);
                DevolvedPostCodeAreaInfo.classList.add(`alert-danger`);

                DevolvedFeesInfo.classList.remove(`d-none`);
            }
        }

        DevolvedPostCodeAreaInfo.innerHTML = fundingMessage;
    }
</script>