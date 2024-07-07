<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_feeremission_new.ascx.vb" Inherits="checkout_feeremission_new" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>


<div class="intro-block">
							
								<h1>Fee Remission <span class="last-word"> Form</span></h1>
					
						</div>

<div class ="panel panel-info" hidden="hidden">
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
    DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none" Caption='<h4>Your Offering</h4>'
CaptionAlign="Top">

        
    <Columns>
        <asp:BoundField DataField="Code" HeaderText="Course Code">
            <ControlStyle CssClass="searchgridfield" />
        </asp:BoundField>
        <asp:BoundField DataField="Name" HeaderText="Course Name">
            <ControlStyle CssClass="searchgridfield" />
        </asp:BoundField>
        <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date"
            HtmlEncode="False">
            <ControlStyle CssClass="searchgridfield" />
        </asp:BoundField>
        <asp:BoundField DataField="DayOfWeek" HeaderText="Day" />
        <asp:BoundField DataField="StartTime" DataFormatString="{0:HH:mm}" HeaderText="Time"
            HtmlEncode="False">
            <ControlStyle CssClass="searchgridfield" />
        </asp:BoundField>
        <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date"
            HtmlEncode="False">
            <ControlStyle CssClass="searchgridfield" />
        </asp:BoundField>
        <asp:BoundField DataField="SiteDescription" HeaderText="Venue"
            HtmlEncode="false" > 
            <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
        <asp:TemplateField HeaderText="Full Fee">
            <ItemTemplate>
                <asp:Label ID="lblStandardFee" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
       
    </Columns>
    <RowStyle CssClass="searchgridcell" />
    <HeaderStyle CssClass="searchgridheader" />
    <EmptyDataTemplate>
                <p>No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.</p>
            </EmptyDataTemplate>
        </asp:GridView>

    </div>
<div class="form-field-section grey" id="divmain" runat="server">


    <h2>Fee Remission Form</h2>



   

    <hr />

   

     <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="StudentEnrolmentField2" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="Student Reference Number (found in your email)" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="First Name" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="Surname" />
    </div>
    <div class="form-input">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
    </div>
    <%-- <div class="form-input">
        <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"  LabelWidth="200" ClientIDMode="Static" HTML5InputType="date"/>
    </div>--%>

      <div class="form-input">
       <p class="textfieldlabelrequired">Date of Birth</p>
       <asp:textbox id="DoB" runat="server" type="date" />
    </div>


   
       <h3>Employment</h3>


  
          <div class="form-input">
       <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="StudentEnrolmentField7" runat="server" IsRequired="false" LabelWidth="300"
            CustomCaption="National Insurance No." Pattern="^(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]$" />
                   <p><i>Note: If you are 19+ or enrolling on an apprenticeship providing a national insurance number is mandatory</i></p>
    </div>


  
        
             
<asp:HiddenField runat="server" ID="HiddenFieldForEmploymentvalue" />
    
      <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert-danger" />

    <div class="form-input">
         <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentStatusID" ID = "Field_EmploymentStatusID" runat="server" IsRequired="True" LabelWidth="300"
           CustomCaption="Employment Status" ClientIDMode="Static" 
             ExcludedIDValues="98" />
    </div>
 <div class="Employedfields" id ="Employedfields" runat="server">

     
    <div class="form-input">
        <span class="textfieldlabelrequired">Are you self Employed?</span>
        <asp:RadioButtonList runat="server" ID="rdoSelfEmp" CssClass="select" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>        
        </asp:RadioButtonList>
          </div>
    <br />

    <%-- <div class="form-input">
         <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="isSelfEmployed" ID="Field_IsSelfEmployed" runat="server" IsRequired="false" LabelWidth="300"
           CustomCaption="Are You Self Employed?" />
    </div>
      --%>
      
