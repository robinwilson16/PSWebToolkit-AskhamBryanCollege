<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply3.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 83%;" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li id="liEmergency" runat="server">Emergency Contact Details</li> 
                    <li>Employment Qualifications and References</li>
                    <li>Personal Statement</li>
                    <li><strong>Supporting You</strong></li>
                    <li>Data Protection</li>
                    </ol>

<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="CourseInformation" HeaderText="Course Name">
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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="true">
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

    <h5>Criminal Convictions</h5>

    <p>Askham Bryan College welcomes applicants from ex-offenders and considers them on their merits. However, you are required to tell us about any convictions which are not spent under the Rehabilitation of Offenders Act (1974)</p>
    <p>If ‘Yes’, we will contact you for further information, prior to arranging an interview.</p>
    <p><strong>Please note: you do not need to tick the yes box if your criminal conviction is spent as defined by the Rehabilitation of Offenders Act 1974.</strong></p>
        
    <div class="form-input">
        <span class="textfieldlabelrequired">Do you have any unspent criminal conviction(s) and/or prosecutions pending?</span>
        <asp:DropDownList runat="server" ID="rdoCC" CssClass="form-group">
            <asp:ListItem Text="please select..." Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="2"></asp:ListItem>
            <asp:ListItem Text="No" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    <hr />
    
    <h5>Ethnicity</h5>

    <p><strong>For equality of opportunity monitoring, please select to describe your cultural background (groups based on 2011 census) below:</strong></p>
    
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="fldEthnicGroupID" runat="server" IsRequired="true"  ExcludedIDValues="99" CustomCaption="Ethnicity" />
          </div>
   
    </div>
    <hr />

    <h5>Learning Difficulty, Disability or Health Condition</h5>

    <div class="form-input">
        <span class="textfieldlabelrequired">Do consider yourself to have a learning difficulty and/or disability?</span>
        <asp:DropDownList runat="server" ID="rdoLearnDiff" CssClass="form-input" EnableViewState="true" ClientIDMode="Static">
            <asp:ListItem Text="please select..." Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
            <asp:ListItem Text="No" Value="2"></asp:ListItem>
         </asp:DropDownList>

    <div style="display:none">
             <cc1:StudentEnrolmentField Visible="true" ClientIDMode="Static" StudentEnrolmentFieldType="LearningDiffOrDisID" ID="fldLearningDiffOrDisID" runat="server" IsRequired="false"   />
                </div>
    <i> *It is your responsibility to disclose any support requirements. This will help the College make reasonable adjustments, limited by funding available.</i>

    </div>

<div class="Disability">
    <br />

    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="StudentEnrolmentField13" runat="server" CustomCaption="* Please specify main learning/disability" IsRequired="false" LabelWidth="400" />
            </div>
    <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" ID="StudentEnrolmentField1" runat="server" CustomCaption="And, if appropriate, a secondary learning difficulty" IsRequired="false" LabelWidth="400" />
            </div>
</div>
    <br />
    <hr />

    <h5>In Care</h5>

    <div class="form-input">
    <p>Select Yes if you've ever lived in public care or as a looked-after child, including:</p>
        
     <ul>
         <li>With foster carers under local authority care</li>
         <li>In a residential children’s home</li>
         <li>Been ‘looked after at home’ under a supervision order</li>
         <li>Living with friends or relatives in kinship care</li>
     </ul>  
    </div>

      <p>Note: This does not refer to time spent in boarding schools, working in a care or healthcare work setting, or if you are a carer yourself.</p>

         <span class="textfieldlabelrequired">Have you been in care?</span>
         <asp:DropDownList ID="NotHECareLeaver" runat="server" EnableViewState="true">
            <asp:ListItem Text="please select..." Value=""></asp:ListItem>
            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
            <asp:ListItem Value="0" Text="No"></asp:ListItem>

        </asp:DropDownList>

    <div class="displaynone">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="fldCareLeaver" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Care Leaver" Enabled="True" CustomFieldType="TickBox" />
    </div>


</div>


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


