<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directenrol_prev.ascx.vb" Inherits="checkout_directenrol" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>



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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="false">
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
    <h2 class="app-title">Personal Details</h2>
    <hr />



    <br />



    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="300"  />
    </div>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="First Name" />
    </div>
    <p><i>This should be your legal name. This will then be used for all our communications, official documents (e.g. certificates), and correspondence.</i></p>

    <%--  <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Middle Name(s)" />
    </div>--%>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="StudentEnrolmentField10" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname" />
    </div>

     <p class="textfieldlabelrequired">Date of Birth</p>

    <asp:TextBox ID="DoB" runat="server" AutoPostBack="true" type="date" CssClass="form-control" ></asp:TextBox>
 <br />
 
    <%--    <p>Have you ever been known under a different surname? </p>
    <asp:RadioButtonList ID="rdoSurname" runat="server" CssClass="form-input" ClientIDMode="Static">

        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
        <asp:ListItem Value="2" Text="No"></asp:ListItem>

    </asp:RadioButtonList>

    <div class="surnamefields">

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SurnameAtBirth" ID="StudentEnrolmentField38" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Previous Surname" />
        </div>

    </div>--%>





    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="KnownAs" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Known as  (First Name)" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined2" ID="StudentEnrolmentField31" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Known As (Surname)" />
    </div>


    <%--<div class="form-input">
        <p class="textfieldlabelrequired">Date of Birth</p>
        <asp:TextBox ID="DoB" runat="server" type="date" />
    </div>--%>
    <div class="form-input">
        <cc1:StudentEnrolmentField ID="StudentEnrolmentField2" runat="server" IsRequired="true" StudentEnrolmentFieldType="sex" LabelWidth="300" ClientIDMode="Static" CustomCaption="Legal Sex" />

    </div>

    <p><i>Please enter as stated on passport </i></p>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField4" runat="server" CustomCaption="Contact Number (Home Telephone)" IsRequired="false" LabelWidth="300" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField5" runat="server" CustomCaption="Mobile" IsRequired="false" LabelWidth="300" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)" />
    </div>

    <div class="form-input">
        <cc1:StudentEmailField StudentEnrolmentFieldType="EmailAddress" ID="StudentEnrolmentField7" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Email Address" />
    </div>
    <p><i>Please supply your personal email address.  This is the address we will send any digital certificates to</i></p>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NI" ID="NINum" runat="server" IsRequired="false" LabelWidth="400"
            CustomCaption="National Insurance No." Pattern="^(?!BG|GB|NK|KN|TN|NT|ZZ)[ABCEGHJ-PRSTW-Z][ABCEGHJ-NPRSTW-Z]\d{6}[A-D]$" Title="Please match requested format (AB123456C) all caps" />

    </div>



    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="fldNationalityID" runat="server" LabelWidth="300" IsRequired="true"
            CustomCaption="Nationality" />
    </div>


    <div class="form-input">
        <span class="textfieldlabelrequired">Will you have lived continuously in the UK for more than 3 years on the first day of your course?</span>
        <asp:RadioButtonList runat="server" ID="RadioButtonListEU" CssClass="form-input" ToolTip="Have you been a full, legal resident in England or the European Union / Economic Area (excluding Wales, Scotland and Northern Ireland) throughout the past three years for any purpose other than study">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>
            <%--<asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>--%>
        </asp:RadioButtonList>

    </div>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsHomeFees" ID="HomeFees" runat="server" LabelWidth="400" />

    </div>

    <div class="UKResident">

        <p class="alert alert-info">Because you have not lived in the UK for last 3 years or more, we need to collect more information to determine your eligilbity for funding, please answer the questions below </p>

        <p class="textfieldlabelrequired">Date of entry into UK</p>
        <input type="date" id="DOEUK" runat="server" />



        <p class="textfieldlabelrequired">Visa Type</p>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="VisaTypeID" ID="VisaID" runat="server" IsRequired="false" LabelWidth="0"
                CustomCaption="Visa Type" />

        </div>

        <p class="textfieldlabelrequired">Settlement Status</p>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined9" ID="STUDF9" runat="server" IsRequired="false" LabelWidth="0" CustomFieldType="Lookup"
                CustomCaption="" />

        </div>


    </div>
    <br />
    <br />


    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="StudentEnrolmentField12" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="Ethnic Group" />
    </div>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="StudentEnrolmentField9" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="What is your country of residence?" />
    </div>


    <p class="alert alert-info">For the questions below - if you prefer not to say, please select 'Prefer not to say'</p>
    <div class="form-input">
        <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField22" CustomCaption="Your Religion" StudentEnrolmentFieldType="StudentDetailUserDefined12" CustomFieldType="Lookup" LabelWidth="300" IsRequired="true" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField23" CustomCaption="Sexual Orientation" StudentEnrolmentFieldType="StudentDetailUserDefined13" CustomFieldType="Lookup" LabelWidth="300" IsRequired="true" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField24" CustomCaption="Gender Identity" StudentEnrolmentFieldType="StudentDetailUserDefined14" CustomFieldType="Lookup" LabelWidth="300" IsRequired="true" />
    </div>



    <div class="form-input">
        <span class="textfieldlabelrequired">Do you have any convictions, cautions, reprimands, final warnings or pending court cases which are not protected as defined by the Rehabilitation of Offenders Act 1974 (Exceptions) Order 1975 (as amended in 2013)?  </span>
        <asp:RadioButtonList runat="server" ID="RadioButtonList1" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
            <asp:ListItem Text="No" Value="3"></asp:ListItem>
            <%--<asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>--%>
        </asp:RadioButtonList>
    </div>








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






    <h2 class="app-title">Address</h2>
    <hr />





    <h4>Please enter your postcode or partial address below:</h4>
    <p>
        Search:
        <asp:TextBox ID="txtLookup" runat="server" CssClass="formtext"></asp:TextBox>
        <asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" CssClass="button" />
    </p>

    <br>
    <asp:ValidationSummary ID="ValidationSummary3" runat="server" CssClass="alert-danger" />

    <div id="Div1" runat="server">
        <div class="panel-heading">Search Results - Double click the correct address</div>
        <div class=" form-group">
            <asp:ListBox ID="lstresult" runat="server" Width="100%" AutoPostBack="True"></asp:ListBox>
            <br />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress1" runat="server" CustomCaption="Property/Street"
                IsRequired="true" StudentEnrolmentFieldType="Address1" LabelWidth="200" />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress2" runat="server" CustomCaption="Address Line 2"
                IsRequired="true" StudentEnrolmentFieldType="Address2" LabelWidth="300" />
        </div>
        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress3" runat="server" CustomCaption="Town / City"
                IsRequired="true" StudentEnrolmentFieldType="Address3" LabelWidth="200" />
        </div>
        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="txtAddress4" runat="server" CustomCaption="County"
                IsRequired="true" StudentEnrolmentFieldType="Address4" LabelWidth="200" />
        </div>


        <div class=" form-group">

            <p class="textfieldlabelrequired">Postcode</p>
            <input type="text" runat="server" id="postcode" title="Postcode" placeholder="Enter Postcode" />

        </div>
    </div>



























    <%--   <div class="form-input">
        <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField13" StudentEnrolmentFieldType="NumberOfYearsAtCurrentAddress" CustomCaption="Years at this address" HTML5InputType="number" IsRequired="true" />
    </div> --%>




    <%--    <p class="textfieldlabelrequired">Have you lived at this address for more than 3 years? </p>
    <asp:RadioButtonList ID="RadioButtonListprevaddress" runat="server" CssClass="form-input" ClientIDMode="Static">

        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
        <asp:ListItem Value="2" Text="No"></asp:ListItem>

    </asp:RadioButtonList>


    <script>




        $(document).ready(function () {

            $('.prevaddress').hide();

            // Hide or Show
            var rdo = document.getElementsByName("<%= RadioButtonListprevaddress.UniqueID%>")
                    if (rdo[0].checked) {
                        $(".prevaddress").hide();
                    }
                    else {
                        $(".prevaddress").show();
                    }

                    // Set  visibility when 'Yes' radio button is clicked
                    var RadioButtonListEU = document.getElementById("<%= RadioButtonListprevaddress.ClientID%>")
                    RadioButtonListEU.onchange = function () {
                        var rdo = document.getElementsByName("<%= RadioButtonListprevaddress.UniqueID%>")
                        if (rdo[0].checked) {
                            $(".prevaddress").slideUp();
                        }
                        else {
                            $(".prevaddress").slideDown();
                        }



                    };
                });
    </script>

    <div class="prevaddress">
        <br />

        <p class="textfieldlabelrequired">Address Line 1</p>
        <input type="text" class="form-input" id="prevadline1" runat="server" />
        <p class="textfieldlabelrequired">Address Line 2</p>
        <input type="text" class="form-input" id="prevadline2" runat="server" />
        <p class="textfieldlabelrequired">Address Line 3</p>
        <input type="text" class="form-input" id="prevadline3" runat="server" />
        <p class="textfieldlabelrequired">Address Line 4</p>
        <input type="text" class="form-input" id="prevadline4" runat="server" />

        <div class="form-input">
            <label for="postcode" class="textfieldlabelrequired">Postcode</label>
            <input runat="server" type="text" id="prevedpostcode" class="form-control" name="pre[postalcode]" placeholder=" " autocomplete="on" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField13" StudentEnrolmentFieldType="NumberOfYearsAtCurrentAddress" CustomCaption="Years at this address" HTML5InputType="number" IsRequired="false" />
        </div>

    </div>--%>

    <%--         <div class="form-input">
        <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField8" StudentEnrolmentFieldType="StudentDetailUserDefined32" CustomCaption="Are you a resident of the Liverpool City Region?" IsRequired="true" CustomFieldType="tickbox" />
    </div> --%>
    <br />
    <hr />

    <%--<div class="form-input">
        <span class="textfieldlabelrequired">Is your term time address different to your home address?</span>
        <asp:RadioButtonList runat="server" ID="RadioButtonListAlt" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
          
        </asp:RadioButtonList>
     
    </div>

    <div class="altaddress">
        <h4>Term Time Address</h4>





        <p>If you are living away from home during your studies, please provide the details of your Term Time address below</p>


        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField19" runat="server" CustomCaption="House number / Street name"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress1" LabelWidth="300" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField6" runat="server" CustomCaption="Address Line 1"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress2" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField14" runat="server" CustomCaption="Address Line 2"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress3" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField ID="StudentEnrolmentField21" runat="server" CustomCaption="Address Line 3"
                IsRequired="false" StudentEnrolmentFieldType="AltAddress4" LabelWidth="300" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField ID="AccomType" runat="server" CustomCaption="Type of Accomomodation" Visible="false"
                IsRequired="false" StudentEnrolmentFieldType="AccommodationTypeID" LabelWidth="300" />
        </div>

        <div class="form-input">
            <label for="postcode1" style="width: 200px">Postcode</label><input type="text" runat="server" id="Postcode1" title="Postcode" placeholder="Enter Postcode" class="textfieldlabelrequired" />
        </div>

    </div>
    <br />
    <hr />--%>

    <%-- <h2 class="app-title">Personal Details (3 of 3)</h2>
    <hr />
    <br />



    

   

    <p><i>Please enter as it appears on your passport</i></p>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="StudentEnrolmentField9" runat="server" LabelWidth="300" IsRequired="true" CustomCaption="What is your country of residence?" />
    </div>
 
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentFirstLanguageID" ID="fldLanguage" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="What is your first language?" Enabled="True" CustomFieldType="Lookup" />
    </div>

    <p>If you are a non British citizen or not a British resident for the last 3 years then the college will be in touch regarding your eligibility and further documentation which you may need to provide</p>


    <br />
    <br />


    <p class="textfieldlabelrequired">   Are you an Asylum Seeker or Refugee? </p>

     <asp:RadioButtonList runat="server" ID="rdoAsylum" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>
  
        </asp:RadioButtonList>

    <br />
    <br />

    



    --%>


    <hr />

    <br />

    <h2 class="app-title">Parent/Carer & Emergency Contacts </h2>


    <p>Please provide details of at least one emergency contact. If you are under 18 please could you please provide the details of a parent/carer, We will use the information to contact a parent/carer about your progress, attendance, and to invite them to parents evenings. </p>


    <%--<p>If you don't provide a contact it means we won’t be able to contact anyone if you are taken ill</p>--%>
    <hr />

    <h3>Emergency Contact Details</h3>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1" ID="StudentEnrolmentField15" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Name (Full Name)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1RelationshipID" ID="StudentEnrolmentField16" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Relationship" />
    </div>

    <%--     <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentFirstName" ID="StudentEnrolmentField2" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact First Name*" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentSurname" ID="StudentEnrolmentField6" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Surname*" />
    </div>--%>

    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Tel" ID="contacttel" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Phone number" Pattern="^(0[\d]{8,12}|447[\d]{7,11})$" Title="Please enter a valid Telephone Number (0XXXXXXXXXX)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1EmailAddress" ID="StudentEnrolmentField18" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Emergency Contact Email Address" />
    </div>

    <div class="form-input">
        <span class="textfieldlabelrequired">Are you living with this person?</span>
        <asp:RadioButtonList runat="server" ID="LivesWithContact1">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="0"></asp:ListItem>

        </asp:RadioButtonList>

    </div>


    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsLivingWithcontact1" ID="LivingWithContact1" runat="server" LabelWidth="400" />
    </div>





    <div class="parentaddress">



        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 1</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address1" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 1" />
        </div>
        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 2</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address2" ID="StudentEnrolmentField33" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 2" />
        </div>
        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 3</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address3" ID="StudentEnrolmentField17" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 3" />
        </div>
        <div class=" form-group">
            <p class="textfieldlabelrequired">Contact Address Line 4</p>
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact1Address4" ID="StudentEnrolmentField20" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 4" />
        </div>
        <div class="form-input">
            <p class="textfieldlabelrequired">Postcode</p>
            <input type="text" runat="server" id="Contact1Postcode" title="Postcode" placeholder="Enter Postcode" class="textfieldlabelrequired" />
        </div>

    </div>





    <div class="contact2">
        <h3>Secondary Emergency contact details</h3>

        <div class=" form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2" ID="StudentEnrolmentField39" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Parent/Carer Name (Full Name)" />
        </div>
        <div class=" form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2RelationshipID" ID="StudentEnrolmentField40" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Parent/Carer Relationship" />
        </div>
        <%--     <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentFirstName" ID="StudentEnrolmentField2" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact First Name*" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ParentSurname" ID="StudentEnrolmentField6" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Emergency Contact Surname*" />
    </div>--%>

        <div class=" form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Tel" ID="StudentEnrolmentField41" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Parent/CarerPhone number" />
        </div>
        <div class=" form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2EmailAddress" ID="StudentEnrolmentField42" runat="server" IsRequired="false" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Parent/Carer Email Address" />
        </div>
        <%--    <div class="form-group">
                        <p>Do you live with this person?</p>

                        <input type="checkbox" id="liveswithcontact2" runat="server" style="padding: 20px 20px;" />
                    </div>--%>

        <div class="form-input">
            <span class="textfieldlabel">Are you living with this person?</span>
            <asp:RadioButtonList runat="server" ID="LivesWithContact2">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>

            </asp:RadioButtonList>
        </div>
        <div class="displaynone">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsLivingWithcontact2" ID="LivingWithcontact2" runat="server" LabelWidth="400" />
        </div>


        <div class="parentaddress2">
            <h3>Emergency Contact Address</h3>

            <div class=" form-group">
                <p class="textfieldlabel">Contact Address Line 1</p>
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Address1" ID="StudentEnrolmentField25" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 1" />
            </div>
            <div class=" form-group">
                <p class="textfieldlabel">Contact Address Line 2</p>
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Address2" ID="StudentEnrolmentField26" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 2" />
            </div>
            <div class=" form-group">
                <p class="textfieldlabel">Contact Address Line 3</p>
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Address3" ID="StudentEnrolmentField27" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 3" />
            </div>
            <div class=" form-group">
                <p class="textfieldlabel">Contact Address Line 4</p>
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Contact2Address4" ID="StudentEnrolmentField29" runat="server" IsRequired="false" LabelWidth="0" CustomCaption="Address Line 4" />
            </div>
            <div class="form-input">
                <p class="textfieldlabel">Postcode</p>
                <input type="text" runat="server" id="contact2postcode" title="Postcode" placeholder="Enter Postcode" class="textfieldlabelrequired" />
            </div>

        </div>
    </div>

    <br />
    <br />
    <h2 class="app-title">Education</h2>

    <cc1:StudentEnrolmentField ID="StudentEnrolmentField37" runat="server" CustomCaption="What is your highest level of Qualification?"
        IsRequired="True" LabelWidth="300" StudentEnrolmentFieldType="PriorAttainmentLevelID"></cc1:StudentEnrolmentField>



    <p>
        Use the following table to help you pick the correct qualification level...
    </p>
    <table class="table table-striped table-bordered">
        <tr class="active">
            <th>Level</th>
            <th>Academic Qualification Equivalent</th>
            <tr>
                <td>Entry Level</td>
                <td>first certificate
