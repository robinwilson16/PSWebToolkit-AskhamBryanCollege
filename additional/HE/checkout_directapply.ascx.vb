Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        'Response.Write(WorkingData.ApplicationRequestRow.StudentDetailUserDefined1)
        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
            liEmergency.Visible = False
            StudentEnrolmentFieldRefNo.Visible = True
        End If

        'WorkingData.EnrolmentRequestRow.Title = "Mr"
        'WorkingData.EnrolmentRequestRow.Surname = "test"
        'WorkingData.ApplicationRequestRow.ApplicationTypeID = "1"
        '' WorkingData.ApplicationRequestRow.ApplicationUserDefined2 = "York"
        '' WorkingData.ApplicationRequestRow.ApplicationUserDefined3 = "Hort"
        '' WorkingData.ApplicationRequestRow.PriorAttainmentLevelID = "01"
        'WorkingData.EnrolmentRequestRow.FirstForename = "Test"
        'WorkingData.EnrolmentRequestRow.DateOfBirth = "30/08/2002"
        'WorkingData.EnrolmentRequestRow.Sex = "F"
        'WorkingData.EnrolmentRequestRow.Address1 = "317"
        'WorkingData.EnrolmentRequestRow.Address2 = "Test Road"
        'WorkingData.EnrolmentRequestRow.Address3 = "Test Road"
        'WorkingData.EnrolmentRequestRow.Address4 = "Test Road"
        'WorkingData.EnrolmentRequestRow.PostcodeOut = "EH20"
        'WorkingData.EnrolmentRequestRow.PostcodeIn = "1BF"
        'WorkingData.EnrolmentRequestRow.Email = "a@a.com"
        'WorkingData.EnrolmentRequestRow.MobileTel = "07853318366"
        ''   Response.Write(SQLDBDataReader.GetString(7))


        Session("RequestMode") = RequestMode.ApplicationRequest

        If Not IsPostBack Then

            'PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

            If WorkingData.ApplicationRequestRow.PostcodeIn <> "" Then
                postcode.Value = WorkingData.ApplicationRequestRow.PostcodeOut & " " & WorkingData.ApplicationRequestRow.PostcodeIn

            End If

        Else

            Page.MaintainScrollPositionOnPostBack = True
            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then

                Try
                    WorkingData.ApplicationRequestRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.ApplicationRequestRow.PostcodeOut = ""
                End Try

                Try
                    WorkingData.ApplicationRequestRow.PostcodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.ApplicationRequestRow.PostcodeIn = ""
                End Try

                postcode.Value = WorkingData.ApplicationRequestRow.PostcodeOut & " " & WorkingData.ApplicationRequestRow.PostcodeIn

            End If


        End If


    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)

        MyBase.RenderControl(writer)

    End Sub

    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)


        Next
        If stb.Length > 0 Then
            'Load offerings
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn, tbloffering.CourseInformationColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)
            ' vOffering.Filters.SetColumnFilter(tblOffering.OfferingTypeIdColumn, 2, FilterOperator.OperatorInList)
            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            Me.GridView1.DataSource = tblOffering
            Me.GridView1.DataBind()
            Me.GridView1.Visible = True


        End If
    End Sub

    ''Databind the Grid
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))
        End If
    End Sub

    Public Overrides Sub ValidateControl()

        If Len(postcode.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            postcode.Style.Add("border", "1px solid red")
        End If

        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        Dim match As Match = regexPostCode.Match(postcode.Value)
        If Not match.Success Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter a valid Postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If WorkingData.ApplicationRequestRow.MobileTel = "" And WorkingData.ApplicationRequestRow.Tel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter at least one phone number (Mobile number / Home phone (inc. STD code))."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        MyBase.ValidateControl()
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

    End Sub

    Public Property intCurrentReferences() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intReferenceRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intReferenceRows") = value
        End Set
    End Property

    Private Sub CheckData()

        Dim refDate As Date = "31/08/2023"

        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            ' Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
            'WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)

        End If

        WorkingData.ApplicationRequestRow.Address1 = txtAddress1.Value
        WorkingData.ApplicationRequestRow.Address2 = txtAddress2.Value
        WorkingData.ApplicationRequestRow.Address3 = txtAddress3.Value
        WorkingData.ApplicationRequestRow.Address4 = txtAddress4.Value

        Dim pcode As String = Replace(postcode.Value, " ", "")
        If Len(pcode) > 0 Then

            'avoid dodgy postcodes breaking system
            Try
                WorkingData.EnrolmentRequest(0).PostcodeOut = pcode.Substring(0, pcode.Length - 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.EnrolmentRequest(0).PostcodeOut = ""
            End Try

            Try
                WorkingData.EnrolmentRequest(0).PostcodeIn = Right(pcode, 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.EnrolmentRequest(0).PostcodeIn = ""
            End Try


        End If

    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then

            CheckData()

            If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
                redirectString = GetResourceValue("checkout_directapply5_HEapp_aspx")
                Response.Redirect(redirectString)
            Else
                redirectString = GetResourceValue("checkout_directapply2_HEapp_aspx")
                Response.Redirect(redirectString)
            End If

        End If

    End Sub


End Class
