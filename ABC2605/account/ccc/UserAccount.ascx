<%@ Control Language="VB" AutoEventWireup="false" CodeFile="UserAccount.ascx.vb" Inherits="account_ccc_UserAccount" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit" TagPrefix="cc1" %>


<br /><br />
                <ol class="breadcrumb">
                  <li><a href="default.aspx">Home</a></li>
                  <li class="active">User Account</li>
                </ol>



        <style>
         
         </style>



          <h3>User Account</h3>
            <p>Here you can see the status of any previous applications you have made, along with the details on interviews that have been arranged.</p>
           
            <p>Your college reference number: <span runat="server" id="strRefNo" style="font-weight:700"></span></p>
            <br />

            <a href="#Details">Update your details</a><br /><br />
     
      <asp:ListView runat="server" ID="lstDetails">
          <ItemTemplate>
              <div class="">
                     <asp:Label runat="server" ID="lblCourse" CssClass="courseHeader" text='<%#: Eval("OfferingName")%>'></asp:Label><br />
               
             <hr />
              <ol class="progtrckr" data-progtrckr-steps="5" runat="server" id="progtrckr">
                <li class="progtrckr-done" runat="server" id="stage0">Submitted</li>    
                <li class="progtrckr-todo" runat="server" id="stage1">Application Created</li>    
                <li class="progtrckr-todo" runat="server" id="stage2">Interview Created</li>
                <li class="progtrckr-todo" runat="server" id="stage3">College Offer Made</li>
                <li class="progtrckr-todo" runat="server" id="stage4">Student Enrolled</li>
                </ol>
                  <ol class="progtrckr" data-progtrckr-steps="5" runat="server" id="Ol1">
                <li  runat="server" id="stage0Details" class="prog-details done">
                    <div >
                        <b>Application Submitted</b><br />
                             <b>Request Date:</b><asp:Label runat="server" ID="lblRequestDate" text='<%#: Eval("RequestDate", "{0:d}")%>'></asp:Label>
                    </div>

                </li>    
                <li  runat="server" id="stage1Details" >
                    <div >
                        <b>Application Processed:</b><br />
                         <b>Date:</b> <asp:Label runat="server" ID="iApplicationCreatedDate" text='<%#: Eval("ApplicationCreatedDate", "{0:d}")%>'></asp:Label><br />
                    </div>

                </li>    
                <li  runat="server" id="stage2Details" >
                   <div>
                <b>Interview Details:</b><br />
                        <div runat="server" id="interviewDetails">
                       
                       
                           <b>Date/Time:</b> <asp:Label runat="server" ID="iDateTime"  text='<%#: Eval("DateTime", "{0:d}")%>'></asp:Label><br />
                           <b>Site:</b> <asp:Label runat="server" ID="iSite"  text='<%#: Eval("Site")%>'></asp:Label><br />
                           <b>Type:</b> <asp:Label runat="server" ID="iType" text='<%#: Eval("InterviewType")%>'></asp:Label><br />
                           <b>Duration:</b> <asp:Label runat="server" ID="iDuration" text='<%#: Eval("Duration")%>'></asp:Label><br />
                            </div>
                      </div>

                </li>
                <li  runat="server" id="stage3Details" >
                    <div >
                        <b>Offer Details:</b><br />
                    <asp:Label runat="server" ID="iOffer" text='<%#: Eval("ApplicationOffer")%>'></asp:Label><br />
                    </div>

                </li>
                <li  runat="server" id="stage4Details" >
                    <div >
                        <b>Enrolment Details:</b><br />
                        <div runat="server" id="enrolmentDetails">
                        <b>Start Date:</b><asp:Label runat="server" id="iEnrolmentStartDate"  text='<%#: Eval("EnrolmentStartDate", "{0:d}") %>'></asp:Label><br />
                         <b>Expected End Date:</b><asp:Label runat="server" id="iEnrolmentExpectedEndDate"  text='<%#: Eval("EnrolmentExpectedEndDate", "{0:d}")%>'></asp:Label><br />
                         <b>Course Code:</b><asp:Label runat="server" id="iEnrolmentCourseCode"  text='<%#: Eval("EnrolmentCourseCode")%>'></asp:Label><br />
                         <b>Course Name:</b><asp:Label runat="server" id="iEnrolmentCourseName" text='<%#: Eval("EnrolmentCourseName")%>'></asp:Label><br />
                         <b>Group Code:</b><asp:Label runat="server" id="iEnrolmentGroupCode" text='<%#: Eval("EnrolmentGroupCode")%>'></asp:Label><br />
                            </div>
                    </div>

                </li>
                </ol>
               
            
              </div>
