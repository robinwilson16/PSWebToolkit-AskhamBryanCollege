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

<div class="form-field-section grey">
    <h2>Askham Bryan College Application Form</h2>
    <p>Please use this form for application to Askham Bryan College for Full Time Courses, Part Time Courses and Apprenticeships</p>
    <p>Applications to University Centre Askham Bryan must be made through <a href="https://www.ucas.com/explore/unis/7d51ec43/university-centre-askham-bryan/courses?studyYear=current" target="_blank">UCAS</a>. </p>
    <p>If you are currently a student with us at Askham Bryan College, please speak to the Employability team or your course manager as you may be able to apply directly.</p>

<br />


        <span class="textfieldlabelrequired">Please select your application type</span>
    <asp:DropDownList ID="ddAppType" runat="server"  EnableViewState="true">
         <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
         <asp:ListItem Value="FE" Text="College Course"></asp:ListItem>
         <asp:ListItem Value="Apps" Text="Apprenticeship"></asp:ListItem>
        
    </asp:DropDownList>
    <!-- <asp:ListItem Value="MP" Text="Minster Provision"></asp:ListItem>
         <asp:ListItem Value="OUT" Text="Outreach - Prince's Trust or Flex"></asp:ListItem>
        -->
    <script>

        $(document).ready(function () {
            //surname visibility
            $('.Campus').hide();
           // alert($("#<%= ddAppType.ClientID %>"));
            // Hide or Show Surname
            if ($("#<%=ddAppType.ClientID%>").val() == "FE") {
                $(".Campus").show();
            }
            else {
                $(".Campus").hide();
            }

            $('#<%= ddAppType.ClientID %>').change(function () {
                if ($("#<%=ddAppType.ClientID%>").val() == "FE") {

                    $(".Campus").slideDown();
                }
                else {
                    $(".Campus").slideUp();
                    $(".Subject").slideUp();
                    $(".Course").slideUp();
                    $("#<%=ddSite.ClientID%>").val("");
                    $("#<%=ddSubject.ClientID%>").val("");
                    $("#<%=ddCourse.ClientID%>").val("");
                }

            });
        });


    </script>

         <div class="Campus">
           <span class="textfieldlabelrequired">Please select which campus you wish to study at</span>
    <asp:DropDownList ID="ddSite" runat="server"  AutoPostBack="true"  EnableViewState="true">
         <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
         <asp:ListItem Value="20" Text="York"></asp:ListItem>
         <asp:ListItem Value="9" Text="Middlesbrough"></asp:ListItem>
        <asp:ListItem Value="13" Text="Saltaire"></asp:ListItem> 
        <asp:ListItem Value="18" Text="Wakefield"></asp:ListItem>
         <asp:ListItem Value="10" Text="Newcastle"></asp:ListItem>
    </asp:DropDownList>
             </div>

         <script>

             $(document).ready(function () {
                 //surname visibility
                 $('.Subject').hide();
           // alert($("#<%= ddSite.ClientID %>"));
            // Hide or Show Surname
                 if ($("#<%=ddSite.ClientID%>").val() != "") {
                $(".Subject").show();
            }
            else {
                $(".Subject").hide();
            }

            $('#<%= ddSite.ClientID %>').change(function () {
                if ($("#<%=ddSite.ClientID%>").val() != "") {

                    $(".Subject").slideDown();
                }
                else {
                    $(".Subject").slideUp();
                    $("#<%=ddSubject.ClientID%>").val("");
                    $("#<%=ddCourse.ClientID%>").val("");
                }

            });
        });


         </script>

     <div class="Subject">
 
    <span class="textfieldlabelrequired">Select a Course Area</span>
    <asp:DropDownList ID="ddSubject" runat="server" AutoPostBack="true">
         <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
         <asp:ListItem Value="Animal Management" Text="Animal Management"></asp:ListItem>
         <asp:ListItem Value="Agriculture" Text="Agriculture"></asp:ListItem>
         <asp:ListItem Value="Engineering" Text="Engineering"></asp:ListItem>
         <asp:ListItem Value="Equine" Text="Equine"></asp:ListItem>
         <asp:ListItem Value="Floristry" Text="Floristry"></asp:ListItem>
         <asp:ListItem Value="Forestry and Arboriculture" Text="Forestry and Arboriculture"></asp:ListItem>
         <asp:ListItem Value="Foundation Learning" Text=" Foundation Learning"></asp:ListItem>
         <asp:ListItem Value="Horticulture" Text="Horticulture"></asp:ListItem>
         <asp:ListItem Value="Land and Wildlife" Text="Land and Wildlife"></asp:ListItem>
         <asp:ListItem Value="Motorsport" Text="Motorsport"></asp:ListItem>
         <asp:ListItem Value="Sport And Public Services" Text="Sport And Public Services"></asp:ListItem>
         <asp:ListItem Value="The Royal Horticultural Society" Text="The Royal Horticultural Society"></asp:ListItem>
         <asp:ListItem Value="Veterinary Nursing" Text="Veterinary Nursing"></asp:ListItem>
    </asp:DropDownList>
    </div>
          

       <script>

           $(document).ready(function () {
               //surname visibility
               $('.Course').hide();
           // alert($("#<%= ddSubject.ClientID %>"));
            // Hide or Show Surname
            if ($("#<%=ddSubject.ClientID%>").val() != "") {
                $(".Course").show();
            }
            else {
                $(".Course").hide();
            }

            $('#<%= ddSubject.ClientID %>').change(function () {
                if ($("#<%=ddSubject.ClientID%>").val() !="") {

                    $(".Course").slideDown();
                }
                else {
                    $(".Course").slideUp();
                    $("#<%=ddCourse.ClientID%>").val("");
                }

            });
        });


       </script>
     <div class="Course">
    <span class="textfieldlabelrequired">Please select your level and course</span>
    <asp:DropDownList ID="ddCourse" runat="server">
         <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
     </asp:DropDownList>
             
          </div>
  
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
     
 <br />    
     <br />
     <br />

     
     <asp:Button ID="getstarted" runat="server" CssClass="button secondary" Text="Lets Get Started" />

<hr />
     <br />
     <br />





 </div>







   <br />



 

    
