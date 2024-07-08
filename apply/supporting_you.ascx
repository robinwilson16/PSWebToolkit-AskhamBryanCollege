<%@ Control Language="VB" AutoEventWireup="false" CodeFile="supporting_you.ascx.vb" Inherits="checkout_applications" %>
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
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_applications.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-hand-holding-medical"></i> Supporting You</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 50%">50%</div>
</div>


<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-hand-holding-medical"></i> Supporting You</h4>

    <p>
        Askham Bryan College welcomes applicants from ex-offenders and considers them on their merits.
    </p>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CriminalConvictionID" ID="fldCriminalConvictionID" runat="server" IsRequired="true" LabelWidth="400"
    CustomCaption="Do you have any unspent conditional cautions or convictions?
  and/or
Do you have any spent cautions or convictions, which are not protected as defined by the Rehabilitation of Offenders Act 1974 (Exemptions Order) 1975 (as amended in 2020) (sex crimes, crimes of violence)?" ClientIDMode="Static" Title="Please state whether you have any criminal convictions" />
        <asp:CustomValidator ID="fldCriminalConvictionIDValidator" runat="server"></asp:CustomValidator>
    </div>

    <div class=" form-group" style="display: block;">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="LearningDiffOrDisID" ID="fldLearningDiffOrDisID" runat="server" IsRequired="true" LabelWidth="400"
    CustomCaption="Do you consider yourself to have a learning difficulty and/or disability?" ClientIDMode="Static" Title="Please state whether you have a learning difficulty or disability" />
        <asp:CustomValidator ID="fldLearningDiffOrDisIDValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="mb-3 alert alert-warning" id="DisabilityCategory1IDRow">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="fldDisabilityCategory1ID" ClientIDMode="Static"  runat="server" IsRequired="false" LabelWidth="400"
            CustomCaption="Please provide your primary difficulty or disability" />
        <asp:CustomValidator ID="CustomValidator2" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group d-none">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ALSRequested" ID="fldALSRequested" runat="server" IsRequired="true" LabelWidth="500"
    CustomCaption="Do you consider yourself to have special educational needs?" ClientIDMode="Static" Title="Please state whether you consider yourself to have special educational needs" />
        <asp:CustomValidator ID="fldALSRequestedValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="form-group">
        <div class="textfieldlabelrequired" style="display:block;width:inherit;">Do you consider yourself to have special educational needs?</div>
        <asp:DropDownList ID="ALSRequestedYN" ClientIDMode="Static" runat="server" CssClass="textfield form-control">
	        <asp:ListItem Selected="True" Disabled="True">-- Please Select --</asp:ListItem>
	        <asp:ListItem Value="Y">Yes - I Do Consider Myself to Have Special Educational Needs</asp:ListItem>
	        <asp:ListItem Value="N">No - I Do Not Consider Myself to Have Special Educational Needs</asp:ListItem>
        </asp:DropDownList>
        <asp:CustomValidator ID="ALSRequestedYNValidator" runat="server"></asp:CustomValidator>
    </div>

    <div class=" form-group d-none">
	    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthcarePlan" ID="fldHasEducationHealthcarePlan" runat="server" IsRequired="true" LabelWidth="500"
    CustomCaption="Do you have an Educational Healthcare Plan to help support your educational, health and social needs?" ClientIDMode="Static" Title="Please state whether you receive financial support with your studies" />
        <asp:CustomValidator ID="fldHasEducationHealthcarePlanValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="form-group">
	    <div class="textfieldlabelrequired" style="display:block;width:inherit;">Do you have an Educational Healthcare Plan to help support your educational, health and social needs?</div>
	    <asp:DropDownList ID="EHCPYN" ClientIDMode="Static" runat="server" CssClass="textfield form-control">
		    <asp:ListItem Selected="True" Disabled="True">-- Please Select --</asp:ListItem>
		    <asp:ListItem Value="Y">Yes - I Have an Educational Healthcare Plan</asp:ListItem>
		    <asp:ListItem Value="N">No - I Do Not Have an Educational Healthcare Plan</asp:ListItem>
	    </asp:DropDownList>
        <asp:CustomValidator ID="EHCPYNValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class=" form-group d-none">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="CareLeaver" ClientIDMode="Static" runat="server" IsRequired="true" LabelWidth="300"
            CustomCaption="Are you in or have you recently left Local Authority Care?" />
        <asp:CustomValidator ID="CareLeaverValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="form-group">
        <div class="textfieldlabelrequired" style="display:block;width:inherit;">Are you in or have you recently left Local Authority Care?</div>
        <asp:DropDownList ID="CareLeaverYN" ClientIDMode="Static" runat="server" CssClass="textfield form-control">
	        <asp:ListItem Selected="True" Disabled="True">-- Please Select --</asp:ListItem>
	        <asp:ListItem Value="Y">Yes - I am In or have Recently Left Local Authority Care</asp:ListItem>
	        <asp:ListItem Value="N">No - I am Not In or have Not Recently Left Local Authority Care</asp:ListItem>
        </asp:DropDownList>
        <asp:CustomValidator ID="CareLeaverYNValidator" runat="server"></asp:CustomValidator>
    </div>
