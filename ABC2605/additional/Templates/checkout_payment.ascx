<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_payment.ascx.vb" Inherits="checkout_payment" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<div class="intro-block">
							
								<h1>Payment<span class="last-word"> Form</span></h1>
					
						</div>

<div class ="panel panel-info" >
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
    DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none" Caption='<h4>Items:</h4>'
CaptionAlign="Top">

        
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Course Name">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
                <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy:tt}" HeaderText="Start Date"
                    HtmlEncode="False">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
                <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy:tt}" HeaderText="End Date"
                    HtmlEncode="False">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
                <%--<asp:BoundField DataField="SiteDescription" HeaderText="Site" />--%>
                <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Amount" DataFormatString="{0:c}">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
            </Columns>
            <RowStyle CssClass="searchgridcell" />
            <HeaderStyle CssClass="searchgridheader" />
            <EmptyDataTemplate>
                <p>No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.</p>
            </EmptyDataTemplate>
        </asp:GridView>
  
    </div>
  <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="alert alert-danger" ForeColor="" />
    <div class="form-field-section grey">
<%--<section>   
<h3>Information for Applicants</h3>

   
<h5>Applicants should make sure they have read the Financial Support policy <a href="https://acollege.ac.uk/fees-funding/" target="_blank">here</a> to determine their eligibility and what support they may be entitled to apply for.</h5>
    </section>--%>
   


  
    <hr />

   <h3>Your Details</h3>

        <h4> Please enter the details of the Student you wish to pay for:</h4>

     <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="StudentEnrolmentField2" runat="server" IsRequired="True"  LabelWidth="400" CustomCaption="Student Reference Number (found in your email)" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true"  LabelWidth="400" CustomCaption="First Name" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true"  LabelWidth="400" CustomCaption="Surname" />
    </div>
     
     <div class=" form-group">
        <cc1:StudentEnrolmentField id="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth"   LabelWidth="400" ClientIDMode="Static"/>
    </div>
            <div class=" form-group">
        <cc1:StudentEmailField StudentEnrolmentFieldType="Email" ID="StudentEnrolmentField3" runat="server" IsRequired="false" LabelWidth="200" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$"  />
    </div>

        <h4> Address</h4>
    <div class=" form-group">
         <cc1:StudentEnrolmentField runat="server" ID="fldAddress1" StudentEnrolmentFieldType="Address1" CustomCaption="House number and street name" />
     </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress2" StudentEnrolmentFieldType="Address2" CustomCaption="Area" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress3" StudentEnrolmentFieldType="Address3" CustomCaption="Town/City" />
    </div>
    <div class=" form-group">
        <cc1:StudentEnrolmentField runat="server" ID="fldAddress4" StudentEnrolmentFieldType="Address4" CustomCaption="Country" />
    </div>
    <div class=" form-group">
        <label for="postcode" style="font-weight:normal ">Postcode</label>
        <input runat="server" type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Your postcode here..." autocomplete="off" pattern="^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$" title="Please enter a valid Postcode"/>
    </div>
</div>

    
 <div class="form-field-section grey">
   
         <h3>Summary:</h3>

     <span class="glyphicon glyphicon-shopping-cart"></span><cc1:ShoppingBasketTotals ID="ShoppingBasket1"
            runat="server" HideIcon="true" />

         <asp:CheckBox ID="chkConfirm" runat="server" 
            Text="This is the correct amount" Font-Bold="True" 
            CausesValidation="True" />

     <h4>Please confirm that the payment amount is correct - if this is not correct please get in touch using the contact number below</h4>


         <div class="form-group">

         

<%--                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="StudentDetailUserDefined34" ID="StudentEnrolmentField17" runat="server" IsRequired="True"  LabelWidth="400" CustomCaption="I agree to the declaration as stated above" />--%>
   </div>
  
     </div>




<div class ="form-field-section grey">

    <h3>What happens next?</h3>

    <ul>
        <li>Click next and You'll be forwarded to our payment provider for the payment - thankyou</li>


    </ul>




    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />



    </div>


<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CssClass="button" />
