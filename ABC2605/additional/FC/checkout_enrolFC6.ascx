<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC6.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address and Contact Details</li>
                    <li>Emergency Contact Details</li>
                    <li>Supporting You</li>
                    <li>Education and Employment</li>
                    <li><strong>Payment and Privacy Notice</strong></li>
                    </ol>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>

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

    

<h2 class="app-title">Payment and Privacy Notice</h2>


    <div id="feearea" runat="server">

    <h5>Payment Method</h5>


    
        <p><strong>Who is paying and method. You must give contact details and proof if others have agreed to pay.</strong></p>
        <p class="textfieldlabelrequired">Who is paying?</p>

        <asp:DropDownList ID="whopays" runat="server" ClientIDMode="Static">
            <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
            <asp:ListItem Value="1" Text="I am paying my own fee"></asp:ListItem>
            <asp:ListItem Value="2" Text="My employer is paying my fee"></asp:ListItem>
            <asp:ListItem Value="3" Text="Someone else is paying"></asp:ListItem>
        </asp:DropDownList>
        
        <p class="textfieldlabelrequired">How do you intend to pay?</p>

        <asp:DropDownList ID="howpay" runat="server" ClientIDMode="Static">
            <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
            <asp:ListItem Value="1" Text="Card"></asp:ListItem>
            <asp:ListItem Value="2" Text="Cheque"></asp:ListItem>
            <asp:ListItem Value="3" Text="Invoice"></asp:ListItem>
        </asp:DropDownList>

    <div class="row" id="Card" >
        <div class="col-sm-12 columns form-group"><strong>You will need to pay at the end of this form.</strong>
        </div>
    </div>
    <div class="row" id="Cheque" >
        <div class="col-sm-12 columns form-group"><strong>Please make payable to 'Askham Bryan College' with your name and address on reverse and return with enrolment form??</strong>
        </div>
    </div>
    <div class="row" id="Invoice" >
        <div class="col-sm-12 columns form-group"><strong>You will need to provide details of who to invoice and upload evidence of their agreement to pay my fees.</strong>
        </div>
    </div>
