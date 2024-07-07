<%@ Control Language="VB" AutoEventWireup="false"  CodeFile="checkout_enrolments.ascx.vb" Inherits="webcontrols_checkout_enrolments" %>

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
<!--
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li id="linkParent" runat="server" CausesValidation="true"><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian / Emergency</a></li>                   
                    <li id="linkFurther" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_enrolments2.ascx">Further Details</a></li>
                    <li id="linkQuals" runat="server" ><a id="aQuals" runat="server" href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
                     <li id="linkAttach" runat="server" ><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li id="linkDeclare" runat="server"><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                    </ol>
    -->
<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 12.5%;" aria-valuenow="12.5" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li><strong>Personal Details</strong></li>
                    <li>Guardian / Emergency</li>                   
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
        <h2>Personal Details</h2>
          <p>Please note all fields marked with  <span class="textfieldlabelrequired"></span> are required. <br /><br />
            Please give your full legal name. The Education & Skills Funding Agency requires the College to collect legal gender.</p>
          </div>
  </div>
      <div class="row">
      <div class="col-sm-12 columns form-group"> 
               <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="StudentEnrolmentField11" runat="server" IsRequired="true"  CustomCaption="Title" />

          </div>
  </div>
  <div class="row" id="divRefno" runat="server" visible="false">
      <div class="col-sm-12 columns form-group"> 
    <h4>If you have already applied to the College or studied at the College as a student, your ID is <strong><asp:Label ID="lblRefno" runat="server"></asp:Label></strong> </h4>
          </div>
  </div>
    <div class="row">
    <div class="col-sm-6 columns form-group">     
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="fldFirstName" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Forenames or given name" />
     </div>
        <div class="col-sm-6 columns form-group">       
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname or family name" />
     </div>
    </div>
  <div class="row">
      <div class="col-sm-6 columns form-group">            
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField7" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Preferred or familiar name (if different)" />
          </div>
      <div class="col-sm-6 columns form-group">  <cc1:StudentEnrolmentField StudentEnrolmentFieldType="knownas" ID="StudentEnrolmentField8" runat="server" IsRequired="false"  LabelWidth="300" CustomCaption="Previous surname or family name" />   
          </div>
   </div>
  <div class="row">
      <div class="col-sm-12 columns form-group"> 
          <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"  CustomCaption="Date of birth"/>
          </div>
      </div>
     <div class="row">
      <div class="col-sm-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Sex" ID="StudentEnrolmentField6" runat="server"  IsRequired="true" CustomCaption="Legal gender"/>
          </div>
      <div class="col-sm-6 columns form-group">            
                 <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PreferredPronounID" ID="StudentEnrolmentField12" runat="server"  IsRequired="true" CustomCaption="Preferred Pronoun"/>
          </div>
   </div>

    <h5>Criminal Convictions</h5>

        <p><strong>We must ask you to provide details of any <strong>unspent</strong> criminal convictions. You do not need to tell us about any spent convictions, as defined by the Rehabilitation of Offenders Act 1974, unless your course involves access to children and young adults under the age of 18. If you are enrolled to such a course, any failure to disclose such convictions may result in the College asking you to withdraw. Any information you give will be completely confidential and is only considered in relation to this enrolment.</strong></p>
        
<%--        <span class="textfieldlabelrequired">Do you have any unspent criminal convictions?</span>
        <asp:DropDownList runat="server" ID="rdoCC" CssClass="form-group">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
       
        </asp:DropDownList>--%>

      <div class="row">
            <div class="col-sm-12 columns form-group"> 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CriminalConvictionID" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="400"   CustomCaption="Do you have any unspent criminal convictions?" />
        </div>
      </div>

<%--      <div class="row">
            <div class="col-sm-12 columns form-group"> 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined60" ID="txtYesCriminalConviction" runat="server" IsRequired="false" CustomCaption="If yes, you are required to give full details. This will be referred to the College Admissions Panel." LabelWidth="650"/>
        </div>
      </div>--%>

<!--
<div class="container">
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          </div>
       <div class="col-sm-6 columns form-group"> 
          </div>
   </div>
</div>
    -->
  <div class="row">
      <div class="col-sm-12 columns form-group"> 
    <h5>Address and Contact Details</h5>
            </div>
   </div>