</div>


<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-flag"></i> Background</h4>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="fldEthnicGroupID" ClientIDMode="Static" runat="server" IsRequired="false" LabelWidth="300"
	        CustomCaption="What is your ethnic origin?" />
        <asp:CustomValidator ID="fldEthnicGroupIDValidator" runat="server"></asp:CustomValidator>
    </div>

    <%if Is19Plus = True Then %>
    <div class="form-group d-none">
	    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EuroResidentID" ID="fldEuroResidentID" ClientIDMode="Static" runat="server" LabelWidth="300"
		    CustomCaption="Have you been a European resident for the past 3 years?" Width="40" />
        <asp:CustomValidator ID="fldEuroResidentIDValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="form-group">
	    <span class="textfieldlabelrequired" style="display:inline-block;width:300px;">Please select your residency status</span>
	    <asp:DropDownList ID="EuroResident" ClientIDMode="Static" runat="server" CssClass="textfield form-control">
		    <asp:ListItem Selected="True" Disabled="True">-- Please Select --</asp:ListItem>
		    <asp:ListItem Value="UKNationalUK">UK National Living in the UK Last 3 Years</asp:ListItem>
		    <asp:ListItem Value="UKNationalEEA">UK National Living in the EEA Last 3 Years</asp:ListItem>
		    <asp:ListItem Value="EEANationalEEA">European Resident Living in the EEA Last 3 Years</asp:ListItem>
		    <asp:ListItem Value="UkraineNational">Ukraine National</asp:ListItem>
		    <asp:ListItem Value="Other">None of the Above</asp:ListItem>
	    </asp:DropDownList>
        <asp:CustomValidator ID="EuroResidentValidator" runat="server"></asp:CustomValidator>
    </div>
    <div class="form-group" id="HomeFeeEligibilityQuestion">
	    <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HomeFeeEligibilityID" ID="fldHomeFeeEligibilityID" ClientIDMode="Static" runat="server" LabelWidth="300"
		    CustomCaption="Please confirm if you have pre-settled or settled status" />
        <asp:CustomValidator ID="fldHomeFeeEligibilityIDValidator" runat="server"></asp:CustomValidator>
    </div>
    <%End If %>
