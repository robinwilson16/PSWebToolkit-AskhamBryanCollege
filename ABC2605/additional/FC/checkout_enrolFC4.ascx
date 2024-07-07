<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC4.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address and Contact Details</li>
                    <li>Emergency Contact Details</li>
                    <li><strong>Supporting You</strong></li>
                    <li>Education and Employment</li>
                    <li>Payment and Privacy Notice</li>
                    </ol>

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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="true">
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
    <h2 class="app-title">Supporting You</h2>
    <hr />


    <!--
        <p>We collect information relating to special educational needs, disabilities and additional support so our learning support team can work with you to ensure that you receive the appropriate help and advice to achieve your full potential.</p>
    -->
    <h4>Criminal Convictions</h4>

        <p><strong>Askham Bryan College welcomes applicants from ex-offenders and considers them on their merits.</strong></p>
        <p><strong>We must ask you to provide details of any unspent criminal convictions. You do not need to tell us about any spent convictions, as defined by the Rehabilitation of Offenders Act 1974, unless your course involves access to children and young adults under the age of 18. If you are enrolled to such a course, any failure to disclose such convictions may result in the College asking you to withdraw. Any information you give will be completely confidential and is only considered in relation to this enrolment.</strong></p>
        
        <span class="textfieldlabelrequired">Do you have any unspent criminal convictions?</span>
        <asp:DropDownList runat="server" ID="rdoCC" CssClass="form-group">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
       
        </asp:DropDownList>


<%--       <div class="form-input">
        <span class="textfieldlabelrequired">Are you applying as an international student?</span>
        <asp:DropDownList runat="server" ID="rdoOverseas" CssClass="form-input">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No - I confirm I hold UK citizenship" Value="0"></asp:ListItem>

        </asp:DropDownList>

        </div>

         <span class="textfieldlabelrequired">Are you in or have you recently left Local Authority Care?</span>
         <asp:DropDownList ID="NotHECareLeaver" runat="server" EnableViewState="true">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
            <asp:ListItem Value="0" Text="No"></asp:ListItem>

        </asp:DropDownList>


    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="fldCareLeaver" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Care Leaver" Enabled="True" CustomFieldType="TickBox" />
    </div>--%>

    <h4>Learning Difficulty, Disability or Health Condition</h4>

    <div class="form-input">
        <span class="textfieldlabelrequired">Do you consider that you have a learning difficulty, disability or health condition? It is your responsibility to disclose any support requirements.</span>
        <asp:DropDownList runat="server" ID="rdoLearnDiff" CssClass="form-input" EnableViewState="true" ClientIDMode="Static">
            <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>

        </asp:DropDownList>

    </div>

    <div class="Disability">

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="StudentEnrolmentField13" runat="server" CustomCaption="Please provide your main learning diffculty/disability" IsRequired="false" LabelWidth="400" />
    </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" ID="StudentEnrolmentField1" runat="server" CustomCaption="Let us know if you have any other learning diffculty/disability" IsRequired="false" LabelWidth="400" />
    </div>
    </div>


    <h4>Ethnic origin</h4>

    <p><strong>For equality of opportunity monitoring, please select to describe your cultural background (groups based on 2011 census).</strong></p>

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="StudentEnrolmentField2" CssClass="form-input" runat="server" CustomCaption="Ethnic origin" IsRequired="false" LabelWidth="300" />
    </div>

    </div>

<%--    <span class="textfieldlabelrequired">Do you consider yourself to have special educational needs?</span>
    <asp:DropDownList ID="ddsen" runat="server">
        <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:DropDownList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasSpecialEducationNeeds" ID="StudentEnrolmentField6" runat="server" LabelWidth="400" />


    </div>

    <span class="textfieldlabelrequired">Do you have an Educational Health and Care Plan (EHCP)?</span>
    <asp:DropDownList ID="HasEHCP" runat="server">
        <asp:ListItem Text="--please select--" Value=""></asp:ListItem>
        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
        <asp:ListItem Text="No" Value="0"></asp:ListItem>
    </asp:DropDownList>

    <div class="displaynone">

        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="HasEducationHealthCarePlan" ID="StudentEnrolmentField14" runat="server" LabelWidth="400" />

    </div>--%>




    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />

<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />


<script>

    //hide and show disability
        $(document).ready(function () {

        $('.Disability').hide()

    
        if ($("#<%=rdoLearnDiff.ClientID%>").val()=="1") {
            $(".Disability").show()
           // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
        }
        else {
            $(".Disability").hide()
           // $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
        }

        // Set EU Fields visibility when 'Yes' radio button is clicked
      
        $('#<%= rdoLearnDiff.ClientID %>').change(function () {
          
            if ($("#<%=rdoLearnDiff.ClientID%>").val()=="1") {
               // alert(ele[1].checked);
                $(".Disability").slideDown()
              //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', true);
            }
            else {

                $(".Disability").slideUp()
              //  $('#ctl00_MainContentPlaceholder_ctl00_LivingWithContact1_chkIsLivingWithContact1').prop('checked', false);
            }


        });
    });
</script>