<%--             <div class="form-input">
                 <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfEmploymentID" ID="Field_LengthOfEmployment" runat="server" IsRequired="false" LabelWidth="300"
                   CustomCaption="Employment Length" />
            </div>--%>

             <div class="form-input">
                  <span class="textfieldlabelrequired">How many hours per week? (If employed) </span>
                 <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentIntensityID" ID="Field_EmploymentIntensityID" runat="server" IsRequired="false" LabelWidth="300"
                   CustomCaption=" " />
            </div>
          <div class="form-input">
               <span class="textfieldlabelrequired">For how long have you been employed? (If employed)</span>
                 <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfEmploymentID" ID="StudentEmploymentHistoryField1" runat="server" IsRequired="false" LabelWidth="300"
                   CustomCaption=" " />
            </div>
      <h4>Employer Details</h4>
   
        <p><i>Please enter the name of your current employer</i></p>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerName" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Name" ClientIDMode="Static" />
        </div>
        <hr />
        <h4>Employer Address</h4>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress1" ID="StudentEnrolmentField31" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Address Line 1 (Number and Street/Road)" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress2" ID="StudentEnrolmentField32" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Address Line 2 (Area)" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress3" ID="StudentEnrolmentField33" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Address Line 3 (Town/City)" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress4" ID="StudentEnrolmentField34" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Address Line 4 (County/District)" />
        </div>
        <div class="form-input">
            <label for="employerpostcode" style="width: 300px; font-weight: normal;">Employer Postcode</label><input type="text" class="form-control" runat="server" id="employerpostcode" title="Postcode" placeholder="Enter Postcode" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerEmail" ID="StudentEnrolmentField35" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerTel" ID="StudentEnrolmentField36" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Contact Number" />
        </div>
      
                
   
     </div>
     <div class="UnEmployedFieldsToHide" id ="UnEmployedFieldsToHide" runat="server">
    <div class="form-input">
         <span class="textfieldlabelrequired">Length of Unemployment (If Unemployed) </span>
                <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="LengthOfUnemploymentID" ID="Field_LengthOfUnemploymentID" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption=" " />
    </div>
         </div>
          
              
      

 
                
         
        
             
<%--                      <div class="form-input">
        <span class="textfieldlabelrequired">Will this course help you gain Employment if you are Unemployed?</span>
        <asp:RadioButtonList runat="server" ID="rdoGainEmp" CssClass="textfield form-control radiofield" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>        
        </asp:RadioButtonList>
          </div>--%>

         <p>Choose your type of benefits, if none apply please leave blank</p>

   

      
    
          <div class="form-input">
         <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType=BenefitStatusIndicatorID 
             ID="Field_BenefitStatusIndicatorID" runat="server" IsRequired="false" LabelWidth="300"
           CustomCaption="Benefit Status"/>
    </div>
 

   <div class="EmployerFieldsToHide" id ="EmployerFieldsToHide" runat="server" hidden="hidden">

      
    <h4>Employer</h4>   

     <div class="form-input">
         <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerName" ID="StudentEnrolmentField25" runat="server" IsRequired="false" LabelWidth="300"
           CustomCaption="Employer Name" ClientIDMode="Static"/>
    </div>


       </div>
    <br />
    <br />

   <%--    <p><b>Household Situation</b></p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HouseholdSituation1ID" ID="StudentEnrolmentField17" runat="server" LabelWidth="0" IsRequired="true"
                CustomCaption="Household Situation"/>--%>
 

  
       <%--  <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField4" CustomCaption="(Y/N)" StudentEnrolmentFieldType="StudentDetailUserDefined27" LabelWidth="400" CustomFieldType="TickBox" />
        </div>--%>
     <%--    <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField19" CustomCaption="Do you have a HEFCE Disabled Students Allowance or Personal Independence Disability Living Allowance?" StudentEnrolmentFieldType="HasDisabledStudentsAllowance" LabelWidth="400" />
        </div>--%>

    </div>

