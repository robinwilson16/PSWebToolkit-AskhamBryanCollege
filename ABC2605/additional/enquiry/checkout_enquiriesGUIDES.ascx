<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enquiriesGUIDES.ascx.vb" Inherits="webcontrols_checkout_enquiriesGUIDES" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>


<%--
<div class="form-field-section grey">
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
    <h2 class="app-title">Course Guides </h2>  
 
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
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server" IsRequired="false"  LabelWidth="200" Pattern="\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|" Title="Please use international format (+ at the beginning)"/>
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="200" HTML5InputType="email" Placeholder="e.g. name@domain.com" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" />
    </div>

    <h4>Please enter your postcode or partial address below:</h4>
<p>Search <asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" CssClass="button" /></p>

<br>
     <p>Now double click the address below</p>
    <div class=" form-group">
    <asp:ListBox ID="lstresult" runat="server" AutoPostBack="True"></asp:ListBox>
    <br />
</div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField ID="txtAddress1" runat="server" CustomCaption="Property/Street"
                    IsRequired="true" StudentEnrolmentFieldType="Address1" LabelWidth="200" />
</div>

    <div class=" form-group">
        <cc1:StudentEnrolmentField ID="txtAddress2" runat="server" CustomCaption="Locality"
                    IsRequired="false" StudentEnrolmentFieldType="Address2" LabelWidth="200" />
</div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField ID="txtAddress3" runat="server" CustomCaption="Town"
                    IsRequired="false" StudentEnrolmentFieldType="Address3" LabelWidth="200" />
</div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField ID="txtAddress4" runat="server" CustomCaption="County"
                    IsRequired="false" StudentEnrolmentFieldType="Address4" LabelWidth="200" />
</div>
    

        <div class=" form-group">
            <p class="textfieldlabelrequired">Postcode</p><input type="text" runat="server"  id="postcode" title="Postcode" placeholder="Enter Postcode" />

    </div>


 <%--   <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EnquiryUserDefined3" ID="StudentEnrolmentField4" runat="server" IsRequired="true" LabelWidth="200"
            CustomCaption="Which guide/s would you like a copy of?" CustomFieldType="Lookup" />
    </div>--%>


  <div class=" form-group">
      <p class="textfieldlabelrequired">Which guide/s would you like a copy of?</p>
      <asp:Checkboxlist ID="copiesof" runat="server">
       <%--      <asp:ListItem Value="" Text="--Please Select--"></asp:ListItem>--%>
          <asp:ListItem Value="1" Text="School Leavers Guide"></asp:ListItem>
               <asp:ListItem Value="2" Text="Adult Learning Leaflet"></asp:ListItem>
               <asp:ListItem Value="3" Text="Student Guide to Apprenticeships"></asp:ListItem>
              
      </asp:Checkboxlist>

          </div>

  

     <div class=" form-group">
       
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SubjectID" ID="StudentEnrolmentField5" runat="server" IsRequired="false" LabelWidth="200"
            CustomCaption="What are you interested in?" CustomFieldType="Lookup" />
    </div>

      <%--<div class=" form-group">
      <p class="textfieldlabe">What are you interested in?</p>
      <asp:DropDownList ID="interestein" runat="server">
             <asp:ListItem Value="" Text="--Please Select--"></asp:ListItem>
          <asp:ListItem Value="1" Text="Courses"></asp:ListItem>
               <asp:ListItem Value="2" Text="Events"></asp:ListItem>
     
      </asp:DropDownList>

          </div>--%>

      
    <asp:CheckBox ID="acceptmarketing" runat="server" Text="I am happy to receive information about future college courses & events">
     
    </asp:CheckBox>

    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="AcceptMarketingConsent" ID="AcceptMarketingTick" runat="server" LabelWidth="400" />
        </div>
    <br />
        <br />

        <br />
   <%-- <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Enquiry" ID="StudentEnrolmentFieldEnquiry" runat="server" IsRequired="true" 
            LabelWidth="200" CustomFieldType="Other" HTML5InputType="text" Placeholder="Please provide details of your enquiry" />
    </div>--%>


        <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_aspx" Visible="false"/>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" LinkResource="checkout_makepayment_aspx" CausesValidation="true" CssClass="button"/>
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