<hr />

    <div class="employerpaying">
            <p>If someone else is paying the fee, please upload evidence</p>

    <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined14" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Contact Name"/>
    </div>
    <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnrolmentUserDefined15" ID="StudentEnrolmentField4" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Contact phone (inc. STD code)"/>
    </div>

    </div>

       <div id="upload" class="divUpload">



    <div class="bs-tab-content bs-active">

        <h5>Please provide a Purchase Order, or letter of Confirmation from the Employer/someone else</h5>
        
    </div>
     
    <div class="row" >
        <div class="col-md-3">
            Type of Evidence
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CssClass="txtnotes" ClientIDMode="Static">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>

                                 <asp:ListItem Text="Evidence letter" Value="Evidence letter"></asp:ListItem>
                            </asp:DropDownList>
        </div>
    
        <div class="col-md-3">
            Upload File
                            <%--
                                Following properties are there to use in the File Upload control
                                - IsRequired (To set control mandatory)
                                - RequiredErrorMessage (A message to display when user is not uploading file)
                                - MaxAllowedFileSize (Maximum size allowed for a file upload in KB). Use this to override value set in System Setting of same name.
                                - MaxAllowedFileSizeErrorMessage  (A message to display when user has uploaded larger file than allowed)
                                - SupportedFileTypes (File Types supported by the control (.jpg, .png, .xlsx)). Use this to override value set in System Setting of same name.
                                - SupportedFileTypesErrorMessage (A message to display when user has uploaded file of type which is not valid)
                                - HideUserInfoOnTooltip (To prevent showing of information related to file upload requirements)
                                - UserInfo (User Information related to file upload requirements - if need to display at any specific location manually)
                            --%>
            <cc1:CCCFileUpload ID="fuAttachment" runat="server" data-html="true" ClientIDMode="static" IsRequired="true" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="btnUpload" runat="server" Text="Upload" class="button" CausesValidation="false" />
        </div>

    </div>

    <br />
    <asp:ValidationSummary ID="vsAttachments" runat="server" CssClass="alert alert-danger" />
    <div class="bs-tab-content bs-active">
        <table id="tblUploadedInfo" class="table table-striped table-bordered text-center" style="border-style: None;">
            <tbody>
                <asp:Repeater ID="rptAttachments" runat="server" OnItemCommand="rptAttachments_ItemCommand">
                    <HeaderTemplate>
                        <tr class="searchgridheader">
                            <th scope="col" style="width: 20%">Type of Evidence</th>
                            <th scope="col">Notes</th>
                            <th scope="col" style="width: 15%">Attachment</th>
                            <th scope="col" style="width: 10%">Remove</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr class="searchgridcell text-left">
                            <td><%#: Eval("TypeOfEvidence") %></td>
                            <td><%#: Eval("Notes") %></td>
                            <td><%#: Eval("FileName") %></td>
                            <td class="text-center">
                                <asp:Button ID="btnRemove" runat="server" Text="X" CssClass="btn btn-danger" CommandName="RemoveAttachment" CommandArgument='<%#: Eval("AttachmentID") %>' OnClientClick="return confirmDeletion()" /></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr id="trNoItems" runat="server" class="searchgridcell" visible="true">
                    <td colspan="4">No attachments uploaded yet
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

        </div>       


        <hr />

    </div>

    <h5>Privacy Notice</h5>
    <p><strong>How we use your personal information.</strong></p>
    <p>The data you provide including in some cases, special category (or “sensitive”) data, will be <strong>stored and processed</strong> by the College to support your enrolment and provision of education. It will be used for administrative and financial purposes relating to the provision of your education and provision of accommodation (so we can perform our contract with you); for audit and for Ofsted inspection and to provide local education authorities (“LEAs”), schools and academies with information such as destinations data (where we have a statutory obligation to process and share your data); to track student loans, support care standards, safeguarding and health and safety (because of our legal obligations as a public body); for marketing and event management; and to monitor compliance with policies and standards (to support the College’s legitimate interests) including the College’s collections policy for failure to pay fees (where we reserve the right to pass your personal details onto debt collectors). We will <strong>share your data with some third parties,</strong> including the ESFA, LEAs, OfS, Ofsted, Student Loans Company, Higher Education Statistics Agency (“HESA”) and awarding bodies where this is necessary for the provision of your education or other core purposes and or where there is a statutory obligation to provide this information. For instance, every student must have an <strong>Individualised Learner Record (ILR)</strong> and the College must collect data about learners and learning undertaken and share those details with the ESFA as a condition of its funding. Your information may be shared by the ESFA with third parties for education, training, employment, and well-being related purposes, including for research. In some instances, the DfE and the English European Social Fund (ESF) Managing Authority (or agents acting on their behalf) may contact you in order for them to carry out research and evaluation to inform the effectiveness of training. This will only take place where the law allows it and the sharing complies with data protection legislation. The DfE is the data controller for personal data processed by the ESFA. To see how the ESFA will use your information, please go to <a href="https://www.gov.uk/government/publications/esfa-privacy-notice/esfa-privacy-notice" target="_blank">https://www.gov.uk/government/publications/esfa-privacy-notice/esfa-privacy-notice</a> . For more information about the ILR and the data collected, please see the ILR specification at <a href="https://www.gov.uk/government/collections/individualised-learner-record-ilr" target="_blank">https://www.gov.uk/government/collections/individualised-learner-record-ilr</a> . See also <a href="https://guidance.submit-learner-data.service.gov.uk/22-23/ilr/ilrprivacynotice" target="_blank">https://guidance.submit-learner-data.service.gov.uk/22-23/ilr/ilrprivacynotice</a></p>
    <p><strong>If you are under 18 years of age</strong>, the College also reserves the right to disclose information to your parent, guardian, carer, for instance, to discuss your progression, details of your attendance, etc, or your employer (regardless of your age), where connected with the College. <strong>Where your consent is required for us to share your information</strong> with third parties such as the provision of catering and transport, offsite activities, etc there will be a clear purpose for the sharing and a data sharing agreement will be put in place to define expectations for the use, control, and security of that data. Where your consent is required for us to share your information with third parties, you can withdraw your consent at any time; but this could prevent those services being provided to you. In some cases, it may be necessary for us to share your personal data without your consent, for instance, with the Police and or Social Services, where it is in your “vital interests” to do so, such as in an emergency situation, where it may not be possible to obtain your consent. We hold personal data in accordance with the College data retention policy (see below for further details). <strong>How long we keep information for will vary according to the type of information.</strong> Any data will either be deleted or anonymised when no longer needed. Unless otherwise stated, all data will remain at all times within the UK and European Economic Area (“EEA”). <strong>If any data is to be shared outside the EEA, the College will enter into appropriate data processing agreements</strong> which will specify the safeguards that have to be in place to comply with UK data protection law, and if applicable, EU data protection law in cases where personal data will transfer to countries of the EU. If you are normally resident outside the EEA such as in the United States, China, Isle of Man or Channel Islands, by signing this form you consent to your data being transferred outside of the EEA in the event that we have to contact your parents or for any other purposes related to your agreement with us, including medical emergency. If you have any concerns about the way the College collects or uses your personal data, you should raise your concerns in the first instance with the <strong>College’s Data Protection Officer,</strong> <a href="mailto:judith.clapham@askham-bryan.ac.uk">judith.clapham@askham-bryan.ac.uk</a> . If you are not satisfied with that response, you may then wish to contact the Information Commissioner’s Office at <a href="https://ico.org.uk/concerns/" target="_blank">https://ico.org.uk/concerns/</a> . For further details about how we use your personal data and your rights under data protection legislation, see <a href="https://www.askham-bryan.ac.uk/the-college/college-policies" target="_blank">https://www.askham-bryan.ac.uk/the-college/college-policies</a></p>
   
     <hr />

    <h5>Staying in touch</h5>
    <span class="textfieldlabelrequired">After you enrol, we would like to send you details of services the College has to offer to support your study and your time here at the College. However, you can unsubscribe from those emails at any time.</span>

    <asp:DropDownList ID="rdoConsent" runat="server">
        <asp:ListItem Value="" Text="--please select-"></asp:ListItem>
        <asp:ListItem Value="1" Text="Yes - please use my contact details to keep me informed"></asp:ListItem>
        <asp:ListItem Value="0" Text="No - I do not wish to be contacted about College information and events"></asp:ListItem>
    </asp:DropDownList>

     <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcceptMArketingConsent" ID="fldConsent" runat="server" IsRequired="true" LabelWidth="300" CustomCaption=" " Enabled="True" CustomFieldType="TickBox" />
    </div>

    <br />
    <hr />

    <h5>Terms and Conditions</h5>
    <p>These are available on the College web site <a href="https://www.askham-bryan.ac.uk" target="_blank">https://www.askham-bryan.ac.uk</a> or by request from Student Records. They include important information about our rights to vary the contract with you, our liability to you and our rights to terminate the contract with you. </p>

    <hr />

    <h5>Declaration</h5>
 
        <%--<div id="divAdult" runat="server">


        <span class="textfieldlabelrequired">Please note, over 19s are usually liable for course fees. For course fees, these will be higher if you live in a devolved authority area. You may be able to find support based on your personal circumstances. Please tick to confirm you acknowledge this.</span>
            <div class="form-input">
            <asp:CheckBox ID="rdoAdult" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" />
                </div>
        </div>--%>

    <br />
    <span class="textfieldlabelrequired">I declare that the information given on this enrolment form is correct to the best of my knowledge. I have read the above Privacy Notice and understand how my personal information will be used and agree to my personal information being used and shared in this way. I have read and agree to the College terms and conditions.</span>
       <div class="form-input">

     <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="" Font-Bold="True" CausesValidation="True" /> 
    </div>
 
    <hr />

    <p><i>This project is part-financed by the European Union. ESF in England is investing in jobs and skills – focusing on people who need support the most and helping them fulfil their potential.</i></p>
   
    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" CausesValidation="true" CssClass="button" />