GCSE - grades 3, 2, 1 or grades D, E, F, G
level 1 award
level 1 certificate
level 1 diploma
level 1 ESOL
level 1 essential skills
level 1 functional skills
level 1 national vocational qualification (NVQ)
music grades 1, 2 and 3</td>
            </tr>
        <tr>
            <td>Level 1</td>
            <td>For example, GCSE grades 1-3/F-D, First certificate, Level 1 Award/Certificate/Diploma, Functional Skill Level 1
            </td>

        </tr>
        <tr>
            <td>Full Level 2</td>
            <td>GCSE/O Level (5 or more GCSEs grades A*-C),
GCSE (9-1) (5 or more GCSEs grade 4 or above),
2 or 3 AS Levels (for AS qualifications regulated before 1 September 2015),
CSE Grade 1 (5 or more),
1 A Level,
Higher 14-19 Diploma,
QCF Diploma level 2,
QCF Certificate level 2 at 13 or 14 credits undertaken before 2014 to 2015,
Level 2 Principal Learning,
NVQ level 2,
GNVQ Intermediate,
            </td>

        </tr>
        <tr>
            <td>Full Level 3</td>
            <td>A Levels (2 or more advanced level passes),
4 or more AS Levels (for AS qualifications regulated before 1 September 2015),
QCF Diploma Level 3,
QAA Access to HE,
Advanced 14-19 Diploma,
GNVQ Advanced,
NVQ level 3,
AVCE double award,
Tech Levels which are in the 16-19 Performance Tables,
Applied Generals which are in the 16-19 Performance Tables (from 1 August
2015),
QCF Certificate at Level 3 which is 30 to 36 credits</td>

        </tr>
        <tr>
            <td>Level 4</td>
            <td>For example, Certificate of Higher Education, Higher Apprenticeship, HNC</td>

        </tr>
        <tr>
            <td>Level 5</td>
            <td>For example, Diploma of Higher Education, Foundation Degree, HND
            </td>

        </tr>
        <tr>

            <td>Level 6
            </td>
            <td>For example, Degree Apprenticeship, Honours Degree
            </td>


        </tr>
        <tr>
            <td>Level 7
            </td>
            <td>For example, Masters level degree, PgDip

            </td>

        </tr>
        <tr>
            <td>Level 8
            </td>
            <td>For example, Doctorate/PhD

            </td>


        </tr>
    </table>





    <br />

    <%--    <label class="input-checkbox">
        <input type="checkbox" id="StudyElsewhere" runat="server" />
        <input type="checkbox" id="StudyElsewhere" runat="server" />
        <span></span>
        Will you be studying  elsewhere in the same academic year?

    </label>--%>




    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SchoolID" ID="fldSchoolID" runat="server" Placeholder="--Please Select--" IsRequired="false" LabelWidth="400" CustomCaption="Previous/Current School" />
    </div>

    <div class="form-input">
        <p class="textfieldlabel">Date From</p>
        <asp:TextBox ID="Dfrom" runat="server" type="date" max="2079-12-31" />
    </div>


    <br />
    <br />

    <p><b>We need your expected or achieved qualifications to make sure you are applying for the right course. Please include information on all qualifications studied i.e. GCSE, BTEC diplomas, A-levels, NVQs. If you haven’t yet taken your exams, please provide your predicted grades.</b></p>


    <p class="textfieldlabelrequired">Entering Maths & English Qualifications is mandatory </p>
    <br />


    <p>If you have no qualifications, then please press ‘No prior qualifications’. Use ‘Add row’ to save and add multiple qualifications. </p>

    <p>To remove items, please press ‘No prior qualifications’ then press ‘Add Qualifications’ </p>
    <br />

    <asp:Button runat="server" ID="btnNoPriorQualifications" CssClass="button button-orange" Text="No prior qualifications" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
    <br />
    <br />
    <div id="slidingdiv" class="slidingDiv" runat="server">

        <asp:Table class="table table-striped text-center" ID="tblQuals" runat="server">
        </asp:Table>
        <br />
        <asp:Button runat="server" ID="btnAdd" CssClass="button button-orange" Text="Add row" CausesValidation="false"></asp:Button>

    </div>
    <br />

    <hr />
    <br />


    <div id="refs" runat="server" visible="False">

        <h2 class="app-title">References</h2>

        <p>
            Please enter the details of your referees, who we may contact in the event that you are enrolled at the college.
        </p>



        <asp:Button runat="server" ID="btnNoReferences" CssClass="show_hide btn btn-primary" Text="No references" ToolTip="Click to remove all the items listed below (And hide the list)"></asp:Button>
        <br />
        <br />
        <div id="Div2" class="slidingDiv" runat="server">
            <div class="table-responsive">
                <table class="table text-center" id="tblReferences" runat="server">
                </table>
            </div>
            <asp:Button runat="server" ID="Button2" CssClass="btn btn-success" Text="Add Row" CausesValidation="false"></asp:Button>

        </div>

    </div>