</div>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_applications_abc" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" LinkResource="other_contacts_abc" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        //Criminal Convictions
        let fldCriminalConviction = document.getElementById(`cboCriminalConvictionID`);
        sortSelectMoveToTop(fldCriminalConviction, "2");

        //Learning Difficulties and Disabilities
        let fldLearningDiffOrDisID = document.getElementById("cboLearningDiffOrDisID");
        let disabilityCategory1IDRow = document.getElementById("DisabilityCategory1IDRow");
        let fldDisabilityCategory1ID = document.getElementById("cboDisabilityCategory1ID");

        [...fldLearningDiffOrDisID.options].forEach(function (option) {
            if (option.value === `1`) {
                option.text = `I have a learning difficulty or disability`;
            }
            else if (option.value === `2`) {
                option.text = `I do not have a learning difficulty or disability`;
            }
            else if (option.value === `9`) {
                option.remove();
            }
        });

        let fldLearningDiffOrDisIDInputBox = addSearchableDropDown(fldLearningDiffOrDisID);

        //Disability Category
        let fldDisabilityCategory1IDInputBox = addSearchableDropDown(fldDisabilityCategory1ID);

        showHideDisabilityCategory1();

        fldLearningDiffOrDisID.addEventListener(`change`, function (event) {
            showHideDisabilityCategory1();
        });

        function showHideDisabilityCategory1() {
            if (cboLearningDiffOrDisID.value == 1) {
                disabilityCategory1IDRow.classList.remove("d-none");
            }
            else {
                disabilityCategory1IDRow.classList.add("d-none");
                fldDisabilityCategory1ID.value = null;
            }
        }

        //ALS Requested
        let alsRequestedYN = document.getElementById(`ALSRequestedYN`);
        let fldALSRequested = document.getElementById(`chkALSRequested`);

        let alsRequestedCheckboxClickEvent = new Event('click');

        //Check if checkbox already ticked when page loaded
        if (fldALSRequested.checked === true) {
            alsRequestedYN.value = "Y";
        }

        alsRequestedYN.addEventListener(`click`, function (event) {
            if (alsRequestedYN.value === "Y") {
                fldALSRequested.checked = true;
                fldALSRequested.dispatchEvent(alsRequestedCheckboxClickEvent);
            }
            else {
                fldALSRequested.checked = false;
                fldALSRequested.dispatchEvent(alsRequestedCheckboxClickEvent);
            }
        });

        //EHCP
        let ehcpYN = document.getElementById(`EHCPYN`);
        let fldHasEducationHealthCarePlan = document.getElementById(`chkHasEducationHealthCarePlan`);

        let ehcpCheckboxClickEvent = new Event('click');

        //Check if checkbox already ticked when page loaded
        if (fldHasEducationHealthCarePlan.checked === true) {
            ehcpYN.value = "Y";
        }

        ehcpYN.addEventListener(`click`, function (event) {
            if (ehcpYN.value === "Y") {
                fldHasEducationHealthCarePlan.checked = true;
                fldHasEducationHealthCarePlan.dispatchEvent(ehcpCheckboxClickEvent);
            }
            else {
                fldHasEducationHealthCarePlan.checked = false;
                fldHasEducationHealthCarePlan.dispatchEvent(ehcpCheckboxClickEvent);
            }
        });

        // Care Leaver
        let careLeaverYN = document.getElementById(`CareLeaverYN`);
        let fldIsCareLeaver = document.getElementById(`chkCareLeaver`);

        let careLeaverCheckboxClickEvent = new Event('click');

        //Check if checkbox already ticked when page loaded
        if (fldIsCareLeaver.checked === true) {
            careLeaverYN.value = "Y";
        }

        careLeaverYN.addEventListener(`click`, function (event) {
            if (careLeaverYN.value === "Y") {
                fldIsCareLeaver.checked = true;
                fldIsCareLeaver.dispatchEvent(careLeaverCheckboxClickEvent);
            }
            else {
                fldIsCareLeaver.checked = false;
                fldIsCareLeaver.dispatchEvent(careLeaverCheckboxClickEvent);
            }
        });

        //Ethnicity
        let fldEthnicGroup = document.getElementById(`cboEthnicGroupID`);
        sortSelectMoveToTop(fldEthnicGroup, "31");
        let fldEthnicGroupInputBox = addSearchableDropDown(fldEthnicGroup);

        //Residency
        let euroResident = document.getElementById(`EuroResident`);
        let homeFeeEligibilityQuestion = document.getElementById(`HomeFeeEligibilityQuestion`);
        let fldHomeFeeEligibilityID = document.getElementById(`cboHomeFeeEligibilityID`);
        let fldEuroResidentID = document.getElementById(`chkEuroResidentID`);

        let euroResidentCheckboxClickEvent = new Event('click');

        if (euroResident != null) {
            euroResident.addEventListener(`click`, function (event) {
                //fldEuroResidentID.dispatchEvent(euroResidentCheckboxClickEvent);

                checkResidencyQuestion();
            });

            function checkResidencyQuestion() {
                if (euroResident.value === "UKNationalUK") {
                    fldEuroResidentID.checked = true;
                    homeFeeEligibilityQuestion.classList.add("d-none");
                    fldHomeFeeEligibilityID.selectedIndex = 0;
                }
                else if (euroResident.value === "UKNationalEEA") {
                    fldEuroResidentID.checked = true;
                    homeFeeEligibilityQuestion.classList.add("d-none");
                    fldHomeFeeEligibilityID.selectedIndex = 0;
                }
                else if (euroResident.value === "EEANationalEEA") {
                    fldEuroResidentID.checked = true;
                    homeFeeEligibilityQuestion.classList.remove("d-none");
                }
                else if (euroResident.value === "UkraineNational") {
                    fldEuroResidentID.checked = false;
                    homeFeeEligibilityQuestion.classList.add("d-none");
                }
                else {
                    fldEuroResidentID.checked = false;
                    homeFeeEligibilityQuestion.classList.add("d-none");
                    fldHomeFeeEligibilityID.selectedIndex = 0;
                }
            }
            checkResidencyQuestion();

            fldEuroResidentID.addEventListener(`click`, function (event) {
                if (fldEuroResidentID.checked === true) {
                    homeFeeEligibilityQuestion.classList.add("d-none");
                    fldHomeFeeEligibilityID.selectedIndex = 0;
                }
                else {
                    homeFeeEligibilityQuestion.classList.remove("d-none");
                }
            });

            [...fldHomeFeeEligibilityID.options].forEach(function (option) {
                if (option.value === ``) {
                    //Keep option
                }
                else if (option.value === `1`) {
                    option.text = `Settled Status`;
                }
                else if (option.value === `2`) {
                    option.text = `Pre-Settled Status`;
                }
                //      else if (option.value === `13`) {
                //          option.text = `Ukraine National`;
                //}
                else if (option.value === `14`) {
                    option.text = `None of the Above`;
                }
                else {
                    option.remove();
                }
            });
        }
    });
</script>