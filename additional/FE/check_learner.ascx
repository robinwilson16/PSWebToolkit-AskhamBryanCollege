<%@ Control Language="VB" AutoEventWireup="false"  CodeFile="check_learner.ascx.vb" Inherits="webcontrols_check_learner" %>

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
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FE/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FE/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-user-check"></i> Learner Check</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 15%">15%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-user-check"></i> Learner Check</h4>

   <div class="row">
      <div class="col-sm-12 columns form-group mb-3"> 
          <p>Please enter your details so we can check your information.</p>
          </div>
  </div>


<%--<% If HasSearched = False %>--%>
<div class="<%=FormCssClass %>">
    <div class="row">
        <div class="col-sm-6 columns form-group">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstForename" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Forename or Given Name" />
            <asp:CustomValidator ID="fldFirstForenameValidator" runat="server"></asp:CustomValidator>
        </div>
        <div class="col-sm-6 columns form-group">       
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname or family name" />
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField ID="fldDateOfBirth" runat="server" IsRequired="false" StudentEnrolmentFieldType="DateOfBirth" LabelWidth="200" ClientIDMode="Static" Placeholder="dd/mm/yyyy" HTML5InputType="date" />
            <asp:CustomValidator ID="fldDateOfBirthValidator" runat="server"></asp:CustomValidator>
            <div class="alert alert-secondary" role="alert" id="AgeInfo">
                &nbsp;
            </div>
            <asp:Textbox runat="server" ID="Age31stAug" Placeholder="Age31stAug" type="number" ClientIDMode="Static" class="d-none" />
        </div>
        <div class="col-sm-6 columns form-group">
            <label for="postcode" class="textfieldlabelrequired">Postcode</label>
            <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="" autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode" ClientIDMode="Static" />
            <%--pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" Title="Please enter a valid Postcode"--%>    
            <asp:CustomValidator ID="postcodeValidator" runat="server"></asp:CustomValidator>
        </div>
    </div>



    <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

    <div class="alert alert-primary" role="alert">
        <div class="row gap-3">
            <div class="col-md text-center">
                <span class="d-grid gap-2 d-md-block">
                    <button id="CheckDetailsButton" type="submit" class="btn btn-primary btn-lg"><i class="fa-solid fa-magnifying-glass"></i> Check Details</button>
                </span>
            </div>
        </div>
    </div>
</div>
<%--<% End If %>--%>

<% If HasSearched = True %>
    <% If IsADuplicate = True %>
        <div id="DuplicateWarning" class="alert alert-warning hstack gap-3" role="alert">
            <div>
                <i class="fa-solid fa-triangle-exclamation"></i>
            </div>
            <div>
                <p>
                    You have already applied <strong><%=TimesApplied %> time/s</strong> for <%=Course.CourseCode%> - <%=Course.CourseInformationTitle %> and cannot apply for the same course more than once.
                </p>
                <p>
                    If you believe this to be an error or want to speak to us about your enrolment, or want to provide additional information or documents to support your enrolment, then please email <a href="mailto:student.records@askham-bryan.ac.uk?subject=Cannot Upload Photo">student.records@askham-bryan.ac.uk</a>. Please include your <strong>full name</strong> in the subject line.
                </p>
                <p>
                    Details you supplied:
                </p>
                <ul>
                    <li>First Name: <strong><%=WorkingData.EnrolmentRequestRow.FirstForename %></strong></li>
                    <li>Surname: <strong><%=WorkingData.EnrolmentRequestRow.Surname %></strong></li>
                    <li>Date of Birth: <strong><%=Format(WorkingData.EnrolmentRequestRow.DateOfBirth, "dd/MM/yyyy") %></strong></li>
                    <li>Post Code: <strong><%=WorkingData.EnrolmentRequestRow.PostcodeOut %> <%=WorkingData.EnrolmentRequestRow.PostcodeIn %></strong></li>
                </ul>
            </div>
        </div>
    <% Else %>
        <div id="DuplicateOK" class="alert alert-primary hstack gap-3" role="alert">
            <div>
                <i class="fa-solid fa-circle-info"></i>
            </div>
            <div>
                <p>
                    We have successfully checked your details. Please press the Next button below to move to the next stage.
                </p>
            </div>
        </div>
    <% End If %>
<%End If %>

<% If HasSearched = True And IsADuplicate = False Then %>
<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>
<% End If %>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {

        //Calculate age and show under input box
        let dob = document.getElementById(`txtDateOfBirth`);
        let postcode = document.getElementById(`postcode`);
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

        let checkDetailsButton = document.getElementById(`CheckDetailsButton`);

        //Switch dates from yyyy-MM-dd to dd/MM/yyyy before form submission
        if (checkDetailsButton !== null) {
            checkDetailsButton.addEventListener('click', function (event) {
                let dateBoxes = document.querySelectorAll(`#aspnetForm input[type=date]`);
                dateBoxes.forEach(function (elem) {
                    switchDateDMY(elem.id);
                });
            });
        }
    });
</script>
