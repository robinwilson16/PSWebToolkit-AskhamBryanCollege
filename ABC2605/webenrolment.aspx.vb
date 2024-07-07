Imports CompassCC.ProSolution.PSWebEnrolmentKit

'This page is used to load the web pages that have been converted to ascx user controls.
'The user controls are located in the webcontrols folder of the website
'The user control path to the user control that is to be loaded in added to the page request.
Partial Class webcontrols_webenrolment
    Inherits System.Web.UI.Page

    Dim WithEvents cntl As webenrolmentcontrolvalidate
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Protected Sub webcontrols_webenrolment_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete
        Dim strWebControlurl As String = ResolveUrl(Me.Request("page"))
        cntl = TryCast(Page.LoadControl(strWebControlurl), webenrolmentcontrolvalidate)
        ''cntl.BreadcrumbHolder.PushBreadcrumb(New CCCBreadcrumb("", GetFriendlyNameForControl(strWebControlurl), ResolveUrl(Me.Request("page")), ""))
        PlaceHolder1.Controls.Add(cntl)
    End Sub

    Public Overrides Sub Validate()
        MyBase.Validate()
    If cntl IsNot Nothing Then cntl.ValidateControl()
End Sub
    Private Sub webcontrols_webenrolment_Init(sender As Object, e As EventArgs) Handles Me.Init
        CheckXSRF(sender, e)
    End Sub
    ''' <summary>
    ''' CCCPS-78458 Check XSRF token for the active session and reject other requests
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Private Sub CheckXSRF(sender As Object, e As EventArgs)
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid
        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue
            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With {.HttpOnly = True, .Value = _antiXsrfTokenValue}

            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If
        Call master_Page_PreLoad(sender, e)
    End Sub
    ''' <summary>
    ''' CCCPS-78458 Reject request if session is not valid
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    Protected Sub master_Page_PreLoad(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack Then
            Session(AntiXsrfTokenKey) = Page.ViewStateUserKey
            Session(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, String.Empty)
        Else
            If CStr(Session(AntiXsrfTokenKey)) <> _antiXsrfTokenValue OrElse CStr(Session(AntiXsrfUserNameKey)) <> (If(Context.User.Identity.Name, String.Empty)) Then
                Throw New InvalidOperationException("Validation of " & "Anti-XSRF token failed.")
            End If
        End If

    End Sub

    ''Private Function GetFriendlyNameForControl(s As String) As String
    ''    Dim name As String = ""
    ''    Dim i As Integer = s.LastIndexOf("/")
    ''    name = s.Substring(i + 1, s.IndexOf(".ascx", i + 1) - i - 1)
    ''    name = name.Replace("_", " ")
    ''    name = name.Replace("checkout", "")
    ''    name = StrConv(name, VbStrConv.ProperCase)
    ''    Return name
    ''End Function
End Class