</div>





<div class="form-field-section grey">


    <h2 class="app-title">Learner Support</h2>
    <hr />



    <p>We collect information relating to special educational needs, disabilities and additional support so our learning support team can work with you to ensure that you receive the appropriate help and advice to achieve your full potential</p>

    <p class="textfieldlabelrequired">Describe best your household situation</p>

    <asp:RadioButtonList ID="hhs" runat="server">
        <asp:ListItem Value="1" Text="No household member is in employment and the household includes one or more dependent children"></asp:ListItem>
        <asp:ListItem Value="2" Text="No household member is in employment and the household does not include any dependent children"></asp:ListItem>
        <asp:ListItem Value="3" Text="I live in a single adult household with dependent children"></asp:ListItem>
        <asp:ListItem Value="13" Text="I live in a single adult household with dependent children, and also no member of the household is in employment"></asp:ListItem>
        <asp:ListItem Value="98" Text="I do not wish to say"></asp:ListItem>
        <asp:ListItem Value="99" Text="None of these apply to me"></asp:ListItem>
    </asp:RadioButtonList>

    <br />
    <br />




    <div class="form-input">
        <span class="textfieldlabelrequired">Do you have any disabilities or learning difficulties?</span>
        <asp:RadioButtonList runat="server" ID="rdoLearnDiff" CssClass="form-input">
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>

        </asp:RadioButtonList>

    </div>

    <div class="disFields">
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="fldDisabilityCategory1ID" CustomCaption="Primary Disability/Learning Difficulty" StudentEnrolmentFieldType="DisabilityCategory1ID" LabelWidth="300" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="fldDisabilityCategory2ID" CustomCaption="Secondary Disability/Learning Difficulty" StudentEnrolmentFieldType="DisabilityCategory2ID" LabelWidth="300" />
        </div>









        <h4>Please provide any extra information that can help us to help you</h4>

        <div class="form-group">
            <cc1:StudentEnrolmentField runat="server" StudentEnrolmentFieldType="DisabilityNotes" CustomCaption="Notes" CustomFieldType="other" ClientIDMode="Static" />
            <p style="text-align: right; font-size: 8pt;" id="charsLeft2">8000 characters left</p>
        </div>


    </div>
    <br />
    <br />

    <p class="textfieldlabelrequired">Did you receive additional support at school?</p>
    <asp:RadioButtonList ID="AdditionalSupport" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasSpecialEducationNeeds" ID="StudentEnrolmentField6" runat="server" LabelWidth="400" />


    </div>



    <br />
    <br />


    <p class="textfieldlabelrequired">Did you receive additional support for exams at school?</p>
    <asp:RadioButtonList ID="ExamDis" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="ALSRequested" ID="StudentEnrolmentField13" runat="server" LabelWidth="400" />


    </div>



    <br />
    <br />


    <p class="textfieldlabelrequired">Do you have an educational health care plan</p>
    <asp:RadioButtonList ID="HasEHCP" runat="server">

        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:RadioButtonList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" ID="StudentEnrolmentField14" runat="server" LabelWidth="400" />


    </div>


    <div class="DoesHaveEHCP">

        <p class="textfieldlabelrequired">Local Authority that issued EHCP </p>

        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField19" CustomCaption="" StudentEnrolmentFieldType="ApplicationUserDefined15" LabelWidth="0" CustomFieldType="Lookup" />
        </div>

    </div>













    <h2 class="app-title">Employment</h2>
    <hr />



    <asp:HiddenField runat="server" ID="HiddenFieldForEmploymentvalue" />

    <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert-danger" />

    <div class="form-input">
        <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmploymentStatusID" ID="Field_EmploymentStatusID" runat="server" IsRequired="True" LabelWidth="300"
            CustomCaption="Employment Status" ClientIDMode="Static"
            ExcludedIDValues="98" />
    </div>
    <div class="Employedfields" id="Employedfields" runat="server">





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

        <div class="form-input">
            <br />
            <span class="textfieldlabelrequired">Are you self employed?</span>
            <asp:RadioButtonList runat="server" ID="rdoSelfEmp">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
        </div>
        <div class="displaynone">
            <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="IsSelfEmployed" ID="chkIsSelfEmployed" runat="server" LabelWidth="400" />
        </div>

        <div class="form-input">
                <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="EmployerName" ID="StudentEmploymentHistoryField2" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Employer Name" ClientIDMode="Static" />
            </div>

            <%--<h4>Employer Address</h4>
            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress1" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Address Line 1 (Number and Street/Road)" />
            </div>
            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress2" ID="StudentEnrolmentField17" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Address Line 2 (Area)" />
            </div>
            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress3" ID="StudentEnrolmentField44" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Address Line 3 (Town/City)" />
            </div>
            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerAddress4" ID="StudentEnrolmentField45" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Address Line 4 (County/District)" />
            </div>--%>
          <%--  <div class="form-input">
                <label for="employerpostcode" style="width: 300px; font-weight: normal;">Employer Postcode</label><input type="text" class="form-control" runat="server" id="employerpostcode" title="Postcode" placeholder="Enter Postcode" />
            </div>--%>
            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerEmail" ID="StudentEnrolmentField46" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Employer Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
            </div>
            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerTel" ID="StudentEnrolmentField47" runat="server" IsRequired="false" LabelWidth="400"
                    CustomCaption="Employer  telephone number" />
            </div>


        <%--   <div class="form-input">
            <br />
            <span class="textfieldlabelrequired">Prior to enrolment I was in full time education.</span>
            <asp:RadioButtonList runat="server" ID="rdoStillAt">
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
            <br />
        </div>
        <div class="displaynone">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="IsFulltime" ID="chkStudyElsewhere" runat="server" LabelWidth="400" />
        </div>--%>
        <%--          <p><i>Please enter the name of your current employer</i></p>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerName" ID="StudentEnrolmentField30" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Name" ClientIDMode="Static" />
        </div>
        <hr />
       
        <div class="form-input">
            <label for="employerpostcode" style="width: 300px; font-weight: normal;">Employer Postcode</label><input type="text" class="form-control" runat="server" id="employerpostcode1" title="Postcode" placeholder="Enter Postcode" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerEmail" ID="StudentEnrolmentField35" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Email" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
        </div>
             <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerTel" ID="StudentEnrolmentField36" runat="server" IsRequired="false" LabelWidth="300"
                CustomCaption="Employer Contact Number" />
        </div>--%>

        </div>
   
    <div class="UnEmployedFieldsToHide" id="UnEmployedFieldsToHide" runat="server">
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
        <cc1:StudentEmploymentHistoryField StudentEmploymentHistoryFieldType="BenefitStatusIndicatorID"
            ID="Field_BenefitStatusIndicatorID" runat="server" IsRequired="false" LabelWidth="300"
            CustomCaption="Benefit Status" />
    </div>


    <div class="EmployerFieldsToHide" id="EmployerFieldsToHide" runat="server" hidden="hidden">

        <%-- <div class="form-field-section grey">
            <h4>Employer</h4>

            <div class="form-input">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EmployerName" ID="StudentEnrolmentField25" runat="server" IsRequired="false" LabelWidth="300"
                    CustomCaption="Employer Name" ClientIDMode="Static" />
            </div>



        </div>--%>
    </div>



    <hr />

    <div id="courseQs" runat="server" visible="false">


    <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="CQS1" CustomCaption="" StudentEnrolmentFieldType="ApplicationUserDefined17" LabelWidth="300" IsRequired="false" Visible="false" />
        </div>
        
    <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="CQS2" CustomCaption="" StudentEnrolmentFieldType="ApplicationUserDefined18" LabelWidth="300" IsRequired="false" Visible="False" />
        </div>
        
    <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="CQS3" CustomCaption="" StudentEnrolmentFieldType="ApplicationUserDefined19" LabelWidth="300" IsRequired="false" Visible="false" />
        </div>
        
    <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="CQS4" CustomCaption="" StudentEnrolmentFieldType="ApplicationUserDefined20" LabelWidth="300" IsRequired="false" Visible="false" />
        </div>


        <p>You may be required to upload specific evidence related to your course - you can do this in the upload section at the bottom of the form</p>

        
        <p>For this course, you will be required to upload: </p> <p id="SpecificUpload" runat="server" style="font-weight:bold"></p>

    </div>


    <div id="HEQs" runat="server" visible="false">


        <h2 class="app-title">Higher Education Questions</h2>



        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="HESSN" CustomCaption="Student Support Number" StudentEnrolmentFieldType="UCASPersonalID" LabelWidth="300" IsRequired="false" />
        </div>

         <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="HESOC" CustomCaption="Occupation" StudentEnrolmentFieldType="SOCOccupationID" LabelWidth="300" IsRequired="false" />
        </div>

          <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="HELast" CustomCaption="Last Institution" StudentEnrolmentFieldType="LastInstitutionID" LabelWidth="300" IsRequired="false" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="HESocio" CustomCaption="Socio Economic Class" StudentEnrolmentFieldType="SocioEconomicClassID" LabelWidth="300" IsRequired="false" />
        </div>
         <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="HEHQ" CustomCaption="Highest Qualification" StudentEnrolmentFieldType="HighestQualID" LabelWidth="300" IsRequired="false" />
        </div>
        <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="HEHQID" CustomCaption="Highest Qualification Type" StudentEnrolmentFieldType="HEQualsOnEntryID" LabelWidth="300" IsRequired="false" />
        </div>

         <p class="textfieldlabelrequired">Accomodation Type</p>
        <asp:DropDownList ID="HEAccomType" runat="server">
            <asp:ListItem Value="10" Text="Private sector halls"></asp:ListItem>
            <asp:ListItem Value="11" Text="Provider owned/maintained"></asp:ListItem>
            <asp:ListItem Value="2" Text="Parental/guardian home"></asp:ListItem>
            <asp:ListItem Value="6" Text="Not in attendance at the college"></asp:ListItem>
            <asp:ListItem Value="5" Text="Other"></asp:ListItem>
            <asp:ListItem Value="7 " Text="Own residence"></asp:ListItem>
            <asp:ListItem Value="8" Text="Other rented accommodation"></asp:ListItem>
            <asp:ListItem Value="9" Text="Not known"></asp:ListItem>
    
        </asp:DropDownList>

     <%--   <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField21" CustomCaption="Nationality" StudentEnrolmentFieldType="NationalityID" LabelWidth="300" IsRequired="false" />
        </div>--%>







    </div>









    <div id="feearea" runat="server">

        <h2 class="app-title">Fees & Evidence</h2>



        <h2>Fees</h2>
        <hr />

        <p>The Fees for this course are : </p>
        <asp:TextBox ID="feeamount" runat="server" ReadOnly="true"></asp:TextBox>

       
         <div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField21" CustomCaption="How do you intend to pay? " StudentEnrolmentFieldType="ApplicationUserDefined16" LabelWidth="300" IsRequired="True" CustomFieldType="Lookup" />
        </div>







        <br />
        <hr />

    </div>

    <div id="evidencerequired" runat="server">
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

          








    </div>


