<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="courseapply.ascx.vb" Inherits="courseenrol"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<style>
    #FeeGridTotalCell {
    font-weight:700;
}
</style>
        <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->
<%--    <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" />
<h3>The following Enrolment has been added to your list of courses:</h3>
    
   <cc1:OfferingFeesDisplayAll runat="server"  />--%>

<div class="form-field-section grey">
    <h2>Askham Bryan College Application Form</h2>
    <p>Please use this form for application to Askham Bryan College for Full Time Courses, Part Time Courses and Apprenticeships</p>
    <p>Applications to University Centre Askham Bryan must be made through <a href="https://www.ucas.com/explore/unis/7d51ec43/university-centre-askham-bryan/courses?studyYear=current" target="_blank">UCAS</a>. </p>
    <p>If you are currently a student with us at Askham Bryan College, please speak to the Employability team or your course manager as you may be able to apply directly.</p>
    <p>Applications are processed at our main York centre.</p>

<br />

     <div class="Course">
    <span class="textfieldlabelrequired">Please select your course</span>
    <asp:DropDownList ID="ddCourse" runat="server">
         <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
     </asp:DropDownList>
             
          </div>

     <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

</div>

<%--    <p>
        Total courses selected: &nbsp;<span class="wglyphicon glyphicon-shopping-cart"></span><cc1:ShoppingBasketTotals ID="ShoppingBasket1"
            runat="server" HideIcon="true" />
    </p>--%>
        <cc1:CCCButton ID="btnContinue" runat="server" Text="Lets Get Started " CssClass="button" LinkResource="checkout_directapply_HEapp_aspx" CausesValidation="true" EnableEnterKey="true"/>


