<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_enrolFC.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<%If Not Course Is Nothing Then %>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-arrow p-0">
            <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
            <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
            <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/FC/courseenrol.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline"><%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></span></a></li>
            <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-user"></i> Personal Details</li>
        </ol>
    </nav>

    <div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 10%">10%</div>
    </div>

    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-graduation-cap"></i> Course Information</h4>

        <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
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
        </asp:GridView>--%>


                    <div class="container">
            <%For Each crs In tblOffering %>
                <%
'Dim OfferingRow = OfferingDataTable.FetchByOfferingID(crs.OfferingID)
                %>
                <div class="row">
                    <div class="col-md">
                        <div class="card mt-3">
                            <div class="card-body">
                                <h4><i class="fa-solid fa-award"></i> <%=crs.Name%></h4>
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Start Date:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.StartDate)), crs.StartDate.Value.ToString("dd/MM/yyyy"), "")%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>End Date:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.EndDate)), crs.EndDate.Value.ToString("dd/MM/yyyy"), "")%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Course Code:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=crs.Code%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Campus:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=crs.SiteDescription%>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <strong>Total Fees:</strong>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <%=If(Not (IsNothing(crs.TotalFeeAmount)), crs.TotalFeeAmount.Value.ToString("C0"), "")%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%Next%>
        </div>
    </div>



    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-user"></i> Personal Details</h4>

        <p><strong>Please note that all fields on this form marked with a <span class="textfieldlabelrequired"></span> must be completed in order to submit the form.</strong></p>

        <p><i><strong>Please give your full legal name.</strong></i></p>
    
        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="fldTitle" runat="server" IsRequired="true" LabelWidth="300" ClientIDMode="Static" />
            <asp:CustomValidator ID="fldTitleValidator" runat="server"></asp:CustomValidator>
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Forenames or given name" />
        </div>
    

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="knownas" ID="StudentEnrolmentField2" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Preferred or familiar name (if different)" />
        </div>

        <%--<div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="OtherForenames" ID="StudentEnrolmentField11" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Middle Name(s)" />
        </div>--%>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="StudentEnrolmentField10" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname or family name" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="SurnameAtBirth" ID="StudentEnrolmentField4" runat="server" IsRequired="false" LabelWidth="300" CustomCaption="Previous surname or family name" />
        </div>

        <div class=" form-group">
            <cc1:StudentEnrolmentField ID="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth" CustomCaption ="Date of Birth" LabelWidth="300" ClientIDMode="Static" Placeholder="dd/mm/yyyy" HTML5InputType="date" />
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField ID="fldGender" runat="server" IsRequired="true" StudentEnrolmentFieldType="Sex" LabelWidth="300" ClientIDMode="Static" CustomCaption="Legal gender"/>  
            <asp:CustomValidator ID="fldGenderValidator" runat="server"></asp:CustomValidator>
        </div>

        <div class="form-input">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="PreferredPronounID" ID="fldPronoun" runat="server" CustomCaption="Preferred Pronoun" IsRequired="true" ClientIDMode="Static" />
        </div>

        <p><i><strong>The Education & Skills Funding Agency requires the College to collect legal gender.</strong></i></p>

    </div>

    <asp:ValidationSummary ID="ValidationSummary" runat="server" CssClass="alert alert-danger" ForeColor="" />

    <div class="alert alert-light" role="alert">
        <div class="row gap-3">
            <div class="col-md">
                <span class="d-grid gap-2 d-md-block">
                    <%If ShowBackButton = True Then %>
                    <button type="button" class="btn btn-primary btn-lg BackButton"> Back</button>
                    <cc1:CCCButton ID="btnBack" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Back" ImageResource="btnBack" CausesValidation="false" />
                    <%End If %>
                </span>
            </div>
            <div class="col-md text-end">
                <span class="d-grid gap-2 d-md-block">
                    <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                    <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue" ImageResource="btnContinue" CausesValidation="true" SaveForLater="true" SaveForLaterIn="Request" />
                </span>
            </div>
        </div>
    </div>

     <%--<cc1:CCCButton ID="btnBack" runat="server" Text="Start Again" LinkResource="checkout_home_aspx" CssClass="button" Visible ="true" />--%> 
        <%--<cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />--%>
  