<h2 class="app-title">Contact Preferences</h2>


 <p>How would you like us to contact you? (please select at least one)</p>


<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField8" CustomCaption="Email" StudentEnrolmentFieldType="GDPRAllowContactByEmail" LabelWidth="300" IsRequired="False" />
        </div>


<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField28" CustomCaption="Phone" StudentEnrolmentFieldType="GDPRAllowContactByPhone" LabelWidth="300" IsRequired="False" />
        </div>


<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField32" CustomCaption="Post" StudentEnrolmentFieldType="GDPRAllowContactByPost" LabelWidth="300" IsRequired="False" />
        </div>


<p>From time to time - we would like to contact you about other learning opportunities and research - please select which you would like to hear about</p>


<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField34" CustomCaption="Learning Opportunities" StudentEnrolmentFieldType="RestrictedUseAllowLearningOpportunities" LabelWidth="300" IsRequired="False" />
        </div>

<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField35" CustomCaption="Research" StudentEnrolmentFieldType="RestrictedUseAllowResearch" LabelWidth="300" IsRequired="False" />
        </div>


<p>Occasionally, we may want to use your image for marketing purposes (such as if you win an award) - if you agree then please tick the box below</p>


<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField36" CustomCaption="Accept Consent" StudentEnrolmentFieldType="AcceptMarketingConsent" LabelWidth="300" IsRequired="False" />
        </div>
    

    
