<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="checkout_dataprotection.ascx.vb" Inherits="checkout_dataprotection"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>
      <!--          <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li id="linkParent" runat="server" CausesValidation="true"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian / Emergency</a></li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="lnkQuals" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare">Declarations</li>
                </ol>
          -->

<script>

                 $(function () {
                     $('[data-toggle="tooltip"]').tooltip()
                 })

          </script>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_parent_guardian.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_enrolments2.ascx"><i class="fa-solid fa-clipboard-list"></i> <span class="d-none d-sm-inline">Further Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_quals_on_entry.ascx"><i class="fa-solid fa-award"></i> <span class="d-none d-sm-inline">Qualifications on Entry</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_employment.ascx"><i class="fa-solid fa-city"></i> <span class="d-none d-sm-inline">Employment Status</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/checkout_attachments.ascx"><i class="fa-solid fa-paperclip"></i> <span class="d-none d-sm-inline">Attachments</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/photo.ascx"><i class="fa-solid fa-camera"></i> <span class="d-none d-sm-inline">Photo Upload</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-circle-info"></i> Privacy Notice</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 90%">90%</div>
</div>
  
    
<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-circle-info"></i> Privacy Notice</h4>

    <p>The data you provide including in some cases, special category (or �sensitive�) data, will be <strong>stored and processed</strong> by the College to support your enrolment and provision of education.</p>
    <p>It will be used for administrative and financial purposes relating to the provision of your education and provision of accommodation (so we can perform our contract with you); for audit and for Ofsted inspection and to provide local education authorities (�LEAs�), schools and academies with information such as destinations data (where we have a statutory obligation to process and share your data); to track student loans, support care standards, safeguarding and health and safety (because of our legal obligations as a public body); for marketing and event management and to monitor compliance with policies and standards (to support the College�s legitimate interests) including the College�s collections policy for failure to pay fees (where we reserve the right to pass your personal details onto debt collectors).</p>
    <p>We will <strong>share your data with some third parties</strong>, including the ESFA, LEAs, OfS, Ofsted, Student Loans Company, Higher Education Statistics Agency (�HESA�) and awarding bodies where this is necessary for the provision of your education or other core purposes and or where there is a statutory obligation to provide this information.</p>
    <p>For instance, every student must have an <strong>Individualised Learner Record (ILR)</strong> and the College must collect data about learners and learning undertaken and share those details with the ESFA as a condition of its funding.</p>
    <p>Your information may be shared by the ESFA with third parties for education, training, employment and well-being related purposes, including for research. In some instances, the DfE (Department for Education) and the English European Social Fund (ESF) Managing Authority (or agents acting on their behalf) may contact you in order for them to carry out research and evaluation to inform the effectiveness of training.</p>
    <p>This will only take place where the law allows it and the sharing complies with data protection legislation. The DfE is the data controller for personal data processed by the ESFA.</p>
    <p>To see how the ESFA will use your information, please go to <a href="https://www.gov.uk/government/publications/privacy-notice-for-key-stage-5-and-adult-education/privacy-notice-for-key-stage-5-and-adult-education" target="_blank">https://www.gov.uk/government/publications/privacy-notice-for-key-stage-5-and-adult-education/privacy-notice-for-key-stage-5-and-adult-education</a>.</p>
    <p>For more information about the ILR and the data collected, please see the ILR specification at <a href="https://www.gov.uk/government/collections/individualised-learner-record-ilr" target="_blank">https://www.gov.uk/government/collections/individualised-learner-record-ilr</a>.</p>
    <p class="mb-4">See also <a href="https://guidance.submit-learner-data.service.gov.uk/23-24/ilr/ilrprivacynotice" target="_blank">https://guidance.submit-learner-data.service.gov.uk/23-24/ilr/ilrprivacynotice</a></p>

    <p><strong>If you are under 18 years of age, the College reserves the right to discuss e.g. your attendance, behaviour, financial matters including bursaries and any safeguarding issues with your named contacts.</strong></p>
    <p>The College also reserves the right to disclose information to your employer (regardless of your age), where connected with the College.</p>
    <p><strong>Where your consent is required for us to share your information</strong> with third parties such as the provision of catering and transport, offsite activities, etc there will be a clear purpose for the sharing and a data sharing agreement will be put in place to define expectations for the use, control and security of that data.</p>
    <p>Where your consent is required for us to share your information with third parties, you can withdraw your consent at any time; but this could prevent those services being provided to you.</p>
    <p>In some cases, it may be necessary for us to share your personal data without your consent, for instance, with the police and or Social Services, where it is in your �vital interests� to do so, such as in an emergency situation, where it may not be possible to obtain your consent.</p>
    <p>We hold personal data in accordance with the College data retention policy (see <a href="https://www.askham-bryan.ac.uk/publication-scheme-data-protection/" target="_blank">https://www.askham-bryan.ac.uk/publication-scheme-data-protection/</a> for further details).</p>
    <p><strong>How long we keep information for will vary according to the type of information.</strong> Any data will either be deleted or anonymised when no longer needed. Unless otherwise stated, all data will remain at all times within the UK and European Economic Area (�EEA�).</p>
    <p><strong>If any data is to be shared outside the EEA, the College will enter into appropriate data processing agreements</strong> which will specify the <strong>safeguards</strong> that have to be in place to comply with UK data protection law, and if applicable, EU data protection law in cases where personal data will transfer to countries of the EU.</p>
    <p>If you are normally resident outside the EEA such as in the United States, China, Isle of Man or Channel Islands, you consent to your data being transferred outside of the EEA in the event that we have to contact your parents, guardian or carer, or for any other purposes related to your agreement with us, including medical emergency.</p>
    <p>If you have any concerns about the way the College collects or uses your personal data, you should raise your concerns in the first instance with the <strong>College's Data Protection Officer</strong>, <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a>.</p>
    <p>If you are not satisfied with that response, you may then wish to contact the Information Commissioner�s Office at <a href="https://ico.org.uk/" target="_blank">https://ico.org.uk/</a>.</p>
    <p>For further details about how we use your personal data and your rights under data protection legislation, see <a href="https://www.askham-bryan.ac.uk/publication-scheme-data-protection/" target="_blank">https://www.askham-bryan.ac.uk/publication-scheme-data-protection/</a></p>    
    <hr />

    <h5>Terms and Conditions</h5>
    <p>These are available on the College web site <strong><a href="https://www.askham-bryan.ac.uk" target="_blank">https://www.askham-bryan.ac.uk</a></strong> or by request from Student Records. They include important information about our rights to vary the contract with you, our liability to you and our rights to terminate the contract with you. </p>

</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-check"></i> Confirmation</h4>
    
    <div class="form-input">
      <span class="textfieldlabelrequired"></span><span class="textfieldlabelrequired3"> After you enrol, we would like to send you details of services the College has to offer to support your study and your time here at the College. However, you can unsubscribe from those emails at any time.</span>
            <asp:DropDownList runat="server" ID="selectStayingInTouch"  CssClass="form-input" >
                <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
                <asp:ListItem Text="Yes - please use my contact details to keep me informed of services the College has to offer to support my study and my time here at the College" Value="1"></asp:ListItem>
                <asp:ListItem Text="No - I do not wish to receive details of services the College has to offer to support my study and my time here at the College" Value="2"></asp:ListItem>
            </asp:DropDownList>
          </div>

        <div class="form-input">
      <span class="textfieldlabelrequired"></span><span class="textfieldlabelrequired3"> I consent to the use of SMS text message by the college with regarding to my enrolment and course.</span>
            <asp:DropDownList runat="server" ID="selectSMSConsent"  CssClass="form-input" >
                <asp:ListItem Text="--Please Select--" Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
            </asp:DropDownList>
          </div>

    <hr />

    <h5>Declaration</h5>
 
        <%--<div id="divAdult" runat="server">


        <span class="textfieldlabelrequired">Please note, over 19s are usually liable for course fees. For course fees, these will be higher if you live in a devolved authority area. You may be able to find support based on your personal circumstances. Please tick to confirm you acknowledge this.</span>
            <div class="form-input">
            <asp:CheckBox ID="rdoAdult" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" />
                </div>
        </div>--%>

    <div class="form-input">
    <p><B>Please read the following statements.</B></p>
        
     <ul>
         <li>I declare that the information given on this enrolment form is correct to the best of my knowledge.</li>
         <li>I have read the above Privacy Notice and understand how my personal information will be used and agree to my personal information being used and shared in this way.</li>
         <li>I have read and agree to the College terms and conditions.</li>
     </ul>  
    </div>
       
    <div class="form-input">
        <p><b>Please tick to acknowledge the above statements.</b></p>
     <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" /> 


    </div>

    <br />
    <br />

   

</div>


<%--       <cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button"  LinkResource="checkout_photo_1618_aspx"  />
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" CssClass="button"  CausesValidation="true"/>--%>

<asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="checkout_photo_1618_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Submit </button>
                <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" />
            </span>
        </div>
    </div>
</div>

<style>

    input[type=checkbox]{

        margin-inline-start:100px;
        width:50px;
        height:30px;
     

    }
</style>


<script>


    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= selectStayingInTouch.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkSentMarktingInfo').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkSentMarketingInfo').prop('checked', false);
            }
        });
</script>