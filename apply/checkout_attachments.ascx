<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_attachments.ascx.vb" Inherits="webcontrols_checkout_attachments" %>
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
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/supporting_you.ascx"><i class="fa-solid fa-hand-holding-medical"></i> <span class="d-none d-sm-inline">Supporting You</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_other_contacts.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/checkout_quals_on_entry.ascx"><i class="fa-solid fa-award"></i> <span class="d-none d-sm-inline">Qualifications on Entry</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-paperclip"></i> Documents/Evidence</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 80%">80%</div>
</div>

<div class="bd-callout bd-callout-askham bd-callout-grey">
    <h4><i class="fa-solid fa-paperclip"></i> Documents/Evidence</h4>

    <p>
        Please use this page to upload evidence to support your request.        
    </p>

    <div class="row">
        <div class="col-md-12 mb-4 d-flex align-items-stretch">
            <div class="card w-100">
                <div class="card-body d-flex flex-column">
                    <div class="row">
                        <div class="form-group col-md-6 col-xl-3">
                            <label for="ddlTypeOfEvidence">Type of Evidence</label>
                            <asp:DropDownList ID="ddlTypeOfEvidence" runat="server" CSSClass="form-control">
                                <asp:ListItem Text="-- Please Select --" Value=""></asp:ListItem>
                                <asp:ListItem Text="Qualification Certification" Value="Qualification Certification"></asp:ListItem>
                                <asp:ListItem Text="Passport" Value="Passport"></asp:ListItem>
                                <asp:ListItem Text="Utility Bill/Proof of Address" Value="Utility Bill/Proof of Address"></asp:ListItem>
                                <asp:ListItem Text="Proof of Benefits" Value="Proof of Benefits"></asp:ListItem>
                                <asp:ListItem Text="Residence status" Value="Residence status"></asp:ListItem>
                                <asp:ListItem Text="Other…" Value="Other…"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-6 col-xl-4">
                            <label for="txtNotes">Notes</label>
                            <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6 col-xl-3">
                            <label for="fuAttachment" class="mb-2">File</label>
                            <cc1:CCCFileUpload ID="fuAttachment" runat="server" data-html="true"  ClientIDMode="static"  IsRequired="true" SupportedFileTypes=".jpg, .png, .jpeg, .heic, .pdf, .doc, .docx" MaxAllowedFileSize="5000" MaxAllowedFileSizeErrorMessage="File size is larger than 5 MB" CSSClass="form-control pt-2 pb-3" />
                        </div>
                        <div class="form-group col-md-6 col-xl-2 text-end mt-auto">
                            <asp:LinkButton ID="btnUpload" runat="server" CssClass="btn btn-primary" CausesValidation="true"><i class="fa-solid fa-file-import"></i> Upload</asp:LinkButton>
                        </div>
                        <asp:CustomValidator ID="ddlTypeOfEvidenceValidator" runat="server"></asp:CustomValidator>
                    </div>
                </div>
            </div>
        </div>
        <asp:CustomValidator ID="FilePathValidator" runat="server"></asp:CustomValidator>
    </div>

    <asp:CustomValidator ID="btnUploadValidator" runat="server"></asp:CustomValidator>

    <hr />

    <%If rptAttachments.Items.Count = 0 %>
        <div runat="server" visible="<%#rptAttachments.Items.Count = 0 %>">
            <div class="alert alert-primary hstack gap-3" role="alert">
                <div>
                    <i class="fa-solid fa-file-import"></i>
                </div>
                <div>
                    <p>
                        No files uploaded yet
                    </p>
                </div>
            </div>
        </div>
    <%End If %>
    <asp:Repeater ID="rptAttachments" runat="server" OnItemCommand="rptAttachments_ItemCommand">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12 mb-4 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body d-flex flex-column">
                            <div class="row">
                                <div class="form-group col-md-6 col-xl">
                                    <p><strong>Type of Evidence</strong></p>
                                    <p><%# Eval("TypeOfEvidence") %></p>
                                </div>
                                <div class="form-group col-md-6 col-xl pt-2">
                                    <p><strong>Notes</strong></p>
                                    <asp:PlaceHolder runat="server" Visible='<%#displayNotesIcon(DataBinder.Eval(Container.DataItem, "Notes").ToString) %>'>
                                        <p><i class="fa-solid fa-note-sticky"></i> <%# Eval("Notes") %></p>
                                    </asp:PlaceHolder>
                                </div>
                                <div class="form-group col-md-6 col-xl pt-2">
                                    <p><strong>Attachment</strong></p>
                                    <p><i class="fa-solid fa-file-lines"></i> <%# Eval("FileName") %></p>
                                </div>
                                <div class="form-group col-md-12 col-xl text-end">
                                    <p><strong>Remove</strong></p>
                                    <asp:Button ID="btnRemove" runat="server" Text="X" CssClass="btn btn-danger" CommandName="RemoveAttachment" CommandArgument='<%# Eval("AttachmentID") %>' OnClientClick="return confirmDeletion()" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:HiddenField runat="server" ID="hiddenvalidator" Visible="true"/>
    <p class="mt-5"><strong>Not Able To Upload Your File/s</strong></p>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="StudentDetailUserDefined25" CustomFieldType="Lookup" StudentEnrolmentFieldType="StudentDetailUserDefined25" ClientIDMode="Static" CustomCaption="Can't upload your file/s at the moment - please select a reason why" />
    </div>
</div>

<asp:ValidationSummary ID="vsAttachments" runat="server" CssClass="alert alert-danger" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" LinkResource="quals_on_entry_abc" CausesValidation="false" />
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

<script type="text/javascript" src="<%= ResolveUrl("~/webcontrols/checkout_attachments.js") %>"></script>

<asp:TextBox runat="server" ID="FileChosen" ClientIDMode="Static" Value="N" class="d-none" />

<script>
    let fuAttachment = document.getElementById("fuAttachment");
    let fileChosen = document.getElementById("FileChosen");

    fuAttachment.addEventListener('change', function (event) {
        fileChosen.value = "Y";
    });
</script>