<% ElseIf ShowTeamList = True Then%>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-arrow p-0">
            <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
            <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-regular fa-folder-open"></i> Departments</li>
        </ol>
    </nav>

    <div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 10%">10%</div>
    </div>

    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-magnifying-glass"></i> Search for a Course</h4>
        <div class="container">
            <div class="row">
                <div class="mb-3">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="SearchDept1" aria-describedby="SearchHelp1" placeholder="Search for a course..." runat="server" ClientIDMode="Static" />
                        <asp:LinkButton class="btn btn-primary SearchButton" type="button" id="SearchButton1" runat="server" ClientIDMode="Static"><i class="fa-solid fa-magnifying-glass"></i> Search</asp:LinkButton>
                    </div>
                    <div id="SearchHelp1" class="form-text">Search above or select an area below</div>
                </div>
            </div>
        </div>
    </div>

    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-building"></i> Select A Department/Area You Wish To Study</h4>
        <div class="container">
            <div class="row">
                <%--<% For Each Team In Teams%>--%>
                <asp:Repeater ID="RepeaterTeams" runat="server" ItemType="Team">
                    <ItemTemplate>
                        <div class="col-sm-6 col-lg-4 col-xl-3 mb-4 d-flex align-items-stretch">
                            <div class="card text-center w-100">
                                <asp:LinkButton ID="TeamImageLink" CommandArgument="<%# DirectCast(Container.DataItem, Team).TeamCode %>" CommandName="TeamClicked" OnClick="Team_Click" title="View courses in <%# DirectCast(Container.DataItem, Team).TeamName %>" runat="server">
                                    <img class="card-img-top" src="/PSWebEnrolment/images/department_icons/<%# DirectCast(Container.DataItem, Team).TeamCode %>.png" alt="Icon for the <%# DirectCast(Container.DataItem, Team).TeamName %> department" />
                                </asp:LinkButton>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title mt-auto"><%# DirectCast(Container.DataItem, Team).TeamName %></h5>
                                    <asp:LinkButton ID="TeamButtonLink" CommandArgument="<%# DirectCast(Container.DataItem, Team).TeamCode %>" CommandName="TeamClicked" OnClick="Team_Click" class="btn btn-primary" title="View courses in <%# DirectCast(Container.DataItem, Team).TeamName %>" runat="server"><i class="fa-solid fa-graduation-cap"></i> View Courses</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <%--<% Next %>--%>
            </div>
        </div>
    </div>

