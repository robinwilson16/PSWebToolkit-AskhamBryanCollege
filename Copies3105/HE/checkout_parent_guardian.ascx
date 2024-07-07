<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_parent_guardian.ascx.vb" Inherits="webcontrols_checkout_parent_guardian" %>

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
    -->
<!--
      <ol class="breadcrumb">
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments.ascx">Personal Details</a></li>
                    <li>Guardian - Emergency</li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="lnkQuals" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare"><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                </ol>
    -->
<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width:25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li><Strong>Guardian / Emergency</Strong></li>                   
                    <li>Further Details</li>
                    <li>Qualifications</li>
                    <li>Employment</li>
                    <li>Attachments</li>
                    <li>Photo</li>
                    <li>Declarations</li>
                    </ol>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

<div class="form-field-section grey">
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
           <h2>Emergency Contact Details</h2>
                <p>Please provide details of a <strong>next of kin.</strong> The person must know they are your emergency contact.</p>
            </div>
  </div>

  <div class="row">
      <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentFirstName" ID="fldParentFirstName" runat="server" IsRequired="true" CustomCaption="First name"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentSurname" ID="fldParentSurname" runat="server" IsRequired="true"  CustomCaption="Surname"/>
          </div>
   </div>

          <div class="row">
        <div class="col-sm-12 columns form-group"> 
                       <p><strong>You must provide at least one Parent/Guardian phone number below:</strong></p>
            </div>
       </div>
    <div class="row">
       <div class="col-sm-6 columns form-group">
                   <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentPhoneNumber" ID="StudentEnrolmentField10" runat="server" LabelWidth="350" CustomCaption="* Contact phone (inc. STD code)" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
      
    </div>
    <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentMobileTel" ID="StudentEmailField1" runat="server" IsRequired="false" CustomCaption="* Mobile Number" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$" />
    
        </div>
     </div>
     <div class="row">
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentEmailAddress" ID="StudentEnrolmentField11" runat="server"  LabelWidth="200" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"/>
        </div>
         <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentRelationshipID" ID="StudentEnrolmentField19" runat="server" IsRequired="true"  CustomCaption="Relationship" />
            </div>
     </div>
   
<%--     <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find an address by entering postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>
      <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
    <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress1" ID="txtAddress1" runat="server" IsRequired="false" CustomCaption="Address Line 1" />
    </div>
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress2" ID="txtAddress2" runat="server" IsRequired="false"  CustomCaption="Address Line 2"  />
    </div>
</div>
  <div class="row">
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress3" ID="txtAddress3" runat="server" IsRequired="false"  CustomCaption="Address Line 3"  />
    </div>
        <div class="col-sm-6 columns form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentAddress4" ID="txtAddress4" runat="server" IsRequired="false"  CustomCaption="Address Line 4"  />
    </div>
      </div>
    <div class="row">
         <div class="col-sm-3 columns form-group"> 
             <label for="postcode" style="font-weight:bold ">Postcode</label><input title="Postcode" runat="server" maxlength="9" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Enter postcode here" autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$"  />
             </div>
        </div>
    </div>

 </div>

        <cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" LinkResource="checkout_enrolments_HE_aspx"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  LinkResource="checkout_enrolments2_HE_aspx" CausesValidation="true" EnableEnterKey="true" />
    <br />
              