<div class="form-field-section grey" id="div1" runat="server">
   <h2>Evidence</h2>


        <p><b>You may upload 1 form of Identification</b></p>

            <p><b>You may also upload your proof of Qualifications (Results slip / certificates) </b></p>

        <p>Accepted forms of Identification:    
        </p>
        <ol>



            <li>Current signed passport

            </li>
            <li>Original birth certificate (UK birth certificate issued within 12 months of the date of birth in full form including those issued by UK authorities overseas such as Embassies High Commissions and HM Forces)</li>

            <li>Current UK photocard driving licence</li>
            <li>Full old-style driving licence</li>
            <li>Residence permit issued by the Home Office to EEA nationals on sight of own country passport</li>
            <li>National identity card bearing a photograph of the applicant</li>
        </ol>
        <br />


        <p><b>You may also upload specific evidence for your Funding Declaration / Course Requirements - please see the table below for what you should upload: </b></p>

          <h5>To evidence your eligibility:</h5>
            <table class="table table-striped table-bordered">
                <tr class="active">
                    <th>Option</th>
                    <th>Evidence to Upload</th>
                    <tr>
                        <td>My Employer is Paying my Fees</td>
                        <td>Please provide a Purchase Order, or letter of Confirmation from the Employer</td>
                    </tr>
                <tr>
                    <td>I am on Benefits</td>
                    <td>Please provide a Universal Credit Statement, screenshot or proof of benefits
                    </td>

                </tr>
        
                <tr>

                    <td>I am using an Student Loan to fund this course
                    </td>
                    <td>Please provide evidence of your loan confirmation letter
                    </td>


                </tr>



              
            </table>
     

      


            <div class="row">
                <div class="col-md-3">
                    Type of Evidence
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CssClass="txtnotes">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                <asp:ListItem Text="Confidential Discolure Form" Value="Confidential Discolure Form"></asp:ListItem>
                                <asp:ListItem Text="Grade Certificate" Value="Grade Certificate"></asp:ListItem>
                                <asp:ListItem Text="Results Slip" Value="Results Slip"></asp:ListItem>
                                <asp:ListItem Text="Passport" Value="Passport"></asp:ListItem>
                                <asp:ListItem Text="Driving Licence" Value="Driving Licence"></asp:ListItem>
                                <asp:ListItem Text="Residence Permit" Value="Residence Permit"></asp:ListItem>
                                <asp:ListItem Text="National Identity Card" Value="National Identity Card"></asp:ListItem>
                                <asp:ListItem Text="Pension Statement" Value="Pension Statement"></asp:ListItem>
                                <asp:ListItem Text="Payslip" Value="Payslip"></asp:ListItem>
                                <asp:ListItem Text="Bank Statement" Value="Bank Statement"></asp:ListItem>
                                <asp:ListItem Text="Household income evidence" Value="Household income evidence"></asp:ListItem>
                                <asp:ListItem Text="Tax Credit Award letter" Value="Tax Credit Award letter"></asp:ListItem>
                                <asp:ListItem Text="DSA/PIP/ESA Award notice" Value="DSA/PIP/ESA Award notice"></asp:ListItem>
                                <asp:ListItem Text="Local Authority Letter" Value="Local Authority Letter"></asp:ListItem>
                                <asp:ListItem Text="P60/" Value="P60/"></asp:ListItem>
                                <asp:ListItem Text="Benefit Evidence" Value="Benefit Evidence"></asp:ListItem>
                                <asp:ListItem Text="Award Letter (Asylum)" Value="Award Letter(Asylum)"></asp:ListItem>
                                <asp:ListItem Text="Loan Confirmation" Value="Loan Confirmation"></asp:ListItem>
                                <asp:ListItem Text="Other…" Value="Other…"></asp:ListItem>
                            </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    Notes
            <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="8" Width="100%" CssClass="txtnotes"></asp:TextBox>
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
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-success" CausesValidation="false" />
                </div>

            </div>

            <br />
            <asp:ValidationSummary ID="vsAttachments" runat="server" CssClass="alert alert-danger" />
            <hr />
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
                        <tr id="trNoItems" runat="server" class="searchgridcell" visible="false">
                            <td colspan="4">No attachments uploaded yet
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

          





  
 

<br />
<hr />

    <cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="btn-primary" LinkResource="checkout_enrolments2_new_aspx" Visible="false"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" CausesValidation="true" />
    <br />
</div>

 <script type="text/javascript">




     $('.Employedfields').hide();
     $('.EmployerFieldsToHide').hide();
     $('.UnEmployedFieldsToHide').hide();




     $('#cboEmploymentStatusID').change(function () {

         $('#cboEmploymentStatusID').val($(this).val());


         if ($(this).val() == "10") {
             $('.Employedfields').slideDown()
             $('.UnEmployedFieldsToHide').slideUp()
         }
         else if ($(this).val() == "11") {
             $('.Employedfields').slideUp()
             $('.UnEmployedFieldsToHide').slideDown()
         }
         else if ($(this).val() == "12") {
             $('.Employedfields').slideUp()
             $('.UnEmployedFieldsToHide').slideDown()
         }
         else {
             $('.Employedfields').slideUp()
             $('.UnEmployedFieldsToHide').slideUp()
         }

     });

 </script>


<script type="text/javascript">
    $(document).ready(function () {


        $('#HiddenFieldForEmploymentvalue').ready(function () {

            $('#HiddenFieldForEmploymentvalue').val($(this).val());


            if ($(this).val() == "10") {
                $('.Employedfields').slideDown()
                $('.Employedfields').show()
                $('.UnEmployedFieldsToHide').hide()
                $('.UnEmployedFieldsToHide').SlideUp()
            }
            else if ($(this).val() == "11") {
                $('.Employedfields').slideUp()
                $('.Employedfields').hide()
                $('.UnEmployedFieldsToHide').slideDown()
                $('.UnEmployedFieldsToHide').show()
            }
            else if ($(this).val() == "12") {
                $('.Employedfields').slideUp()
                $('.Employedfields').hide()
                $('.UnEmployedFieldsToHide').slideDown()
                $('.UnEmployedFieldsToHide').show()
            }
            else {
                $('.Employedfields').slideDown()
                $('.Employedfields').show()
                $('.UnEmployedFieldsToHide').slideDown()
                $('.UnEmployedFieldsToHide').show()
            }

        });
    });
</script>


<script type="text/javascript">
    $("#btnChooseFile").click(function () {
        $('#fuAttachment').click();
    });
    function confirmDeletion() {
        var result = confirm("Are you sure you want to delete this attachment? Press OK to continue deletion.");
        if (result) {
            return true;
        }
        return false;
    }    
</script>