<p>We may need your permission to access your Personal Learning Record to see your prior qualifications - please tick below if you agree</p>


<div class="form-input">
            <cc1:StudentEnrolmentField runat="server" ID="StudentEnrolmentField38" CustomCaption="Accept Consent" StudentEnrolmentFieldType="AcceptShareInfoConsent" LabelWidth="300" IsRequired="False" />
        </div>



    <h2 class="app-title">Student Declaration</h2>   









    <h4>How We Use Your Personal Information
    </h4>

    <section>

        <p>
            The personal information you provide is passed to the chief executive of skills funding (the skills funding agency) and the department for business, innovation and skills(BIS). Where necessary it is also shared with the department for education, including education funding agency. The information is used for the exercise of functions of these government departments and to meet statutory responsibilities, including under the Apprenticeships, skills, children and learning act 2009, and to create and maintain a unique learner number (UNL) and a personal learning record (PLR).
        </p>
    </section>
    <section>


        <p>
            The information you provide may be shared with other organisations for education, training, employment and wellbeing related purposes, including for research. Further information about the use of and access to your personal data, and details of organisations with whom we regularly share data are available  <a href="https://askham-bryan.ac.uk/images/policies/Website_Privacy_Policy.pdf" target="_blank">here</a>
        </p>

    </section>

    <section>

        <p>
            If the course is government funded either through the EFA or the agency, it could also be eligible for match funding and can therefore be partially funded by the ESF. I consent to Askham Bryan College  and the partner (where applicable) processing and using the personal and sensitive data set out in this form (the data) and any other stats which Askham Bryan College  and the partner (where applicable) may obtain form me or other people about me for the purpose stated on this form or connected with my studies or any other legitimate reason
        </p>
    </section>

    <section>

        <p>
            Askham Bryan College will contact you (and named parents/guardians for students aged 16 to 18-years-old) via email and text in relation to the progress of your application, events you need to attend as part of the application and enrolment process and information about Askham Bryan College on the lawful basis of legitimate interest in accordance with the General Data Protection Regulation 2018. The information submitted is processed by Askham Bryan College on the lawful basis of legal obligation, public task and legitimate interest in accordance with the General Data Protection Regulation 2018. For information on how long we hold your personal data, your rights of access and deletion of personal data click here or a copy can be requested <a href="https://www.askham-bryan.ac.uk/about-us/policies.html" target="_blank">here </a>

        </p>
    </section>

    <section>

        <p>
            If you would like more information about how we process your personal data, or your data protection rights; to make a request about your information – for example to request a copy of your information or to ask for your information to be changed; or to contact our Data Protection Officer, you can contact us in the following ways if you would like to make a request: 
            <br />

            Using our secure online contact form, which can be found at: <a href="https://form.education.gov.uk/service/Contact_the_Department_for_Education">This website</a>
            <br />

            In writing to: Data Protection Officer, Ministerial and Public Communications Division, Department for Education, Piccadilly Gate, Store Street, Manchester, M1 2WD
        </p>

    </section>

    <section>
        <b><u>How We Use Your Personal Information and Why We Have It </u></b>

        <br />

        <p>For the purposes of relevant data protection legislation, the DfE is the data controller for personal data processed by the ESFA. Your personal information is used by the DfE to exercise its functions and to meet its statutory responsibilities, including under the Apprenticeships, Skills, Children and Learning Act 2009 and to create and maintain a unique learner number (ULN) and a personal learning record (PLR). Your information may be used for education, training, employment, and well-being related purposes, including for research. The DfE and the English European Social Fund (ESF) Managing Authority (or agents acting on their behalf) may contact you to carry out research and evaluation to inform the effectiveness of training. </p>

    </section>

    <section>

        <b><u>How long we will keep your personal data </u></b>
        <br />

        <p>
            Your information will be securely destroyed in accordance with the ESFA’s retention and disposal schedule after it is no longer required for these purposes. 

        </p>


    </section>

    <section>

        <b>How we share your personal data </b>
        <br />

        <p>
            Your information may also be shared with other third parties for the above purposes, but only where the law allows it, and the sharing is in compliance with data protection legislation. 
        </p>
    </section>

    <section>
        <b><u>Your data protection rights </u></b>

        <p>
            Under data protection law, you have rights including:
            <br />
            <br />

            •Your right of access - You have the right to ask us for copies of your personal information.
            <br />
            <br />
            •Your right to rectification - You have the right to ask us to rectify personal information you think is inaccurate. You also have the right to ask us to complete information you think is incomplete. 
            <br />
            <br />

            •Your right to erasure - You have the right to ask us to erase your personal information in certain circumstances. 
            <br />
            <br />

            •Your right to restriction of processing - You have the right to ask us to restrict the processing of your personal information in certain circumstances. 
            <br />
            <br />

            •Your right to object to processing - You have the right to object to the processing of your personal information in certain circumstances. 
            <br />
            <br />

            •Your right to data portability - You have the right to ask that we transfer the personal information you gave us to another organisation, or to you, in certain circumstances. 
            <br />
            <br />

            •You are not required to pay any charge for exercising your rights. If you make a request, we have one month to respond to you. 
            <br />
            <br />
        </p>

    </section>

    <br />






    <h4>Please confirm:</h4>

    <asp:CheckBox ID="chkConfirm" runat="server"
        Text="I confirm that the information I have provided is correct and I understand that if I have declared false information the provider may take action against me to reclaim the tuition fees and any support costs provided. I have received suitable advice and guidance on the course(s) that I wish to enrol on and I have read the Privacy Notices and Other Information Statements provided " Font-Bold="True" Font-Size="X-Large"
        CausesValidation="True" />
    <br />
    <hr />


    <p>Please sign and continue to finish enroling - you can use your mouse or a drawing pad, dont worry about recreating your current signature</p>

    <uc1:StudentSignature runat="server" ID="StudentSignature" />



    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" LinkResource="checkout_aspx" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />


