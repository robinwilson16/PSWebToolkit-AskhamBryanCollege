'Option Explicit Off
'Option Strict Off
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

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
            liEmergency.Visible = False
        End If

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
            divReferences.Visible = False
        End If

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
            divEmployedUnemployed.Visible = False
        End If

        Session("RequestMode") = RequestMode.ApplicationRequest

        If Not IsPostBack Then

            If WorkingData.ApplicationRequestRow.ApplicationUserDefined14 <> "" Then
                ddEmployed.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined14
            End If

            If WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn <> "" Then
                EmpPostcode.Value = WorkingData.ApplicationRequestRow.EmployerAddressPostcodeOut & " " & WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn
            End If
            If WorkingData.EnrolmentRequestRow.StudyElsewhere = True Then
                ddStudyElsewhere.SelectedValue = "1"
            End If
            PopulateOfferingFeeTable()
        Else

            Page.MaintainScrollPositionOnPostBack = True
            Dim pcode As String = Replace(EmpPostcode.Value, " ", "")
            If Len(pcode) > 0 Then

                Try
                    WorkingData.ApplicationRequestRow.EmployerAddressPostcodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.ApplicationRequestRow.EmployerAddressPostcodeOut = ""
                End Try

                Try
                    WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn = ""
                End Try

                EmpPostcode.Value = WorkingData.ApplicationRequestRow.EmployerAddressPostcodeOut & " " & WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn

            End If

            If WorkingData.ApplicationRequestRow.ApplicationUserDefined3 <> "" Then
                txtSchoolTraining.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined3
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined8 <> "" Then
                txtHeadMentor.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined8
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined9 <> "" Then
                txtAddress1.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined9
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined10 <> "" Then
                txtAddress1.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined10
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined11 <> "" Then
                txtAddress3.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined11
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined12 <> "" Then
                txtAddress4.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined12
            End If
            If WorkingData.ApplicationRequestRow.ApplicationUserDefined13 <> "" Then
                txtPostcode.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined13
            End If

            If WorkingData.ApplicationRequestRow.ApplicationUserDefined15 <> "" Then
                txtTutorName.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined15
            End If

            If WorkingData.ApplicationRequestRow.ApplicationUserDefined16 <> "" Then
                txtCourse.Value = WorkingData.ApplicationRequestRow.ApplicationUserDefined16
            End If

            'PutAllOfferingsInBasket()


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
            Response.Write("a")

        Next
        If stb.Length > 0 Then
            'Load offerings
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

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

        'If intCurrentQuals = 0 AndAlso tblQuals.Visible = True Then
        '    Dim v As New CustomValidator
        '    v.IsValid = False
        '    v.ErrorMessage = "Please add your qualifications"
        '    Me.Page.Validators.Add(v)
        '    tblQuals.Style.Add("border:", "1 px solid red;")
        'End If

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 = "" And ddEmployed.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Are you currently in employment? must not be blank"
            Me.Page.Validators.Add(a)
            ddEmployed.Style.Add("border", "1px solid red")
        End If

        'If ddEmployed.SelectedValue = "10" And WorkingData.EnrolmentRequestRow.EmployerName = "" Or WorkingData.EnrolmentRequestRow.EmployerAddress1 = "" Or EmpPostcode.Value = "" Then
        '    Dim a As New CustomValidator
        '    a.IsValid = False
        '    a.ErrorMessage = "Employer's company name, Address line 1, Postcode must not be blank"
        '    Me.Page.Validators.Add(a)
        'End If

        If ddStudyElsewhere.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Are you currently in education or training? must not be blank"
            Me.Page.Validators.Add(a)
            ddStudyElsewhere.Style.Add("border", "1px solid red")
        End If

        MyBase.ValidateControl()
    End Sub

    Public Property intCurrentQuals() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intQualRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intQualRows") = value
        End Set
    End Property

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        Dim rowH As New TableRow

        Dim c1, c2, c3, c4, c5 As New TableCell
        c1.Text = "Level/award"
        c1.Attributes.Add("class", "text=center")
        c2.Text = "Subject"
        c3.Text = "Actual Grade"
        c4.Text = "Predicted Grade"
        c5.Text = "Date Awarded"
        rowH.Cells.AddRange({c1, c2, c3, c4, c5})

        tblQuals.Rows.Add(rowH)

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentQuals += 1
                ElseIf btn.ID = "btnNoPriorQualifications" Then
                    intCurrentQuals = 0
                    WorkingData.EnrolmentRequestQualsOnEntry.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No prior qualifications"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add prior qualifications"
                        btn.ToolTip = "Click to show a list below that you can add Qualifications to"
                    End If
                End If
            End If
        End If

        If slidingdiv.Visible Then

            For i = 0 To intCurrentQuals
                Dim row As New TableRow
                Dim cell1, cell2, cell3, cell4, cell5 As New TableCell
                Dim ctl1, ctl2, ctl3, ctl4, ctl5 As New StudentQualsOnEntryField

                ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
                ctl1.StudentQualsOnEntryRowNumber = i
                ctl1.LabelWidth = 0
                cell1.Controls.Add(ctl1)

                ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
                ctl2.StudentQualsOnEntryRowNumber = i
                ctl2.LabelWidth = 0
                cell2.Controls.Add(ctl2)

                ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
                ctl3.StudentQualsOnEntryRowNumber = i
                ctl3.LabelWidth = 0
                'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
                cell3.Controls.Add(ctl3)

                ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
                ctl4.StudentQualsOnEntryRowNumber = i
                ctl4.LabelWidth = 0
                cell4.Controls.Add(ctl4)

                ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
                ctl5.StudentQualsOnEntryRowNumber = i
                ctl5.LabelWidth = 0
                ctl5.CustomFieldType = CCCFieldType.Date
                cell5.Controls.Add(ctl5)

                row.Cells.AddRange({cell1, cell2, cell3, cell4, cell5})
                tblQuals.Rows.Add(row)

            Next
        End If

    End Sub

    Public Property intCurrentReferences() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intQualRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intQualRows") = value
        End Set
    End Property

    Private Sub CheckData()

        WorkingData.ApplicationRequestRow.ApplicationUserDefined14 = ddEmployed.SelectedValue
        WorkingData.ApplicationRequestRow.EmployerName = txtEmployerName.Value
        WorkingData.ApplicationRequestRow.EmployerAddress1 = txtEmpAddress1.Value
        WorkingData.ApplicationRequestRow.EmployerAddress2 = txtEmpAddress2.Value
        WorkingData.ApplicationRequestRow.EmployerAddress3 = txtEmpAddress3.Value
        WorkingData.ApplicationRequestRow.EmployerAddress4 = txtEmpAddress4.Value

        Dim pcode As String = Replace(EmpPostcode.Value, " ", "")
        Response.Write(pcode)
        If Len(pcode) > 0 Then

            'avoid dodgy postcodes breaking system
            Try
                WorkingData.ApplicationRequestRow.EmployerAddressPostcodeOut = pcode.Substring(0, pcode.Length - 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.ApplicationRequestRow.EmployerAddressPostcodeOut = ""
            End Try

            Try
                WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn = Right(pcode, 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.ApplicationRequestRow.EmployerAddressPostcodeIn = ""
            End Try

        End If

        WorkingData.EnrolmentRequestRow.StudyElsewhere = ddStudyElsewhere.SelectedValue
        WorkingData.ApplicationRequestRow.ApplicationUserDefined3 = txtSchoolTraining.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined8 = txtHeadMentor.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined9 = txtAddress1.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined10 = txtAddress2.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined11 = txtAddress3.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined12 = txtAddress4.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined13 = txtPostcode.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined15 = txtTutorName.Value
        WorkingData.ApplicationRequestRow.ApplicationUserDefined16 = txtCourse.Value


    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then

            CheckData()

            redirectString = GetResourceValue("checkout_directapply4_HEapp_aspx")
            Response.Redirect(redirectString)

        End If

    End Sub

    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click

        Dim redirectString As String = String.Empty

        redirectString = GetResourceValue("checkout_directapply2_HEapp_aspx")
            Response.Redirect(redirectString)

    End Sub

End Class
