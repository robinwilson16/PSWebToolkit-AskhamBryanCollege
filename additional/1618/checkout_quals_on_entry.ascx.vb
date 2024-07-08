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

        'Populate an all grades table and a GCSE grade table so these can be switched between depending on the subject chosen
        Dim gradeDataTable As New GradeDataTable
        Dim gradeDataView As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(gradeDataTable)
        gradeDataView.Columns.AddDBColumns(True, False)
        gradeDataView.Filters.SetColumnFilter(gradeDataTable.GradeDescriptionColumn, "%", FilterOperator.OperatorLike)
        gradeDataTable.TableAdapter.Load(gradeDataTable, gradeDataView)
        GradeList.Items.Clear()
        GradeList.DataSource = gradeDataTable
        GradeList.DataTextField = "GradeDescription"
        GradeList.DataValueField = "Grade"
        GradeList.DataSourceID = String.Empty
        GradeList.DataBind()
        GradeList.Items.Insert(0, New ListItem("Please Select", String.Empty, False))

        Dim gcseGradeDataTable As New GradeDataTable
        Dim gcseGradeDataView As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(gcseGradeDataTable)
        gcseGradeDataView.Columns.AddDBColumns(True, False)
        gcseGradeDataView.Filters.SetColumnFilter(gcseGradeDataTable.GradeDescriptionColumn, "%Grade%", FilterOperator.OperatorLike)
        gcseGradeDataTable.TableAdapter.Load(gcseGradeDataTable, gcseGradeDataView)
        GradeListGCSE.Items.Clear()
        GradeListGCSE.DataSource = gcseGradeDataTable
        GradeListGCSE.DataTextField = "GradeDescription"
        GradeListGCSE.DataValueField = "Grade"
        GradeListGCSE.DataSourceID = String.Empty
        GradeListGCSE.DataBind()
        GradeListGCSE.Items.Insert(0, New ListItem("Please Select", String.Empty, False))
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)


        MyBase.RenderControl(writer)

    End Sub

    Public Overrides Sub ValidateControl()

        'Prior Attainment Level
        If Not IsNothing(fldPriorAttainmentLevelID) Then
            If String.IsNullOrEmpty(fldPriorAttainmentLevelID.Value) Then
                fldPriorAttainmentLevelIDValidator.ErrorMessage = "Prior Attainment Level must not be blank"
                fldPriorAttainmentLevelIDValidator.IsValid = False
                fldPriorAttainmentLevelIDValidator.CssClass = "error alert alert-danger"
                fldPriorAttainmentLevelID.CssClass = "ErrorInput"
            End If
        End If

        Dim rowCount As Integer = 0

        Dim availableQualsDataTable As New QualsOnEntryAvailableQualsDataTable
        Dim availableQualsDataView As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(availableQualsDataTable)
        availableQualsDataView.Columns.AddDBColumns(True, False)
        availableQualsDataTable.TableAdapter.Load(availableQualsDataTable, availableQualsDataView)


        For Each row As EnrolmentRequestQualsOnEntryRow In WorkingData.EnrolmentRequestQualsOnEntry.Rows
            rowCount += 1
            'row.Cells(0).Controls(0).ToString

            If rowCount >= 1 Then
                Dim qualID As String = row.QualID
                Dim qualIDCustom As String = row.Subject
                Dim grade As String = row.Grade
                Dim predictedGrade As String = row.PredictedGrade

                If String.IsNullOrEmpty(qualID) And String.IsNullOrEmpty(qualIDCustom) And String.IsNullOrEmpty(grade) And String.IsNullOrEmpty(predictedGrade) Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Error on line " + (rowCount).ToString + " as no subject or grade or predicted grade has been entered. Please remove the row or enter the subject and grade."
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                ElseIf Not (String.IsNullOrEmpty(qualID) And String.IsNullOrEmpty(qualIDCustom)) And (String.IsNullOrEmpty(grade) And String.IsNullOrEmpty(predictedGrade)) Then
                    Dim qualTitle = Nothing
                    If Not String.IsNullOrEmpty(qualID) Then
                        qualTitle = availableQualsDataTable.FindByCode(qualID).Title
                    End If

                    Dim v As New CustomValidator
                    v.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Error with " + If(qualTitle, qualIDCustom) + " on line " + (rowCount).ToString + " as a subject has been selected but no grade or predicted grade has been entered. Please remove the subject or enter the grade."
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                ElseIf (String.IsNullOrEmpty(qualID) And String.IsNullOrEmpty(qualIDCustom)) And Not (String.IsNullOrEmpty(grade) And String.IsNullOrEmpty(predictedGrade)) Then
                    If Not String.IsNullOrEmpty(grade) Then
                        Dim v As New CustomValidator
                        v.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Error with " + grade + " on line " + (rowCount).ToString + " as a grade has been entered but a subject has not been selected. Please remove the grade or select the subject."
                        v.IsValid = False
                        Me.Page.Validators.Add(v)
                    Else
                        Dim v As New CustomValidator
                        v.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Error with grade " + predictedGrade + " on line " + (rowCount).ToString + " as a predicted grade has been entered but a subject has not been selected. Please remove the predicted grade or select the subject."
                        v.IsValid = False
                        Me.Page.Validators.Add(v)
                    End If
                End If
            End If
        Next

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

        'Dim rowH As New TableRow

        'Dim c1, c2, c3, c5 As New TableCell
        'c1.Text = "Qualification"
        'c1.Attributes.Add("class", "text=center")
        'c2.Text = "Subject"
        'c3.Text = "Highest Grade Achieved"
        '' c4.Text = "Predicted Grade"
        'c5.Text = "Date Awarded"
        'rowH.Cells.AddRange({c1, c2, c3, c5})

        'tblQuals.Rows.Add(rowH)

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentQuals += 1
                ElseIf btn.ID = "btnNoQualifications" Then
                    intCurrentQuals = 0
                    WorkingData.EnrolmentRequestQualsOnEntry.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No qualifications"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add qualifications"
                        btn.ToolTip = "Click to show a list below that you can add Qualifications to"
                    End If
                End If
            End If
        End If

        If slidingdiv.Visible Then

            For i = 0 To intCurrentQuals
                Dim row As New TableRow
                'Dim qualIDCell, subjectCell, predictedGradeCell, gradeCell, dateAwardedCell As New TableCell
                Dim qualID, subject, grade, predictedGrade, dateAwarded As New StudentQualsOnEntryField

                qualID.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
                qualID.StudentQualsOnEntryRowNumber = i
                qualID.CustomCaption = "Subject"
                'qualID.LabelWidth = 0
                'qualIDCell.Controls.Add(qualID)

                subject.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
                subject.StudentQualsOnEntryRowNumber = i
                subject.CustomCaption = "Subject (if not in list)"
                'subject.LabelWidth = 0
                'subjectCell.Controls.Add(subject)

                predictedGrade.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
                predictedGrade.StudentQualsOnEntryRowNumber = i
                'predictedGrade.LabelWidth = 0
                'predictedGradeCell.Controls.Add(predictedGrade)

                grade.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
                grade.StudentQualsOnEntryRowNumber = i
                'grade.LabelWidth = 0
                'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
                'gradeCell.Controls.Add(grade)

                dateAwarded.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
                dateAwarded.StudentQualsOnEntryRowNumber = i
                'dateAwarded.LabelWidth = 0
                dateAwarded.CustomFieldType = CCCFieldType.Date
                dateAwarded.HTML5InputType = HTML5InputType.date
                'dateAwardedCell.Controls.Add(dateAwarded)

                Dim removeQOEButton As New Button
                removeQOEButton.Text = "X"
                removeQOEButton.CssClass = "btn btn-danger"
                removeQOEButton.CommandArgument = i
                removeQOEButton.CommandName = "RemoveQOEButton"
                removeQOEButton.CausesValidation = False

                AddHandler removeQOEButton.Command, AddressOf RemoveQOEButton_Click

                'row.Cells.AddRange({qualIDCell, subjectCell, predictedGradeCell, gradeCell, dateAwardedCell})
                'tblQuals.Rows.Add(row)

                'New Div Tag For Better Responsiveness
                Dim qoeOuterBox As New HtmlGenericControl("DIV")
                qoeOuterBox.Attributes.Add("class", "col-md-12 mb-4 d-flex align-items-stretch")
                Dim qoeCard As New HtmlGenericControl("DIV")
                qoeCard.Attributes.Add("class", "card w-100")

                Dim qoeEntry As New HtmlGenericControl("DIV")
                qoeEntry.Attributes.Add("class", "card-body d-flex flex-column")

                Dim qoeEntryRow As New HtmlGenericControl("DIV")
                qoeEntryRow.Attributes.Add("class", "row")

                Dim qualIDBox As New HtmlGenericControl("DIV")
                qualIDBox.Attributes.Add("class", "form-group col-md-6 col-xl")
                qualIDBox.Controls.Add(qualID)
                qoeEntryRow.Controls.Add(qualIDBox)

                Dim subjectBox As New HtmlGenericControl("DIV")
                subjectBox.Attributes.Add("class", "form-group col-md-6 col-xl")
                subjectBox.Controls.Add(subject)
                qoeEntryRow.Controls.Add(subjectBox)

                'Dim predictedGradeBox As New HtmlGenericControl("DIV")
                'predictedGradeBox.Attributes.Add("class", "form-group col-md-3 col-xl")
                'predictedGradeBox.Controls.Add(predictedGrade)
                'qoeEntryRow.Controls.Add(predictedGradeBox)

                Dim gradeBox As New HtmlGenericControl("DIV")
                'gradeBox.Attributes.Add("class", "form-group col-md-3 col-xl")
                gradeBox.Attributes.Add("class", "form-group col-md-6 col-xl")
                gradeBox.Controls.Add(grade)
                qoeEntryRow.Controls.Add(gradeBox)

                Dim dateAwardedBox As New HtmlGenericControl("DIV")
                dateAwardedBox.Attributes.Add("class", "form-group col-md-3 col-xl")
                dateAwardedBox.Controls.Add(dateAwarded)
                qoeEntryRow.Controls.Add(dateAwardedBox)

                Dim removeQOEBox As New HtmlGenericControl("DIV")
                removeQOEBox.Attributes.Add("class", "form-group col-md-3 col-xl text-right")
                removeQOEBox.Controls.Add(removeQOEButton)
                qoeEntryRow.Controls.Add(removeQOEBox)

                qoeEntry.Controls.Add(qoeEntryRow)
                qoeCard.Controls.Add(qoeEntry)
                qoeOuterBox.Controls.Add(qoeCard)
                QOEs.Controls.Add(qoeOuterBox)
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

    Sub RemoveQOEButton_Click(sender As Object, e As CommandEventArgs)
        Dim rowToDelete As Integer = CInt(e.CommandArgument)

        Dim rowNumber As Integer = 0
        Dim rowDeleted As Boolean = False

        For Each row As EnrolmentRequestQualsOnEntryRow In WorkingData.EnrolmentRequestQualsOnEntry.Rows
            If rowNumber = rowToDelete Then
                row.Delete()
                rowDeleted = True

                Exit For
            End If

            rowNumber += 1
        Next

        If rowDeleted = True Then
            HttpContext.Current.Session("intQualRows") = intCurrentQuals - 1
        End If

        'Added redirect otherwise session variable was still showing old value
        Response.Redirect(GetResourceValue("checkout_quals_on_entry_1618_aspx"))
    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click
        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then

            redirectString = GetResourceValue("checkout_employment_1618_aspx")
            Response.Redirect(redirectString)

        End If

    End Sub


    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click

        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then

            redirectString = GetResourceValue("checkout_enrolments2_1618_aspx")
            Response.Redirect(redirectString)

        End If

    End Sub

End Class
