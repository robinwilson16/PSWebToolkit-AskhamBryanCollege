<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="courseenrol.ascx.vb" Inherits="courseenrol"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

        <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->
    <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" />
    
<%If Not Course Is Nothing Then %>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-arrow p-0">
            <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
            <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/additional/1618/courseenrol.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
            <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline">Courses</span></a></li>
            <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-graduation-cap"></i> <%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></li>
        </ol>
    </nav>

    <div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 10%">10%</div>
    </div>

    <div class="bd-callout bd-callout-askham bd-callout-grey">
        <h4><i class="fa-solid fa-graduation-cap"></i> Course Information</h4>

<%--        <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered text-left"
                DataKeyNames="OfferingID">

                <Columns>
                    <asp:BoundField DataField="CourseInformation" HeaderText="Course Name" >
                        <ControlStyle CssClass="searchgridfield" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Code" HeaderText="Course Code">
                        <ControlStyle CssClass="searchgridfield" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StartDate" DataFormatString="{0:dd MMM yyyy}" HeaderText="Start Date"
                        HtmlEncode="False">
                        <ControlStyle CssClass="searchgridfield" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EndDate" DataFormatString="{0:dd MMM yyyy}" HeaderText="End Date"
                        HtmlEncode="False">
                        <ControlStyle CssClass="searchgridfield" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SiteDescription" HeaderText="Campus" />
                    <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="false">
                        <ControlStyle CssClass="searchgridfield" />
                    </asp:BoundField>
                </Columns>
                <RowStyle CssClass="searchgridcell" />
                <EmptyDataTemplate>
                    <p>
                        No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                            another course.
                    </p>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>--%>

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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <%Next%>
        </div>
    </div>

    <div class="bd-callout bd-callout-warning">
        <h5 class="mb-4">
            <kbd>16-18 Form</kbd> Before you begin please have with you:
        </h5>

        <ul class="list-group">
            <li class="list-group-item icon listcheck"> Your address details, mobile number and a personal email address</li>
            <li class="list-group-item icon listcheck"> Your parent, guardian or carer emergency contact details</li>
            <li class="list-group-item icon listcheck"> If you have any English or Maths qualifications, their grades</li>
        </ul>
    </div>

    <div class="alert alert-primary hstack gap-3" role="alert">
        <div>
            <i class="fa-solid fa-circle-info"></i>
        </div>
        <div>
            <p>
                Remember to click the <strong>Submit button at the end of the form</strong>, otherwise we will not receive your enrolment
            </p>
            <p>
                Submitting this form does not guarantee you a place, it is subject to validation by the college
            </p>
        </div>
    </div>

    <div class="alert alert-warning-askham hstack gap-3" role="alert">
        <div>
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>
        <div>
            <p>
                This session will remain active for 40 minutes before it expires - you will have to start again if the session expires
            </p>
        </div>
    </div>

    <div class="alert alert-light" role="alert">
        <div class="row gap-3">
            <div class="col-md">
        
            </div>
            <div class="col-md text-end">
                <span class="d-grid gap-2 d-md-block">
                    <button type="button" class="btn btn-primary btn-lg NextButton">Next </button>
                    <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue to Checkout" ImageResource="btnContinue" LinkResource="checkout_enrolments_1618_aspx" CausesValidation="true" />
                </span>
            </div>
        </div>
    </div>

<%--<cc1:CCCButton ID="btnContinue6" runat="server" Text="Start " CssClass="button" LinkResource="checkout_enrolments_1618_aspx" />--%>

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