<%@ control Language="VB"  AutoEventWireup="false" CodeFile="courseapply.ascx.vb" Inherits="courseapply"  %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

    <!--The CourseApplyAction adds the offering to the basket as an application-->
    <cc1:CourseApplyAction ID="CourseApplyAction" runat="server" />

<%If Not Course Is Nothing Then %>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-arrow p-0">
            <li class="icon breadcrumb-item"><a href="https://www.askham-bryan.ac.uk/" class="pl-3"><i class="fa-solid fa-house"></i> <span class="d-none d-sm-inline">ABC Home</span></a></li>
                <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&OfferingID=0"><i class="fa-regular fa-folder-open"></i> <span class="d-none d-sm-inline"><%=Course.TeamName %></span></a></li>
                <li class="breadcrumb-item pl-0"><a href="webenrolment.aspx?page=~/apply/courseapply.ascx&Dept=<%=Course.TeamCode %>"><i class="fa-solid fa-book"></i> <span class="d-none d-sm-inline">Courses</span></a></li>
                <li aria-current="page" class="breadcrumb-item pl-0 active pl-4"><i class="fa-solid fa-graduation-cap"></i> <%=Course.CourseCode%> - <%=Course.CourseInformationTitle %></li>
        </ol>
    </nav>

    <div class="progress mb-4" role="progressbar" aria-label="Animated striped example" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">
        <div class="progress-bar progress-bar-striped progress-bar-animated" style="width: 30%">30%</div>
    </div>

    <h3>
        You are applying for the following course:
    </h3>

    <div class="bd-callout bd-callout-askham">
        <h4><i class="fa-solid fa-award"></i> <%=OfferingRow.Code%> - <%=Course.TeamName%> - <%=Course.CourseInformationTitle %></h4>

        <table class="table">
            <thead>
            <tr>
                <th scope="col"><i class="fa-solid fa-calendar-days"></i> Start Date</th>
                <th scope="col"><i class="fa-solid fa-flag-checkered"></i> End Date</th>
                <th scope="col"><i class="fa-solid fa-calendar-day"></i> Age Group</th>
                <th scope="col"><i class="fa-solid fa-sterling-sign"></i> Tuition Fee</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=Convert.ToDateTime(Course.StartDate).ToString("dd/MM/yyyy")%></td>
                    <td><%=Convert.ToDateTime(Course.EndDate).ToString("dd/MM/yyyy")%></td>
                    <td><kbd>16-18</kbd></td>
                    <td><span class="FreeCourse">Free</span></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><kbd>19+</kbd></td>
                    <td>
                        <%If Not IsNothing(CourseFee) Then %>
                            <%If CourseFee.Amount > 0 Then %>
                                <span class="NonFreeCourse"><%=FormatCurrency(CourseFee.Amount, 0)%></span>
                            <%Else %>
                                <span class="FreeCourse">Free</span>
                            <%End If %>
                        <%Else %>
                            <span class="FeeUnknownCourse">TBC</span>
                        <%End If %>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="alert alert-primary hstack gap-3" role="alert">
            <div>
                <i class="fa-solid fa-circle-info"></i>
            </div>
            <div>
                <p>
                    If you are aged 19-23 and have an Educational Health Care Plan you may also be eligible to study this course free of charge. Please ensure you select this option when applying if you have one.
                </p>
            </div>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col"><i class="fa-solid fa-calendar-days"></i> Qualification Code</th>
                <th scope="col"><i class="fa-solid fa-flag-checkered"></i> Qualification Title</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=OfferingRow.QualID%></td>
                    <td><%=Course.AimTitle%></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="bd-callout bd-callout-warning">
        <h5>
            Before you begin please have with you:
        </h5>

        <ul class="list-group">
            <li class="list-group-item icon listcheck"> Your address details, mobile number and a personal email address</li>
            <li class="list-group-item icon listcheck"> Details of your previous qualifications</li>
            <li class="list-group-item icon listcheck"> Information about your parent/carer/emergency contact</li>
            <li class="list-group-item icon listcheck"> A digital passport-style photograph</li>
        </ul>
    </div>

    <div class="alert alert-primary hstack gap-3" role="alert">
        <div>
            <i class="fa-solid fa-circle-info"></i>
        </div>
        <div>
            <p>
                Any payment of fees will occur on completion of enrolment documents.
            </p>
            <p>
                NOTE: We would like to remind you that applying to a course does not nesescarily mean you will get a place.
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
                    <cc1:CCCButton ID="btnContinue" CssClass="d-none" ClientIDMode="Static" runat="server" Text="Continue to Checkout" ImageResource="btnContinue" LinkResource="checkout_applications_abc" CausesValidation="true" />
                </span>
            </div>
        </div>
    </div>
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