<% ElseIf ShowCourseList = True Then%>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-arrow p-0">
            <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
            <% If Not IsNothing(Team) %>
                <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Team.TeamName %></span></a></li>
            <% End If %>
            <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-book"></i> Courses</li>
        </ol>
    </nav>

    <div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 20%">20%</div>
    </div>

    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-magnifying-glass"></i> Search for a Course</h4>
        <div class="container">
            <div class="row">
                <div class="mb-3">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="SearchDept2" aria-describedby="SearchHelp2" placeholder="Search for a course..." runat="server" ClientIDMode="Static" onkeydown="<%=SearchDept_KeyDown() %>" />
                        <asp:LinkButton class="btn btn-primary SearchButton" type="button" id="SearchButton2" runat="server" ClientIDMode="Static"><i class="fa-solid fa-magnifying-glass"></i> Search</asp:LinkButton>
                    </div>
                    <div id="SearchHelp2" class="form-text">Search above or select an area below</div>
                </div>
            </div>
        </div>
    </div>

    <h3>
        <% If Len(Search) > 0 %>
            Search Results for "<%=Search %>":
        <% Else %>
            Please Pick A Course To Study 
            <% If Not IsNothing(Team)Then %>
                in <%=Team.TeamName %>
            <% End If %>
        <% End If %>
        
    </h3>
    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4>
            <i class="fa-solid fa-graduation-cap"></i> Available Courses To Study 
            <% If Not IsNothing(Team) %>
                in <%=Team.TeamName %>
            <% End If %>
        </h4>
        <div class="container">
            <div class="row">
                <% If Courses.Count = 0 %>
                    <div class="col-sm-1">
                        <h3><i class="fa-solid fa-triangle-exclamation"></i></h3>
                    </div>
                    <div class="col-sm-11">
                        <h4 class="alert-heading">No Courses Found Matching "<%=Search %>"</h4>
                        <p>Sorry no couses were found matching your selection</p>
                        <p>Please refine your search above or go to the full list of available courses</p>
                        <p class="text-center"><a class="btn btn-danger" ID="NoCoursesFoundButton" role="button" runat="server"><i class="fa-solid fa-rotate-left"></i> Return to the Full Course List</a></p>
                        <hr>
                        <p class="mb-0">Contact the Admissions Team on <i class="fa-solid fa-phone"></i> <a href="tel:01904 772277">01904 772277</a> or by email at <i class="fa-solid fa-envelope"></i> <a href="mailto:enquiries@askham-bryan.ac.uk?subject=Course Not Found on Website">enquiries@askham-bryan.ac.uk</a></p>
                    </div>
                <% Else %>
                    <%--<% For Each Course In Courses%>--%>
                    <asp:Repeater ID="RepeaterCourses" runat="server" ItemType="Course">
                        <ItemTemplate>
                            <div class="col-lg-6 col-xl-4 mb-4 d-flex align-items-stretch">
                                <div class="card w-100">
                                    <div class="card-body d-flex flex-column CourseDetails">
                                        <div class="text-end position-absolute top-0 end-0 CourseIcon">
                                            <img class="img-fluid" src="/PSWebEnrolment/images/department_icons/<%# DirectCast(Container.DataItem, Course).TeamCode %>.png" alt="Icon for the <%# DirectCast(Container.DataItem, Course).TeamName %> department" />
                                        </div>
        
                                        <asp:LinkButton ID="CourseTitleLink" CommandArgument="<%# DirectCast(Container.DataItem, Course).CourseID %>" CommandName="CourseClicked" OnClick="Course_Click" title="Apply for <%# DirectCast(Container.DataItem, Course).CourseTitle %>" runat="server">
                                            <h5 class="CourseTitle"><%# DirectCast(Container.DataItem, Course).CourseInformationTitle %></h5>
                                        </asp:LinkButton>
                                        <p class="mt-auto"><strong>Start Date:</strong> <%# Convert.ToDateTime(DirectCast(Container.DataItem, Course).StartDate).ToString("dd MMM yyyy") %></p>
                                        <%--<p><strong>Suitable For:</strong> <kbd><%=Course.SuitableFor %></kbd></p>--%>
                                        <p><span class="Site <%# DirectCast(Container.DataItem, Course).SiteName %>"><%# DirectCast(Container.DataItem, Course).SiteName %></span></p>
                                        <div class="text-center">
                                            <asp:LinkButton class="btn btn-primary" ID="CourseButtonLink" CommandArgument="<%# DirectCast(Container.DataItem, Course).CourseID %>" CommandName="CourseClicked" OnClick="Course_Click" title="Apply for <%# DirectCast(Container.DataItem, Course).CourseTitle %>" runat="server"><i class="fa-solid fa-graduation-cap"></i> Apply Now</asp:LinkButton>
                                        </div>
        
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--<% Next %>--%>
                <% End If %>
            </div>
        </div>
    </div>

<% Else %>
    <div class="alert alert-danger" role="alert">
        <div class="row">
            <div class="col-sm-1">
                <h3><i class="fa-solid fa-triangle-exclamation"></i></h3>
            </div>
            <div class="col-sm-11">
                <h4 class="alert-heading">Course Not Found</h4>
                <p>Sorry this course was not found or is not set up for applications</p>
                <p class="text-center"><a class="btn btn-danger" href="https://www.askham-bryan.ac.uk/" role="button"><i class="fa-solid fa-rotate-left"></i> Return to the Askham-Bryan College Website</a></p>
                <hr>
                <p class="mb-0">Contact the Admissions Team on <i class="fa-solid fa-phone"></i> <a href="tel:01904 772277">01904 772277</a> or by email at <i class="fa-solid fa-envelope"></i> <a href="mailto:enquiries@askham-bryan.ac.uk?subject=Course Not Found on Website">enquiries@askham-bryan.ac.uk</a></p>
            </div>
        </div>
    </div>
<% End If %>

<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        //Provide better descriptions for Sex fields
        let fldSex = document.getElementById("cboSex");
        fldSex.options[1].textContent = "Female";
        fldSex.options[2].textContent = "Male";
        let fldSexInputBox = addSearchableDropDown(fldSex);

        let fldTitleInputBox = addSearchableDropDown(cboTitle);
    });
</script>