<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_photo.ascx.vb" Inherits="webcontrols_checkout_photo" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb breadcrumb-arrow p-0">
        <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_enrolments.ascx"><i class="fa-solid fa-user"></i> <span class="d-none d-sm-inline">Personal Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_parent_guardian.ascx"><i class="fa-solid fa-users"></i> <span class="d-none d-sm-inline">Emergency Contact Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_enrolments2.ascx"><i class="fa-solid fa-clipboard-list"></i> <span class="d-none d-sm-inline">Further Details</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_quals_on_entry.ascx"><i class="fa-solid fa-clipboard-list"></i> <span class="d-none d-sm-inline">Qualifications on Entry</span></a></li>
        <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/HE/checkout_attachments.ascx"><i class="fa-solid fa-paperclip"></i> <span class="d-none d-sm-inline">Documents/Evidence</span></a></li>
        <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-camera"></i> Photo Upload</li>
    </ol>
</nav>

<div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
    <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 70%">70%</div>
</div>


  <!--
   <p>In your photo you must:</p>
<ul> 

<li>be facing forwards and looking straight at the camera</li>
<li>have a plain expression and your mouth closed</li>
<li>have your eyes open and visible</li>
<li>not have hair in front of your eyes</li>
<li>not have a head covering (unless it’s for religious or medical reasons)</li>
<li>not have anything covering your face</li>
<li>not have any shadows on your face or behind you</li>
 <li>not have any filters applied (eg snapchat)</li>
 <li>not include friends, family, partnere, pets or other objects</li>
   </ul>
<p>Do not wear sunglasses or tinted glasses. You can wear other glasses if you need to, but your eyes must be visible without any glare or reflection.</p>

<a class="btn btn-primary" href="https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/303780/Photoguidance_v7.pdf" role="button" target="_blank">See example at gov.uk</a>
  <br /> <br />
      -->

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

    <div class="alert alert-primary" role="alert">
        <div class="row">
            <div class="col-md-auto d-flex align-items-center">
                <h3><i class="fa-brands fa-apple"></i></h3>
            </div>
            <div class="col-md">
                <p>
                    Please note, if you upload an HEIC (Apple iPhone) format file it is not currently possible to show you a preview of this file above so please check your device to ensure the photo you sent us is suitable rather than relying on the preview above.
                </p>
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

<%--<div class="form-field-section grey">
    <div class="row">        
    <div class="col-sm-12 col-md-6">
        <h2>Photo</h2>
        <div class="panel panel-info">
   <h3>Upload Photo - A headshot photograph for your student record</h3>
    <p><i>We will need you to provide a photograph this is so we can ensure the safety and security of everyone at the College and we’ll keep this photo with your student record for 6 years after your course ends.</i></p>
    <hr />
    <br />
             <p>You can take a picture using your phone as long as the photo is clear as shown in the image example below.</p>
    <p><strong>Up to 2 MB files accepted using format jpg, jpeg, png, gif only</strong></p>
            <hr />
            <br />

            <div class=" form-group">
                <asp:Image runat="server" CssClass="img img-responsive" ImageUrl="~/_images/PhotoGuidance.JPG" />
               <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" Width="100%" />
        </div>
            <!--        <p><b>Click 'preview' to view a preview of your photo - if you are happy then click 'Upload' below the photo, otherwise you can cancel and upload another</b></p>-->
        <p><i>Please ensure your photo is oriented the correct way round</i></p>
    <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server"
                        ControlToValidate="FileUpload1"
                        ErrorMessage="Only .jpg,.png,.jpeg,.gif Files are allowed" Font-Bold="True"
                        Font-Size="Medium"
                        ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>
    </div>

            </div>
  </div>
    </div>--%>

   <asp:Panel ID="Panel1" runat="server" Visible="true">

        <%--<asp:Image ID="Image1" runat="server" />--%>
        <br />

        <asp:Button ID="btnSave" runat="server" Text="Upload" OnClick="Save" CssClass="button" CausesValidation="false" Visible="false" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="Cancel" CssClass="button" CausesValidation="false" Visible="false"/>


    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false" CssClass="alert alert-success">

        <p><i>Thank you - File Uploaded</i></p>
    </asp:Panel>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" />

<div class="alert alert-light" role="alert">
    <div class="row gap-3">
        <div class="col-md">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                <cc1:CCCButton ID="btnBack" LinkResource="checkout_attachments_HE_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
            </span>
        </div>
        <div class="col-md text-end">
            <span class="d-grid gap-2 d-md-block">
                <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                <cc1:CCCButton ID="btnContinue" LinkResource="checkout_dataprotection_HE_aspx" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
            </span>
        </div>
    </div>
</div>

<%--<cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_attachments_HE_aspx" />
<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" LinkResource="checkout_dataprotection_HE_aspx" />--%>

