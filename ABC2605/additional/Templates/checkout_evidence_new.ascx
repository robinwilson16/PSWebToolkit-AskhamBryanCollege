<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_evidence_new.ascx.vb" Inherits="checkout_evidence_new" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%--<ol class="breadcrumb" runat="server">
<li class="active">Results Day</li>
</ol>--%>

					<div class="intro-block">
							
								<h1>Results Day <span class="last-word"> Form</span></h1>
					
						</div>



<br />
<br />

 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center" Visible="false"
    DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none" Caption='<h4>Your Course</h4>'
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
      <%--  <asp:TemplateField HeaderText="Full Fee">
            <ItemTemplate>
                <asp:Label ID="lblStandardFee" runat="server" Visible="false" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Concession Fee">
            <ItemTemplate>
                <asp:Label ID="lblConcessionFee" runat="server" Visible="false" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Remission Fee">
            <ItemTemplate>
                <asp:Label ID="lblBenefitsFee" runat="server" Visible="false" />
            </ItemTemplate>
        </asp:TemplateField>--%>
    </Columns>
    <RowStyle CssClass="searchgridcell" />
    <HeaderStyle CssClass="searchgridheader" />
    <EmptyDataTemplate>
                <p>No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.</p>
            </EmptyDataTemplate>
        </asp:GridView>

  





<div class="form-field-section grey" id="divmain" runat="server">


    <br />
    <h3>Details</h3>
    <p>Please enter your details - this is needed to match to your record</p>

     <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="StudentEnrolmentField2" runat="server" IsRequired="True" LabelWidth="300" CustomCaption="Student Reference Number (Found in your Email)" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="First Name" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname" />
    </div>  
     <div class="form-input">
        <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"  LabelWidth="300" ClientIDMode="Static"/>
    </div>    
</div>




 <div class="form-field-section grey" id="panel1" runat="server">
       <h2>Qualifications</h2>
       <hr />
 
    <h4>Please provide your grades</h4>
     
 
              <p>  Please include information on all Maths and English grades <b>Select 'Add Row' to Add Multiple Qualifications</b> </p>

    <asp:button runat="server" id="btnNoPriorQualifications" cssClass="show_hide btn btn-primary" text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:button>
    <br />
<br />
    <div id="slidingdiv" class="slidingDiv" runat="server">
<asp:table class="table table-striped text-center" id="tblQuals" runat="server">

</asp:table>
    <asp:button runat="server" id="btnAdd" cssClass="btn btn-success" text="Add Row" CausesValidation="false"></asp:button>

    </div>
      
    </div>

   
 

<div class="form-field-section grey">
    <div class="">
    <h3>Evidence - Results Slip</h3>
<p>Please enclose copies of Results slip/Certificate(s) - For all your Exams</p>

        <p><b>Maximum File Size 4MB - Only JPG, JPEG, GIF, PDF allowed</b></p>
<div class="row">
<div class="col-md-3">
Type of Evidence
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CssClass="txtnotes">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                <asp:ListItem Text="Certificate" Value="Certificate"></asp:ListItem>
                                <asp:ListItem Text="Results Slip" Value="Results Slip"></asp:ListItem>
               
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
                            <cc1:CCCFileUpload ID="fuAttachment" runat="server" data-html="true"  ClientIDMode="static"  IsRequired="true" />
</div>
<div class="col-md-3">
<asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn btn-success" CausesValidation="true" />
</div>
</div>    
    </div>

    <br />
    <asp:ValidationSummary ID="vsAttachments" runat="server" CssClass="alert alert-danger" />
    <hr />
    <div>
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
</div>
  

<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" />

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

    <script type="text/javascript">
        var divToHide1 = $('div#subject1');
        var showBtn1 = $('span#showItem1');

        showBtn1.click(function () {
            divToHide1.show();
        });


        $(document).ready(function () {

            divToHide1.hide();

        });
    </script>
<script type="text/javascript">
    var divToHide2 = $('div#subject2');
    var showBtn2 = $('span#showItem2');

    showBtn2.click(function () {
        divToHide2.show();
    });


    $(document).ready(function () {

        divToHide2.hide();

    });
    </script>

<script type="text/javascript">
    var divToHide3 = $('div#subject3');
    var showBtn3 = $('span#showItem3');

    showBtn3.click(function () {
        divToHide3.show();
    });


    $(document).ready(function () {

        divToHide3.hide();

    });
    </script>
<script type="text/javascript">
    var divToHide4 = $('div#subject4');
    var showBtn4 = $('span#showItem4');

    showBtn4.click(function () {
        divToHide4.show();
    });


    $(document).ready(function () {

        divToHide4.hide();

    });
    </script>
<script type="text/javascript">
    var divToHide5 = $('div#subject5');
    var showBtn5 = $('span#showItem5');

    showBtn5.click(function () {
        divToHide5.show();
    });


    $(document).ready(function () {

        divToHide5.hide();

    });
    </script>
<script type="text/javascript">
    var divToHide6 = $('div#subject6');
    var showBtn6 = $('span#showItem6');

    showBtn6.click(function () {
        divToHide6.show();
    });


    $(document).ready(function () {

        divToHide6.hide();

    });
    </script>
<script type="text/javascript">
    var divToHide7 = $('div#showmore');
    var showBtn7 = $('span#ShowMoreQuals');

    showBtn7.click(function () {
        divToHide7.show();
    });


    $(document).ready(function () {

        divToHide7.hide();

    });
    </script>
<script type="text/javascript">
    var divToHide8 = $('div#showmore');
    var showBtn8 = $('span#HideMoreQuals');

    showBtn8.click(function () {
        divToHide8.hide();
     
    });
 

   
    </script>