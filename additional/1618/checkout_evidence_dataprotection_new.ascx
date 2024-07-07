<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="checkout_evidence_dataprotection_new.ascx.vb" Inherits="checkout_evidence_dataprotection_new"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>


<br /><br />

<div class="panel panel-info">
<h2>Confirmation</h2>
 
<br />

     <h3>Please take time to read through this declaration before proceeding</h3>

      <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->

         <section>
     
          <h4>Privacy Statement – How we use your Personal Information</h4>
<p>This privacy notice is issued by the Education and Skills Funding Agency (ESFA), on behalf of the Secretary of State for the Department of Education (DfE). It is to inform learners how their personal information will be used by the DfE, the ESFA (an executive agency of the DfE), West of England Combined Authority (WECA) and any successor bodies to these organisations. For the purposes of relevant data protection legislation, the DfE is the data controller for personal data processed by the ESFA.</p>

<h4>Learner Record Service - Ability to Share</h4>
<p>Your personal information is used by the DfE to exercise its functions and to meet its statutory responsibilities, including under the Apprenticeships, Skills, Children and Learning Act 2009 and to create and maintain a unique learner number (ULN) and a personal learning record (PLR). Your information will be securely destroyed after it is no longer required for these purposes. For more information about how your information is processed and shared refer to the Extended Privacy Notice available on Gov.UK:<a href="http://www.gov.uk/government/publications/lrs-privacy-notices" target="_blank">www.gov.uk/government/publications/lrs-privacy-notices</a> </p>

<p>The European Social Fund (ESF) Managing Authority (or agents acting on its behalf) may contact you in order for them to carry out research and evaluation to inform the effectiveness of training. Your learning may be directly or indirectly part financed by the European Social Fund.</p>

<p>Generally, the information is processed as part or our public interest task of providing education to you. Further information about use of and access to your personal data, details of organisations with whom we regularly share data, information about how we retain your data, and how to change your consent to being contacted, please visit: <a href="www.cityofsuttoncoldifled.ac.uk/privacy-statement/" target="_blank">www.cityofsuttoncoldifled.ac.uk/privacy-statement/</a></p>

<p>As Data Controller, the College may share non-sensitive personal information with other organisations as set out on its Data Protection registration and from 25 May 2018, General Data Protection Regulation. The College may share your information with other organisations for education, training, employment, research and well-being related purposes. Further details are available on the College website <a href="www.cityofsuttoncoldifled.ac.uk/privacy-statement/" target="_blank">www.cityofsuttoncoldifled.ac.uk/privacy-statement/</a>. If at any time you wish to stop receiving these messages, please contact Student Services on 0117 312 5000 or enquiries@cityofsuttoncoldifled.ac.uk and change your preferences or opt-out at any time.</p>

<p>Sensitive Information: The College may use this information to ensure equality of opportunity, support your studies, minimise risk and for anonymous statistics. We are required to share it with the relevant government departments as mentioned above. We will ask you before sharing it with others.</p>
 
     
    </section> 

    </div>
	

    <ul>
    <li>I declare that the information I have disclosed is true and accurate to the best of my knowledge.</li>    
    <li>I agree to abide by City of suttoncoldifled College Student Charter</li>
    <li>I have been informed of and understand the entry requirements for my course, the guided learning hours, the nature and suitability of the course, the costs involved, what it leads to and how to contact the College for support and advice services. </li> 
    <li>As published in the College's Fees Policy, I understand that I am responsible for any fee amounts due, and that if I stop attending before the end of the course, I will continue to be responsible for the payment of any outstanding balance that remians (in full or in part). I also confirm that I understand the refund policy as outlined in the Fees Policy. </li>
    <li>I understand that in the event of unpaid fees my details may be passed on to a Debt Collection Agency, who will act on behalf of the College for recovery.</li>
    <li>I agree to inform City of suttoncoldifled College of any relevant change of personal circumstances or change of course.</li>
    <li>I understand that any kit or learning resources provided at a reduced/zero cost to me will remain the property of City of suttoncoldifled College until such time as I complete my programme of study/course and achieve my qualification.</li>
    <li>I understand that if my Employer or Training Agent is supporting my learning progress reports may be provided to them.</li>
    <li>I am aware of the College's complaints procedure, how to access it and raise a complaint.</li>
    <li>I confirm I understand how my data is being used and my contact preferences are as above.</li>
    </ul>    
    <p>Documentation relating to the above can be found at:<a href="www.cityofsuttoncoldifled.ac.uk/about-us/college-policies/" target="_blank">www.cityofsuttoncoldifled.ac.uk/about-us/college-policies/</a> </p>
    <br />

<br />
    <p> <asp:CheckBox ID="chkConfirm" runat="server" 
            Text=" - I confirm I have read the decalration above and the information given in this form is correct and complete." Font-Bold="True" 
            CausesValidation="True" />

    </p>
   
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" visible="false"/>
   <div  class="container">
    <div class="row">
         <div class="col-sm-2 columns form-group">  <cc1:CCCButton id="btnBack" runat="server" Text="Back" ImageResource="btnBack" LinkResource="checkout_evidence_new"/> </div>

        <div class="col-sm-2 columns form-group">  
            <button id="mybutton" class="btn btn-lg btn-primary" type="button"    runat="server" causesvalidation="true" onserverclick="btnContinue_Click">
             <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
               Submit your details
                </button>
         <div  id="divSaver" style="display:none">
             <button id="Button1" class="btn btn-lg btn-secondary" type="button" >
             <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
               Sending your details....please wait.....
                </button>
             </div>
            </div>
       <div class="col-sm-8 columns form-group">  </div>
      </div>
  </div>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />


 <script type="text/javascript">  
  //   alert(($('#<%= chkConfirm.ClientID %>').is(':checked')))
  
     $('.btn-lg').on('click', function () {

         if ($(this).hasClass('disabled')) {
             return false;
         } else {
             $(this).addClass('disabled');
             $('#divSaver').show();
             return true;
         }
     });
 </script>

  


