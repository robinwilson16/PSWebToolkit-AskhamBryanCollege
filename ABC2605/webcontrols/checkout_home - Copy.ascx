<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_home.ascx.vb" Inherits="checkout_home"  %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/additional/Templates/checkout_bursary.ascx" TagPrefix="uc1" TagName="checkout_bursary" %>









<div class ="form-field-section grey" id="griddiv" runat="server" visible="false">
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
    DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none"
CaptionAlign="Top" Visible="true">

        
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
             <%--   <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee" DataFormatString="{0:c}">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>--%>
            </Columns>
            <RowStyle CssClass="searchgridcell" />
            <HeaderStyle CssClass="searchgridheader" />
            <EmptyDataTemplate>
                <p>No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.</p>
            </EmptyDataTemplate>
        </asp:GridView>
   


 






</div>



<br />

 <div class="form-field-section grey">

         <h2 class="app-title">Welcome to Askham Bryan College Online Applications &amp; Enrolment</h2>

     <p class="alert alert-info">This web form will remain open for up to 3 hours to allow you to complete your application / enrolment. You may need to gather the following information</p>

        

<%--     <div id="enrolrequest" runat="server" visible="true">
          <h2 class="app-title">Welcome to Askham Bryan College Online Enrolment</h2>

          <p>The information we are collecting from you here will be used to process your enrolment on your chosen course or programme and we need it to register you with the correct Awarding Body and to provide to our Funding Body the ESFA. More information on how your data will be processed by Askham Bryan College can be read in detail here: <a href="https://www.askham-bryan.ac.uk/privacynotices/">https://www.askham-bryan.ac.uk/privacynotices/</a></p>

         
             

         <p>If you have a student reference number it is displayed here</p>

         <input type="text" id="fldRef" runat="server" readonly="readonly" />
    
     <p><b>Next steps</b></p>
     <ul>
    
           <li>Complete the enrolment form and submit it - this web form will remain open for up to 3 hours.</li>
         <li>Gather the following information:</li>
         <li>Your residency/nationality information</li>     
          <li>If you have any disbilities or learning needs, and details about those</li>
         <li>Details of one emergency contact (next of kin/parent/guardian)</li>
         <li>Your employment details (Length of time you've worked there and how many hours per week)</li>
         <li>Details of any previous qualifications you've studied</li>
         <li>A headshot photograph for your ID badge</li>
         <li>
             You will be contacted by the college to arrange an online meeting to discuss your course at the college.
         </li>
         <li>Attend the online meeting and decide upon your course.</li>
         <li>Attend a Taster Day in June 2022 (to be confirmed) to meet your tutors and other learners in your group.</li>
         <li>Come to an enrolment session where the exact course can be discussed with the tutor depending on your results.</li>
         <li>Start your course on the date listed above</li>
          
     </ul>
  
     <p><b>For HE courses </b>You will also need scanned/photographed copies of the following pieces of information, please take a clear photograph or scan of these documents and have them ready:</p>

     <ul>
         <li>One form of identification (passport / driving licence / birth certificate / identity card) </li>
         <li>Your results slip / grade certificates</li>
     </ul>

     <br />

         </div>--%>


    <p>To make sure we get you to the right place - please answer the following question :</p>



 
     
     
            <div class=" form-group">
                <%-- <cc1:StudentEnrolmentField StudentEnrolmentFieldType="DateOfBirth" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="300" HTML5InputType="date" />--%>
                <p class="textfieldlabelrequired">What is your Date of Birth?</p>
                      
        <asp:textbox type="date" max="2079-12-31" runat="server" id="DoB"></asp:textbox>

            </div>

     
             

     <p class="alert alert-danger" id="musthavecourse" runat="server" visible="false">You must have a course in the basket - please click the link again</p>

     <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
     
 <br />    
     <br />
     <br />

     
     <asp:Button ID="getstarted" runat="server" CssClass="button secondary" Text="Lets Get Started" />

<hr />
     <br />
     <br />

    <div id="basketchoices" runat="server" visible="false">

     <h3>Your choices</h3>

        <p class="alert alert-info">If you want to remove any choices from the basket, you can do so below. If you want to search again, please click the link <a style="color:blue;" href="https://www.askham-bryan.ac.uk/courses.html">here</a> to go back to search </p>


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />
     <br />
   

<%--      <p><b>If you want to remove any item from the basket you can do so below</b></p>--%>

 <asp:PlaceHolder runat="server" ID="BasketPlaceHolder" Visible="true">


    </asp:PlaceHolder>


        </div>



 </div>


<div class="form-field-section grey">



    <h2 class="app-title">Testing Links (Remove / reformat when live) </h2>



      <a href="webenrolment.aspx?page=~/additional/checkout_directapply.ascx">Application</a>
    <br />
    <br />

  

      <a href="webenrolment.aspx?page=~/webcontrols/checkout_enquiries.ascx">Enquiry</a>
    <br />
    <br />


     <h3> Other forms</h3>


      <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesEVENTS.ascx">Open Events</a>
    <br />
    <br />
   
 


     <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesASKUS.ascx">Session booking </a>
    <br />
    <br />

    
    <a href="webenrolment.aspx?page=~/additional/templates/checkout_bursary.ascx">Learning support form </a>
    <br />
    <br />
       <a href="webenrolment.aspx?page=~/additional/templates/checkout_medical.ascx">Medical Declaration  </a>
    <br />
    <br />
       <a href="webenrolment.aspx?page=~/additional/templates/checkout_consent.ascx">Consent &amp; indemnity </a>
    <br />
    <br />



      
   
<%--
   <h3>Templates - Supplementary Forms</h3>


    <a href="webenrolment.aspx?page=~/additional/templates/checkout_bursary.ascx">Bursary </a>
    <br />
    <br />

    <a href="webenrolment.aspx?page=~/additional/templates/checkout_evidence_new.ascx">Grades upload</a>
    <br />
    <br />
  
    
    
    <a href="webenrolment.aspx?page=~/additional/templates/checkout_feeremission_new.ascx">Fee Remission upload</a>
    <br />
    <br />
  
       <a href="webenrolment.aspx?page=~/additional/templates/checkout_payment.ascx">Single Payment</a>
    <br />
    <br />

       <a href="webenrolment.aspx?page=~/additional/templates/parking.ascx">Parking permit</a>
    <br />
    <br />
           <a href="webenrolment.aspx?page=~/additional/templates/photo.ascx">Photo Upload</a>
    <br />
    <br />--%>


</div>






   <br />



 

    