</div>



</div>



<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />




<script type="text/javascript">
    $(document).ready(function () {



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


<script>

    $(document).ready(function () {
        //disability stuff
        $('.disFields').hide();

        // Hide or Show Learning Difficulty 
        var rdo = document.getElementsByName("<%= rdoLearnDiff.UniqueID%>")
        if (rdo[0].checked) {
            $(".disFields").show();
        }
        else {
            $(".disFields").hide();
        }

        // Set Learning Difficulty Fields visibility when Learning Difficulty 'Yes' radio button is clicked
        var rdoLearnDiff = document.getElementById("<%= rdoLearnDiff.ClientID%>")
        rdoLearnDiff.onchange = function () {
            var rdo = document.getElementsByName("<%= rdoLearnDiff.UniqueID%>")
            if (rdo[0].checked) {
                $(".disFields").slideDown();
            }
            else {
                $(".disFields").slideUp();
            }


            $("#txtDisabilityNotes").keyup(function () {
                var charsLeft = (8000 - $(this).val().length);
                $('#charsLeft2').text(charsLeft + ' characters left');

            });
        };
    });

</script>

<%--<script>

    $(document).ready(function () {

        $('.altaddress').hide();

        // Hide or Show Learning Difficulty 
        var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
        if (rdo[0].checked) {
            $(".altaddress").show();
        }
        else {
            $(".altaddress").hide();
        }

        // Set Learning Difficulty Fields visibility when Learning Difficulty 'Yes' radio button is clicked
        var rdo1 = document.getElementById("<%= RadioButtonListAlt.ClientID%>")
        rdo1.onchange = function () {
            var rdo = document.getElementsByName("<%= RadioButtonListAlt.UniqueID%>")
            if (rdo[0].checked) {
                $(".altaddress").slideDown();
            }
            else {
                $(".altaddress").slideUp();
            }


        };
    });

</script>--%>
<script>


    $(document).ready(function () {
        //crc stuff
        $('.crcFields').hide();

        // Hide or Show crc
        var rdo = document.getElementsByName("<%= RadioButtonList1.UniqueID%>")
        if (rdo[0].checked) {
            $(".crcFields").show();
        }
        else {
            $(".crcFields").hide();
        }

        // Set crc Fields visibility when Learning Difficulty 'Yes' radio button is clicked
        var RadioButtonList1 = document.getElementById("<%= RadioButtonList1.ClientID%>")
        RadioButtonList1.onchange = function () {
            var rdo = document.getElementsByName("<%= RadioButtonList1.UniqueID%>")
            if (rdo[0].checked) {
                $(".crcFields").slideDown();
            }
            else {
                $(".crcFields").slideUp();
            }




        };
    });
</script>


<script>

    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= rdoSelfEmp.UniqueID%>")
        if (rdo[0].checked) {
            $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', true);
        }
        else {
            $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var RadioButtonListEU = document.getElementById("<%= rdoSelfEmp.ClientID%>")
        RadioButtonListEU.onchange = function () {
            var rdo = document.getElementsByName("<%= rdoSelfEmp.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_chkIsSelfEmployed_chkIsSelfEmployed').prop('checked', false);
            }



        };
    });
</script>


<%--<script>

    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= rdoStillAt.UniqueID%>")
        if (rdo[0].checked) {
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField1_chkStudyElsewhere').prop('checked', true);
        }
        else {
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField1_chkStudyElsewhere').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var RadioButtonListEU = document.getElementById("<%= rdoStillAt.ClientID%>")
        RadioButtonListEU.onchange = function () {
            var rdo = document.getElementsByName("<%= rdoStillAt.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField1_chkStudyElsewhere').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField1_chkStudyElsewhere').prop('checked', false);
            }



        };
    });