<br />           
           
          </ItemTemplate>
      </asp:ListView>
<a name="Details">
       <br /><br />
</a><div class="form-field-section grey" style="clear: left;" >
    <div class="panel-heading">Update Details</div>
        <div>         
            
                <%--<form  id="registerform">--%>
                
                    <div class=" form-group">
                        <cc1:StudentEnrolmentField runat="server" ID="fldSurname" StudentEnrolmentFieldType="Surname" />
                    </div>
                    <div class=" form-group">
                       <cc1:StudentEnrolmentField runat="server" ID="fldFirstForename" StudentEnrolmentFieldType="FirstForename" />
                    </div>
                    <div class=" form-group">
                        <cc1:StudentEnrolmentField runat="server" ID="fldTitle" StudentEnrolmentFieldType="title" />           
                    </div>
                    <div class=" form-group">
                        <cc1:StudentEnrolmentField runat="server" ID="fldSex" StudentEnrolmentFieldType="Sex" />                 
                    </div>
                    <div class=" form-group">
                       <cc1:StudentEnrolmentField runat="server" ID="fldDateOfBirth" StudentEnrolmentFieldType="DateOfBirth" />
                    </div>
                    <div class=" form-group">
                        <cc1:StudentEnrolmentField runat="server" ID="fldAddress1" StudentEnrolmentFieldType="Address1" />
                    </div>
                    <div class=" form-group">
                        <cc1:StudentEnrolmentField runat="server" ID="fldAddress2" StudentEnrolmentFieldType="Address2" />
                    </div>
                    <div class=" form-group">
                        <cc1:StudentEnrolmentField runat="server" ID="fldAddress3" StudentEnrolmentFieldType="Address3" />
                    </div>
                     <div class=" form-group">
                         <cc1:StudentEnrolmentField runat="server" ID="fldAddress4" StudentEnrolmentFieldType="Address4" />
                    </div>
                    <div class=" form-group">
                         <label for="postcode" class="label2">Postcode</label>
                        <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Your postcode here..." autocomplete="off" />
                    </div>
                    <div class=" form-group">
                         <cc1:StudentEnrolmentField runat="server" ID="fldEmail" StudentEnrolmentFieldType="Email" />
                    </div>
                    <div class="form-field-section grey">
                        <div class="panel-heading">To change your password, enter your existing password and then your new password below</div>
                     <div class=" form-group">
                        <label for="password" class="label2 ">Current Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Your password here..." autocomplete="off"  />
                    </div>                   
                    <div class=" form-group">
                        <label for="passwordnew" class="label2 ">Change Password</label>
                        <input type="password" id="passwordnew" name="passwordnew" class="form-control" placeholder="New password here..." autocomplete="off"  />
                    </div>
                    <div class=" form-group">
                        <label for="password_mirror" class="label2 ">Retype New Password</label>
                        <input type="password" id="password_mirror" name="password_mirror" class="form-control"  placeholder="Retype your new password..." autocomplete="off"   oninput="check(this)"/>
                    </div>
                   </div>
                    <div class=" form-group">
                        <p runat="server" id="errtext" style="color:red"></p>
                    </div>
                    <div class=" form-group">
                        
                       <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="button" OnClick="btnSubmit_OnClick"/>
                        
                    </div>
            <div class=" form-group" style="text-align:center;">
            <label id="lblError" runat="server" visible="false" class="text-center text-danger"></label>
               </div>
                <%--</form>--%>
            </div>

      
    </div>
<br /><br />


<script>
    function check(input) {
        if (input.value !== $("#passwordnew").val()) {
            input.setCustomValidity('Password does not match.');
        } else {
            // input is fine -- reset the error message
            input.setCustomValidity('');
        }
    }

</script>
