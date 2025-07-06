<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_evidence_new.ascx.vb" Inherits="checkout_evidence_new" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%--<ol class="breadcrumb" runat="server">
<li class="active">Results Day</li>
</ol>--%>


<br />
<br />
<div class="well mt" id="divmain" runat="server">
    <h3>Results upload page</h3>
    <p><strong>Course: <asp:Label runat="server" id="courseLabel"></asp:Label></strong></p>
<p>Please make sure the upload of your <strong>results slip(s)/certificate(s)</strong> are <strong>clear</strong> and <strong>contains your name</strong> on each individual upload. You must ensure the grade for Maths, English Literature and English Language is included as well as any other specific entry requirement qualifications, without this it may delay your enrolment. </p>
        <p>If you did not sit these qualifications or you are submitting an appeal to your provider regarding your grading, please add details of this into the notes box so we are aware.</p>
    <p><strong>Note: once you have selected your file, you will need to click the 'Upload' button</strong></p>
<div class="row">
<div class="col-md-3 columns form-group">
<p>* Select type of evidence:</p>
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server">
                                <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                <asp:ListItem Text="Certificate" Value="Certificate"></asp:ListItem>
                                <asp:ListItem Text="Results Slip" Value="Results Slip"></asp:ListItem>                       
                                <asp:ListItem Text="Other…" Value="Other…"></asp:ListItem>
                            </asp:DropDownList>
</div>
<div class="col-md-3 columns form-group">
<p>Notes:</p>
<asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="3" Width="50%"></asp:TextBox>
</div>
<div class="col-md-3 columns form-group">
<p>Click on 'choose file' to locate the file</p>
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
<div class="col-md-3 columns form-group">
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
                            <td><%# Eval("TypeOfEvidence") %></td>
                            <td><%# Eval("Notes") %></td>
                            <td><%# Eval("FileName") %></td>
                            <td class="text-center">
                                <asp:Button ID="btnRemove" runat="server" Text="X" CssClass="btn btn-danger" CommandName="RemoveAttachment" CommandArgument='<%# Eval("AttachmentID") %>' OnClientClick="return confirmDeletion()" /></td>
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


<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" />

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