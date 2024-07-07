<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enquiriesMAIN.ascx.vb" Inherits="webcontrols_checkout_enquiriesMAIN" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>


<%--<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none" Visible="true">


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
</div>--%>


<div class="form-field-section grey">
    <h2 class="app-title">Course Enquiries </h2>
    
 
<br />
    <br />

 
  
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="200" CustomCaption="First Name" />
    </div>

      <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="200"  AutoFocus="true"/>
    </div>
  
   <div class="form-group">
       <p class="textfieldlabelrequired">Date of Birth</p>
         <asp:TextBox ID="DoB" runat="server" Type="date"></asp:TextBox>

         </div>
    <p>To enable us to track your form (and not confuse you with someone else with the same name) please confirm your date of birth below: </p>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SubjectID" ID="fldSubjectID" runat="server" IsRequired="false" LabelWidth="400"
            CustomCaption="Which course/s are you interested in? (choose up to 5) " />
    </div>
     <br />
    
     <a href="#" class="show_hide btn btn-primary">Add more</a>
    <br />
    <br />
<div class="slidingDiv">
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Subject2ID" ID="fldSubject2ID" runat="server" IsRequired="false" LabelWidth="200"
            CustomCaption=" " />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Subject3ID" ID="fldSubject3ID" runat="server" IsRequired="false" LabelWidth="200"
            CustomCaption=" " />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Subject4ID" ID="fldSubject4ID" runat="server" IsRequired="false" LabelWidth="200"
            CustomCaption=" " />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Subject5ID" ID="fldSubject5ID" runat="server" IsRequired="false" LabelWidth="200"
            CustomCaption=" " />
    </div>

    </div>
   


    <p class ="textfieldlabelrequired">Will you be over 19 years old on the 31st August this year? </p>
    <asp:RadioButtonList ID="over19" runat="server">
        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
           <asp:ListItem Value="0" Text="No"></asp:ListItem>
    </asp:RadioButtonList>





    <div class="divover19">

        <p class ="textfieldlabelrequired">Are you currently working in the industry that the course relates to?</p>
    <asp:RadioButtonList ID="enqudf9" runat="server">
        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
           <asp:ListItem Value="0" Text="No"></asp:ListItem>
    </asp:RadioButtonList>

         <div class="industry">

             
        <p class ="textfieldlabelrequired">Is your employer aware/are you happy for them to be informed that you are applying for this course?</p>
    <asp:RadioButtonList ID="EmployerAware" runat="server">
        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
           <asp:ListItem Value="0" Text="No"></asp:ListItem>
    </asp:RadioButtonList>

             <div class="employernameaware">


                  <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined10" ID="StudentEnrolmentField4" runat="server" IsRequired="false" LabelWidth="200"
            CustomCaption="Employer Name" />
    </div>



             </div>



         </div>



    </div>



      <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Enquiry" ID="StudentEnrolmentFieldEnquiry" runat="server" IsRequired="false" 
            LabelWidth="200" CustomFieldType="Other" HTML5InputType="text" Placeholder="If there are any other courses you are interested in, or have any questions for us, please let us know here" />
    </div>

     <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="200" HTML5InputType="email" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server" IsRequired="true"  LabelWidth="200" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)"/>
    </div>

     <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Tel" ID="fldTel" runat="server" IsRequired="false"  LabelWidth="200" CustomCaption="Home Telephone" />
    </div>
  

  
    

     <div class=" form-group">
      
     <p class="textfieldlabelrequired">How did you find out about college?</p>
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HeardAboutCollegeID" ID="StudentEnrolmentField8" runat="server" IsRequired="true" LabelWidth="0"
            CustomCaption="How did you find out about college?" />
    </div>

        <div class=" form-group">
 
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined7" ID="EnquiryUserDEfined7" runat="server" IsRequired="true" LabelWidth="200" CustomFieldType="Lookup"
            CustomCaption="How did you find out about this course? " />
    </div>

      
    <asp:CheckBox ID="acceptmarketing" runat="server" Text="I am happy to receive information about future college courses & events">
     
    </asp:CheckBox>

    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcceptMarketingConsent" ID="AcceptMarketingTick" runat="server" LabelWidth="400" />
        </div>
    <br />
        <br />

        <br />
 

      
        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx" Visible="false"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" LinkResource="checkout_makepayment_aspx" CausesValidation="true" CssClass="button" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

    </div>

<script>

    $(document).ready(function () {




        var rdo = document.getElementsByName("<%= acceptmarketing.UniqueID%>")
        if (rdo[0].checked) {
            $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', true);
        }
        else {
            $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
        var RadioButtonListEU = document.getElementById("<%= acceptmarketing.ClientID%>")
        RadioButtonListEU.onchange = function () {
            var rdo = document.getElementsByName("<%= acceptmarketing.UniqueID%>")
            if (rdo[0].checked) {
                $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', true);
            }
            else {
                $('#ctl00_MainContentPlaceholder_ctl00_AcceptMarketingTick_chkAcceptMarketingConsent').prop('checked', false);
            }



        };
    });
</script>



<script>

    $(document).ready(function () {
 
        $('.divover19').hide();


        var rdo = document.getElementsByName("<%= over19.UniqueID%>")
        if (rdo[0].checked) {
            $(".divover19").show();
        }
        else {
            $(".divover19").hide();
        }

     
        var rdoLearnDiff = document.getElementById("<%= over19.ClientID%>")
        rdoLearnDiff.onchange = function () {
            var rdo = document.getElementsByName("<%= over19.UniqueID%>")
            if (rdo[0].checked) {
                $(".divover19").slideDown();
            }
            else {
                $(".divover19").slideUp();
            }


        };
    });

</script>


<script>

    $(document).ready(function () {

        $('.industry').hide();


        var rdo = document.getElementsByName("<%= enqudf9.UniqueID%>")
        if (rdo[0].checked) {
            $(".industry").show();
        }
        else {
            $(".industry").hide();
        }


        var rdoLearnDiff = document.getElementById("<%= enqudf9.ClientID%>")
        rdoLearnDiff.onchange = function () {
            var rdo = document.getElementsByName("<%= enqudf9.UniqueID%>")
            if (rdo[0].checked) {
                $(".industry").slideDown();
            }
            else {
                $(".industry").slideUp();
            }


        };
    });

</script>


<script>

    $(document).ready(function () {

        $('.employernameaware').hide();


        var rdo = document.getElementsByName("<%= EmployerAware.UniqueID%>")
        if (rdo[0].checked) {
            $(".employernameaware").show();
        }
        else {
            $(".employernameaware").hide();
        }


        var rdoLearnDiff = document.getElementById("<%= EmployerAware.ClientID%>")
        rdoLearnDiff.onchange = function () {
            var rdo = document.getElementsByName("<%= EmployerAware.UniqueID%>")
            if (rdo[0].checked) {
                $(".employernameaware").slideDown();
            }
            else {
                $(".employernameaware").slideUp();
            }


        };
    });

</script>


<script type="text/javascript">

    $(document).ready(function () {
        // Hide & show details on fees (without popping the browser window to the top on each click!)
        $(".slidingDiv").hide();
        $(".show_hide").show();

        $('.show_hide').click(function (e) {
            $(".slidingDiv").slideToggle();
            e.preventDefault();
        });
        // End hide & show


    });



</script>
