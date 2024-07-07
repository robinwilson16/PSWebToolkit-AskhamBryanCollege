Option Explicit On
Option Strict On

Imports System.IO
Imports System.Net
'Imports System.Text.Json
Imports Newtonsoft.Json
Imports System.Web.Script.Serialization
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports System.Text.Json.Nodes
Imports System.Collections.Generic
Imports System.Windows.Forms

Partial Class courseapply
    Inherits webenrolmentcontrolvalidate

    Public OfferingRow As OfferingRow
    Public CourseInformationDescription As String
    Public LearningAimTitle As String
    Public CourseFee As OfferingFeeRow
    Public CollegeLevel As CollegeLevelRow
    Public ShowTeamList As Boolean = False
    Public ShowCourseList As Boolean = False
    'Public LearningAim As Learning_AimDataTable
    'Public LearningAimRow As Learning_AimRow
    Public HasFormErrors As Boolean = False

    Public Teams As IList(Of Team)
    Public Team As Team
    Public Courses As IList(Of Course)
    Public Course As Course
    Public Search As String
    Public CourseAction As String

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        'Clear anything else from car first before adding new courses
        WorkingData.ClearCart()

        CourseAction = "Apply"

        Search = Request.QueryString("Search")
        If Not IsPostBack Then
            If Len(Search) > 0 Then
                SearchDept1.Value = Search
                SearchDept2.Value = Search
            End If
        End If

        If OfferingID() > 0 Then
            OfferingRow = OfferingDataTable.FetchByOfferingID(OfferingID())
            'CourseInformationDescription = CourseInformationDataTableAdapter.GetCourseInformationDescription(CInt(OfferingRow.CourseInformationID))

            'Everything learning aim related is broken due to LEARN_AIM_REF Not Being in Dataset
            'LearningAimTitle = Learning_AimDataTableAdapter.LoadDataSource_LearningAim(OfferingRow.QualID).GetLearningAimTitle(OfferingRow.QualID)

            If Not IsNothing(OfferingRow) Then
                CourseFee = OfferingFeeDataTableAdapter.GetOfferingFeeRow(CInt(OfferingRow.OfferingID), 1, 0)
            Else
                CourseFee = Nothing
            End If

            'Another bug where aim title is not available in toolkit so get from other system
            Try
                Course = GetProSolutionData.GetCourseByCode(OfferingRow.Code)
            Catch ex As Exception

            End Try

        ElseIf Len(Search) > 0 Then
            ShowCourseList = True

            Teams = GetProSolutionData.GetTeams()
            If Not String.IsNullOrEmpty(TeamCode) Then
                If CourseAction = "Enquire" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnquire(TeamCode, Search)
                ElseIf CourseAction = "Apply" Then
                    Courses = GetProSolutionData.GetCoursesSearchApply(TeamCode, Search)
                ElseIf CourseAction = "Enrol" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnrol(TeamCode, Search)
                Else
                    Courses = GetProSolutionData.GetCoursesSearchApply(TeamCode, Search)
                End If
            Else
                If CourseAction = "Enquire" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnquire(Search)
                ElseIf CourseAction = "Apply" Then
                    Courses = GetProSolutionData.GetCoursesSearchApply(Search)
                ElseIf CourseAction = "Enrol" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnrol(Search)
                Else
                    Courses = GetProSolutionData.GetCoursesSearchApply(Search)
                End If
            End If

        ElseIf String.IsNullOrEmpty(TeamCode) Then
            ShowTeamList = True

            'Code that does not work in Web Toolkit that should return course list
            'AllCourses = OfferingDataTable.SearchForOfferings("24/25", "", "", "", "", "", "", "", "2", "", "", "")

            If CourseAction = "Enquire" Then
                Teams = GetProSolutionData.GetTeamsEnquire()
            ElseIf CourseAction = "Apply" Then
                Teams = GetProSolutionData.GetTeamsApply()
            ElseIf CourseAction = "Enrol" Then
                Teams = GetProSolutionData.GetTeamsEnrol()
            Else
                Teams = GetProSolutionData.GetTeamsApply()
            End If
        Else
            ShowCourseList = True

            If Not (String.IsNullOrEmpty(TeamCode)) Then
                Team = GetProSolutionData.GetTeamByCode(TeamCode)

                If CourseAction = "Enquire" Then
                    Courses = GetProSolutionData.GetCoursesEnquire(TeamCode)
                ElseIf CourseAction = "Apply" Then
                    Courses = GetProSolutionData.GetCoursesApply(TeamCode)
                ElseIf CourseAction = "Enrol" Then
                    Courses = GetProSolutionData.GetCoursesEnrol(TeamCode)
                Else
                    Courses = GetProSolutionData.GetCoursesApply(TeamCode)
                End If
            Else
                If CourseAction = "Enquire" Then
                    Teams = GetProSolutionData.GetTeamsEnquire()
                    Courses = GetProSolutionData.GetCoursesEnquire()
                ElseIf CourseAction = "Apply" Then
                    Teams = GetProSolutionData.GetTeamsApply()
                    Courses = GetProSolutionData.GetCoursesApply()
                ElseIf CourseAction = "Enrol" Then
                    Teams = GetProSolutionData.GetTeamsEnrol()
                    Courses = GetProSolutionData.GetCoursesEnrol()
                Else
                    Teams = GetProSolutionData.GetTeamsApply()
                    Courses = GetProSolutionData.GetCoursesApply()
                End If
            End If
        End If

        RepeaterTeams.DataSource = Teams
        RepeaterTeams.DataBind()

        RepeaterCourses.DataSource = Courses
        RepeaterCourses.DataBind()

        'LearningAim = Learning_AimDataTableAdapter.LoadDataSource_LearningAim(Course.QualID)
        'LearningAimRow = LearningAim.FindByLEARNING_AIM_REF(Course.QualID)
    End Sub

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property

    Public ReadOnly Property TeamCode() As String
        Get
            Return Me.Page.Request("Dept")
        End Get
    End Property

    Protected Overrides Sub OnPreRender(e As EventArgs)
        MyBase.OnPreRender(e)

        ' Response.Redirect(GetResourceValue("checkout_applications_aspx"))
    End Sub

    Public Sub SearchButton_Click(sender As Object, e As System.EventArgs) _
        Handles SearchButton1.Click, SearchButton2.Click

        'Dim resource = Global.Resources.Resource.courseapply_abc
        Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim url As String = ""

        Dim btn As LinkButton = CType(sender, LinkButton)

        If btn.ID = "SearchButton1" Then
            If Len(SearchDept1.Value) > 0 Then
                url = resource & "&Search=" & SearchDept1.Value
            Else
                url = resource
            End If
        ElseIf btn.ID = "SearchButton2" Then
            If Len(SearchDept2.Value) > 0 Then
                url = resource & "&Search=" & SearchDept2.Value
            Else
                url = resource
            End If
        Else
            url = resource
        End If

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub

    Public Sub NoCoursesFoundButton_Click(sender As Object, e As System.EventArgs) _
        Handles NoCoursesFoundButton.ServerClick

        'Dim resource = Global.Resources.Resource.courseapply_abc
        'Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim resource = HttpContext.Current.Request.Url.AbsolutePath

        'Remove query string element in case already in URL
        Dim queryString = HttpUtility.ParseQueryString(HttpContext.Current.Request.Url.Query)
        queryString.Remove("Search")
        queryString.Remove("Dept")

        Dim url As String = ""

        url = resource & "?" & queryString.ToString()

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub

    Public Sub Team_Click(sender As Object, e As System.EventArgs)

        Dim btn As LinkButton = DirectCast(sender, LinkButton)

        'Dim resource = Global.Resources.Resource.courseapply_abc
        'Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim resource = HttpContext.Current.Request.Url.AbsolutePath

        'Remove query string element in case already in URL
        Dim queryString = HttpUtility.ParseQueryString(HttpContext.Current.Request.Url.Query)
        queryString.Remove("Dept")

        Dim url As String = ""

        url = resource & "?" & queryString.ToString()

        If Not IsNothing(btn.CommandArgument) Then
            url += "&Dept=" & btn.CommandArgument.ToString()
        End If

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub

    Public Sub Course_Click(sender As Object, e As System.EventArgs)

        Dim btn As LinkButton = DirectCast(sender, LinkButton)

        'Dim resource = Global.Resources.Resource.courseapply_abc
        'Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim resource = HttpContext.Current.Request.Url.AbsolutePath

        'Remove query string element in case already in URL
        Dim queryString = HttpUtility.ParseQueryString(HttpContext.Current.Request.Url.Query)
        queryString.Remove("OfferingID")

        Dim url As String = ""

        url = resource & "?" & queryString.ToString()

        If Not IsNothing(btn.CommandArgument) Then
            url += "&OfferingID=" & btn.CommandArgument.ToString()
        End If

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub
End Class
