<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolments2.ascx.vb" Inherits="webcontrols_checkout_enrolments2" %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

</script>
<!--<br />
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
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_parent_guardian.ascx">Guardian - Emergency</a></li>                   
                    <li>Further Details</li>
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_quals_on_entry.ascx">Qualifications</a></li>
 
                    <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_attachments.ascx">Attachments</a></li>
                     <li><a href="webenrolment.aspx?page=~/webcontrols/checkout_dataprotection.ascx">Declarations</a></li>
                </ol>
    -->
<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 37.5%;" aria-valuenow="37.5" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Guardian / Emergency</li>                   
                    <li><Strong>Further Details</Strong></li>
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
       <h2>Further Details</h2>

          </div>
  </div>

     <div class="row">
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="NationalityID" ID="StudentEnrolmentField1" runat="server"  IsRequired="true"   CustomCaption="Nationality" />
           </div>
       <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CountryID" ID="StudentEnrolmentField2" runat="server"  IsRequired="true"  LabelWidth="400" CustomCaption="Main Country of residence (last 3 years)?" />
           </div>
 
    </div>

          <p><strong>For equality of opportunity monitoring, please select to describe your cultural background (groups based on 2011 census) below:</strong></p>
    <div class="row">
      <div class="col-sm-12 columns form-group"> 
           <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="fldEthnicGroupID" runat="server" IsRequired="true"  ExcludedIDValues="99" CustomCaption="Ethnicity" />
          </div>
    
   </div>


        
    <div class="form-input">
          <span class="textfieldlabelrequired">Do you consider that you have a learning difficulty, disability or health condition?</span>
      
            <asp:DropDownList runat="server" ID="selectLearnDiff"  CssClass="form-input" >
                <asp:ListItem Text="Please select..." Value=""></asp:ListItem>
                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                <asp:ListItem Text="No" Value="2"></asp:ListItem>
                <asp:ListItem Text="Rather not say" Value="9"></asp:ListItem>
            </asp:DropDownList>
          <div style="display:none">
             <cc1:StudentEnrolmentField Visible="true" ClientIDMode="Static" StudentEnrolmentFieldType="LearningDiffOrDisID" ID="fldLearningDiffOrDisID" runat="server" IsRequired="false"   />
      </div>
        <i> *It is your responsibility to disclose any support requirements. This will help the College make reasonable adjustments, limited by funding available.</i>
          </div>
    <br />
    <div class="row"  id="disfields">
      <div class="col-sm-6 columns form-group"> 
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory1ID" ID="stuDisabilityCategory1ID" runat="server" LabelWidth="300" IsRequired="false" CustomCaption="* Please specify main learning/disability" ExcludedIDValues="99"/>
              <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DisabilityCategory2ID" runat="server" Visible="true" IsRequired="false"  LabelWidth="400" CustomCaption="And, if appropriate, a secondary learning difficulty" />
        </div>

      </div>
    <br />
     <div class="row">
         <div class="col-sm-12 columns form-group">
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="LookedAfter" ID="StudentEnrolmentField3" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you are currently in care?"/>
          </div>
          </div>
    <br />

    <div class="form-input">
    <p>Have you ever lived in public care or as a looked-after child, including:</p>
        
     <ul>
         <li>With foster carers under local authority care</li>
         <li>In a residential children’s home</li>
         <li>Been ‘looked after at home’ under a supervision order</li>
         <li>Living with friends or relatives in kinship care</li>
     </ul>  
    </div>

      <p>Note: This does not refer to time spent in boarding schools, working in a care or healthcare work setting, or if you are a carer yourself.</p>
      <div class="row">
         <div class="col-sm-12 columns form-group">
             <cc1:StudentEnrolmentField StudentEnrolmentFieldType="CareLeaver" ID="StudentEnrolmentField16" runat="server"  LabelWidth="300" IsRequired="false" CustomCaption="Tick if you have been in care (care leaver)"/>
          </div>
          </div>
   
         <div class="row">
       <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined6" ID="StudentEnrolmentField4" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Which of the following options best describes your sexual orientation?" />
           </div>
       <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined7" ID="StudentEnrolmentField5" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="350" CustomCaption="What Gender do you identify as?" />
           </div>
       <div class="col-sm-12 columns form-group"> 
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined8" ID="StudentEnrolmentField6" CustomFieldType="Lookup" runat="server"  IsRequired="false"  LabelWidth="450" CustomCaption="Do you identify as the same gender as registered at birth?" />
           </div>
    </div>


        <cc1:CCCButton id="btnBack" runat="server" Text="Back" CssClass="button" />
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button"  CausesValidation="true" EnableEnterKey="true" />
</div>



    <script type="text/javascript">
        $(document).ready(function () {

            

           $("#disfields").hide();
        if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                $("#disfields").show();
            }
            $('#<%= selectLearnDiff.ClientID %>').change(function () {
              //  $('#cboLearningDiffOrDisID').val($(this).val());
            if ($("#<%=selectLearnDiff.ClientID%>").val() == "1") {
                    $("#disfields").show();
                    return;
                }
                else {
                    $("#disfields").hide();
                }
            });


        });
    </script>