</div>
<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<style>

    input[type=checkbox]{

        margin-inline-start:100px;
        width:50px;
        height:30px;
     

    }
</style>
  


<script>


        $(document).ready(function () {




            var rdo = document.getElementsByName("<%= rdoConsent.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', false);
            }


            var RadioButtonListEU = document.getElementById("<%= rdoConsent.ClientID%>")
            RadioButtonListEU.onchange = function () {
                var rdo = document.getElementsByName("<%= rdoConsent.UniqueID%>")
                if (rdo[0].checked) {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', true);
                }
                else {
                    $('#ctl00_MainContentPlaceholder_ctl00_fldConsent_chkAcceptMarketingConsent').prop('checked', false);
                }



            };
        });
</script>


<script type="text/javascript">
    $(document).ready(function () {


        $('.employerpaying').hide();
        //$('.divUpload').hide();

        $('#whopays').change(function () {
            $("#<%=howpay.ClientID%>").val("")

            $("#Card").hide();
            $("#Cheque").hide();
            $("#Invoice").hide();


            $('#whopays').val($(this).val());

            if ($(this).val() == "2") {
                $('.employerpaying').show()
                $('.employerpaying').slideDown()
                //$('.divUpload').show()
                //$('.divUpload').slideDown()
            }
            else if ($(this).val() == "3")
            {
                $('.divUpload').show()
                $('.divUpload').slideDown()
            }
            else {
                $('.employerpaying').hide()
                $('.employerpaying').slideUp()
                //$('.divUpload').hide()
                //$('.divUpload').slideUp()

            }
        });
    });
</script>

<script type="text/javascript">
           $(document).ready(function () {

               $("#Card").hide();
               $("#Cheque").hide();
               $("#Invoice").hide();

             if ($("#<%=howpay.ClientID%>").val() == "1") {
                 $("#Card").show();
             }
             if ($("#<%=howpay.ClientID%>").val() == "2") {
                 $("#Cheque").show();
             }
             if ($("#<%=howpay.ClientID%>").val() == "3") {
                 $("#Invoice").show();
             }
 

               $('#<%= howpay.ClientID %>').change(function () {

                 $("#Card").hide();
                 $("#Cheque").hide();
                 $("#Invoice").hide();
   
               //student
               if ($("#<%=howpay.ClientID%>").val() == "1") {
                   $("#Card").show();
                   $("#Cheque").hide();
                   $("#Invoice").hide();
                   return;
               }
               //Cheque
               if ($("#<%=howpay.ClientID%>").val() == "2") {
                   $("#Card").hide();
                   $("#Cheque").show();
                   $("#Invoice").hide();
                   return;
               }
               //Invoice
               if ($("#<%=howpay.ClientID%>").val() == "3") {
                   $("#Card").hide();
                   $("#Cheque").hide();
                   $("#Invoice").show();
                   return;
               }
              
             });

         });

</script>

