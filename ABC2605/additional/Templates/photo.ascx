<%@ Control Language="VB" AutoEventWireup="false" CodeFile="photo.ascx.vb" Inherits="photo" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<%--<ol class="breadcrumb" runat="server">
<li class="active">Results Day</li>
</ol>--%>
<div class="intro-block"><h1>Upload a Photo</h1></div>
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<%--<div class="stepwizard">
    <div class="stepwizard-row">
         <div class="stepwizard-step">
            <asp:Button CssClass="btn btn-default btn-circle" runat="server" ID="btnStage1" Text="1" />
            <p>Results</p>
        </div>
        <div class="stepwizard-step">
            <asp:Button CssClass="btn btn-primary btn-circle" runat="server" ID="btnStage2" Text="2" />
            <p>Profile</p>
        </div>
        <div class="stepwizard-step">
            <asp:Button CssClass="btn btn-default btn-circle" runat="server" ID="btnStage3" Text="3" />
            <p>Terms</p>
        </div>

        </div>
    </div>
       --%>

  
        <div class="form-field-section grey">
           
    <h3>Upload Photo - A headshot photograph for your student record
    </h3>
    <p><i>We will need you to provide a photograph this is so we can ensure the safety and security of everyone at the College and we’ll keep this photo with your student record for 6 years after your course ends.</i></p>
    <hr />
    <br />

    <p>4MB Maximum file size, only jpg, png, jpeg and gif files are accepted</p>

    <div class="form-input">
        <asp:Image runat="server" CssClass="img img-responsive" />
        <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif" Width="100%" />
        <br />

        <p><b>Click 'preview' to view a preview of your photo - if you are happy then click 'Upload' below the photo, otherwise you can cancel and upload another</b></p>
        <p><i>Please ensure your photo is oriented the correct way round</i></p>
        <asp:Button ID="Button1" runat="server" Text="Preview" OnClick="Upload" CssClass="button" CausesValidation="false" />


    </div>
    <%--    <asp:RequiredFieldValidator ErrorMessage="Photo Required" ControlToValidate="FileUpload1"
    runat="server" Display="Dynamic" ForeColor="Red" />--%>
    <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server"
        ControlToValidate="FileUpload1"
        ErrorMessage="Only .jpg,.png,.jpeg,.gif Files are allowed" Font-Bold="True"
        Font-Size="Medium"
        ValidationExpression="(.*?)\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$"></asp:RegularExpressionValidator>

    <asp:Panel ID="Panel1" runat="server" Visible="false">

        <asp:Image ID="Image1" runat="server" />
        <br />
        <asp:Button ID="btnSave" runat="server" Text="Upload" OnClick="Save" CssClass="button" CausesValidation="false" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="Cancel" CssClass="button" CausesValidation="false" />


    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false" CssClass="alert alert-success">

        <p><i>Thank you - File Uploaded</i></p>
    </asp:Panel>


     

            </div>

        <div class="form-field-section grey"  id="divmain" runat="server">
          
                <h3>Current Details</h3>

                <p>The details MUST match to update your record - your Reference Number can be found in your email</p>
                     <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="StudentEnrolmentField22" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Student Reference Number" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField21" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="First Name" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="Surname" />
    </div>
                 <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DateOfBirth" ID="StudentEnrolmentField8" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="Date of birth" />
    </div>
  <%--  <div class=" form-group">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField23" runat="server" IsRequired="true" LabelWidth="400" CustomCaption="Personal Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
    </div>--%>

            </div>

         <%--   <div class="form-field-section grey">
    <h3>Update Details</h3>
    <p>Please take this opportunity to update your contact information <b>if it has changed</b></p>

 
                  <div class=" form-group">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="400" CustomCaption="Personal Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
    </div>
                                               <div class=" form-group">
        <cc1:StudentEnrolmentField id="StudentEnrolmentField10" runat="server" IsRequired="False" StudentEnrolmentFieldType="GDPRAllowContactByEmail"  LabelWidth="400" ClientIDMode="Static" CustomCaption="Can we contact you on this email?" />
    </div>
                   <div class=" form-group">
        <cc1:StudentEnrolmentField id="StudentEnrolmentField1" runat="server" IsRequired="False" StudentEnrolmentFieldType="MobileTel"  LabelWidth="400" ClientIDMode="Static" CustomCaption="Mobile Number" />
    </div>
                   <div class=" form-group">
        <cc1:StudentEnrolmentField id="StudentEnrolmentField7" runat="server" IsRequired="False" StudentEnrolmentFieldType="Tel1"  LabelWidth="400" ClientIDMode="Static" CustomCaption="Home Telephone Number" />
    </div>

                                  <div class=" form-group">
        <cc1:StudentEnrolmentField id="StudentEnrolmentField9" runat="server" IsRequired="False" StudentEnrolmentFieldType="GDPRAllowContactByPhone"  LabelWidth="400" ClientIDMode="Static" CustomCaption="Can we contact you on these numbers?" />
    </div>
   
      <div class=" form-group">
         <cc1:StudentEnrolmentField runat="server" ID="fldAddress1" StudentEnrolmentFieldType="Address1" CustomCaption="House number and street name" IsRequired="true" />
     </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress2" StudentEnrolmentFieldType="Address2" CustomCaption="Address Line 2" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress3" StudentEnrolmentFieldType="Address3" CustomCaption="Address Line 3" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress4" StudentEnrolmentFieldType="Address4" CustomCaption="Address Line 4" />
    </div>


<div class=" form-group">
        <label for="postcode" style="font-weight:normal ">Postcode</label>
        <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Your postcode here..." autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode" />
       
    </div>
                                                               <div class=" form-group">
        <cc1:StudentEnrolmentField id="StudentEnrolmentField11" runat="server" IsRequired="False" StudentEnrolmentFieldType="GDPRAllowContactByPost"  LabelWidth="400" ClientIDMode="Static" CustomCaption="Can we write to this address?" />
    </div>
</div>
            </div>
    </div>
     </div>--%>

 </div>
     

<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"/>