</script>--%>
<%-- <script>

     $(document).ready(function () {
         //surname visibility
         $('.surnamefields').hide();

         // Hide or Show Surname
         var rdo = document.getElementsByName("<%= rdoSurname.UniqueID%>")
            if (rdo[0].checked) {
                $(".surnamefields").show();
            }
            else {
                $(".surnamefields").hide();
            }

            // Set Surname Fields visibility when  'Yes' radio button is clicked
            var rdoLearnDiff = document.getElementById("<%= rdoSurname.ClientID%>")
            rdoLearnDiff.onchange = function () {
                var rdo = document.getElementsByName("<%= rdoSurname.UniqueID%>")
                if (rdo[0].checked) {
                    $(".surnamefields").slideDown();
                }
                else {
                    $(".surnamefields").slideUp();
                }


            };
        });


 </script>--%>
<script>


    if ($sigdiv.jSignature('getData', 'native').length == 0) {
        alert('Please Enter Signature..');
    }
</script>


<script>

    $(document).ready(function () {

        $('.parentaddress').hide()

        var ele = document.getElementsByName("<%= LivesWithContact1.UniqueID%>")
        if (ele[0].checked) {
            $(".parentaddress").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $(".parentaddress").show()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= LivesWithContact1.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= LivesWithContact1.UniqueID%>")
            if (ele[0].checked) {
                $(".parentaddress").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {

                $(".parentaddress").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }



        };
    });
</script>



<script>

    $(document).ready(function () {

        $('.parentaddress2').hide()

        var ele = document.getElementsByName("<%= LivesWithContact2.UniqueID%>")
        if (ele[0].checked) {
            $(".parentaddress2").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithcontact2_chkIsLivingWithContact2').prop('checked', true);
        }
        else {
            $(".parentaddress2").show()
            $('#ctl00_MainContentPlaceholder_ctl00_LivingWithcontact2_chkIsLivingWithContact2').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= LivesWithContact2.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= LivesWithContact2.UniqueID%>")
            if (ele[0].checked) {
                $(".parentaddress2").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithcontact2_chkIsLivingWithContact2').prop('checked', true);
            }
            else {

                $(".parentaddress2").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_LivingWithcontact2_chkIsLivingWithContact2').prop('checked', false);
            }



        };
    });
</script>

<script>

    $(document).ready(function () {

        $('.UKResident').hide()

        var ele = document.getElementsByName("<%= RadioButtonListEU.UniqueID%>")
        if (ele[1].checked) {
            $(".UKResident").show()
            $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
        }
        else if (ele[0].checked) {
            $(".UKResident").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', true);
        }

        else {
            $(".UKResident").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
        }
        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= RadioButtonListEU.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= RadioButtonListEU.UniqueID%>")
            if (ele[1].checked) {
                $(".UKResident").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
            }
            else if (ele[0].checked) {
                $(".UKResident").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', true);
            }

            else {
                $(".UKResident").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_HomeFees_chkIsHomeFees').prop('checked', false);
            }


        };
    });