<%--    <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find your address, enter postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>

        <p><strong>Home/Permanent address</strong></p>

  <div id="divAddresslines" runat="server" visible="true">
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          <cc1:StudentEnrolmentField runat="server" ID="txtAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" CustomCaption="Address Line 1"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField runat="server" ID="txtAddress2" StudentEnrolmentFieldType="Address2" CustomCaption="Address Line 2"/>
          </div>
   </div>
  
  <div class="row">
      <div class="col-sm-6 columns form-group"> 
          <cc1:StudentEnrolmentField runat="server" ID="txtAddress3" StudentEnrolmentFieldType="Address3" IsRequired="false" CustomCaption="Address Line 3"/>
          </div>
       <div class="col-sm-6 columns form-group"> 
           <cc1:StudentEnrolmentField runat="server" ID="txtAddress4" StudentEnrolmentFieldType="Address4" CustomCaption="Address Line 4" />
          </div>
   </div>
    <div class="row">
         <div class="col-sm-12 columns form-group"> 
            <input type="text" runat="server" id="postcode" title="Postcode" placeholder="Enter postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
             </div>
           
    </div>
      </div>
     <div class="row">
       <div class="col-sm-12 columns form-group">  <p><strong>You must provide at least one phone number below:</strong></p>
           </div>
         </div>
    <div class="row">
      <div class="col-sm-6 columns form-group"> 
                <cc1:StudentEnrolmentField CustomCaption="* Home phone (inc. STD code)" LabelWidth="350" StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField5" runat="server" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
    
        
      </div>
       <div class="col-sm-6 columns form-group"> 
   <cc1:StudentEnrolmentField CustomCaption="* Personal Mobile" StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$"/>
       
           </div>
   </div>

      <div class="row">
        <div class="col-sm-12 columns form-group"> 
             <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true"  CustomCaption="Personal Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
            </div>
       </div>

      <div class="row">
            <div class="col-sm-12 columns form-group"> 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AccommodationTypeID" ID="StudentEnrolmentField13" runat="server" IsRequired="true" LabelWidth="400"   CustomCaption="Accommodation during term time" ExcludedIDValues="6,9,10"/>
        </div>
      </div>

        <div class="form-input">
        <span class="textfieldlabelrequired">Is your term time address different to your home address?</span>
        <asp:RadioButtonList runat="server" ID="RadioButtonListAlt" CssClass="form-input">
            <asp:ListItem Text="No, it is the same" Value="2"></asp:ListItem>
            <asp:ListItem Text="Yes, it is different" Value="1"></asp:ListItem>
  

        </asp:RadioButtonList>
  
    </div>

    <div class="altaddress">
        <h4>Term Time Address</h4>


        <p><strong>Term Time address (if different from Home/Permanent address)</strong></p>


        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField4" runat="server" CustomCaption="Address Line 1"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress1" LabelWidth="300" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField9" runat="server" CustomCaption="Address Line 2"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress2" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField14" runat="server" CustomCaption="Address Line 3"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress3" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField21" runat="server" CustomCaption="Address Line 4"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress4" LabelWidth="300" />
        </div>

        <div class="form-input">
            <p>Postcode</p><input type="text" runat="server" id="Postcode1" title="Postcode" placeholder="Enter postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AltTel1" ID="StudentEnrolmentField10" runat="server" CustomCaption="Term phone (inc. STD code)" IsRequired="false" LabelWidth="400" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" />
        </div>

    </div>

    <br />
    
 </div>



      <!--  <cc1:CCCButton id="btnBack2" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx"/> -->
        <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button"  LinkResource="courseenrol_aspx" />

 <cc1:CCCButton  runat="server" Text="Continue" CausesValidation="true" CssClass="button" ID="btnContinue" />
<br />
<asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />

<script>

    $(document).ready(function () {

        $('.altaddress').hide();

        // Hide or Show Alt Address 
        var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
        if (rdo[0].checked) {
            $(".altaddress").show();
        }
        else {
            $(".altaddress").hide();
        }

        // Set Alt Address Fields visibility when Alt Address 'Yes' radio button is clicked
        var rdo1 = document.getElementById("<%= RadioButtonListAlt.ClientID%>")
        rdo1.onchange = function () {
            var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
            if (rdo[0].checked) {
                $(".altaddress").slideUp();
            }
            else {
                $(".altaddress").slideDown();
            }


        };
    });

</script>