</script>

<script>





    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= AdditionalSupport.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', false);
            }

            // Set EU Fields visibility when 'Yes' radio button is clicked
            var RadioButtonListEU = document.getElementById("<%= AdditionalSupport.ClientID%>")
            RadioButtonListEU.onchange = function () {
                var rdo = document.getElementsByName("<%= AdditionalSupport.UniqueID%>")
                if (rdo[0].checked) {
                    $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', true);
                }
                else {
                    $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField6_chkHasSpecialEducationNeeds').prop('checked', false);
                }



            };
        });
</script>

<script>





    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= ExamDis.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField13_chkALSRequested').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField13_chkALSRequested').prop('checked', false);
            }

            // Set EU Fields visibility when 'Yes' radio button is clicked
            var RadioButtonListEU = document.getElementById("<%= ExamDis.ClientID%>")
            RadioButtonListEU.onchange = function () {
                var rdo = document.getElementsByName("<%= ExamDis.UniqueID%>")
                if (rdo[0].checked) {
                    $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField13_chkALSRequested').prop('checked', true);
                }
                else {
                    $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField13_chkALSRequested').prop('checked', false);
                }



            };
        });
</script>


<script>

    $(document).ready(function () {

        $('.DoesHaveEHCP').hide()

        var ele = document.getElementsByName("<%= HasEHCP.UniqueID%>")
        if (ele[0].checked) {
            $(".DoesHaveEHCP").show()
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', true);
        }
        else if (ele[1].checked) {
            $(".DoesHaveEHCP").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
        }

        else {
            $(".DoesHaveEHCP").hide()
            $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
        }
        // Set EU Fields visibility when 'Yes' radio button is clicked
        var rdoele = document.getElementById("<%= HasEHCP.ClientID%>")
        rdoele.onchange = function () {
            var ele = document.getElementsByName("<%= HasEHCP.UniqueID%>")
            if (ele[0].checked) {
                $(".DoesHaveEHCP").slideDown()
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', true);
            }
            else if (ele[1].checked) {
                $(".DoesHaveEHCP").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
            }

            else {
                $(".DoesHaveEHCP").slideUp()
                $('#ctl00_MainContentPlaceholder_ctl00_StudentEnrolmentField14_chkHasEducationHealthCarePlan').prop('checked', false);
            }


        };
    });
</script>
