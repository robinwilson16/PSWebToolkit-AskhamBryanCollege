﻿

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports System.Collections.Generic
Imports System.Linq

Partial Class webcontrols_checkout_enrolments2
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub OnLoad(e As EventArgs)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        'Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined58)
        'If Not Session("agecourse") Is Nothing Then lblAgeCourse.Text = CType("Your age on " & Session("startdate") & ": " & Session("agecourse") & " (" & Session("ageGroup"), String) & ")"

        If Not IsPostBack Then
            If Session("dis") <> "" Then selectLearnDiff.SelectedValue = Session("dis")
        End If

        ' postcode.Value = WorkingD ata.EnrolmentRequestRow.PostcodeOut & WorkingData.EnrolmentRequestRow.PostcodeIn

        If selectLearnDiff.SelectedValue = "1" Then
            slidingdiv.Visible = True
        Else
            intCurrentDisability = 0
            WorkingData.EnrolmentRequestDisabilityCategory.Clear()
            slidingdiv.Visible = False
        End If

        MyBase.OnLoad(e)
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        'If IsPostBack Then

        'Recreate the header row
        'Dim rowH As New TableRow

        'Dim c1, c2 As New TableCell
        'c1.Text = "Learning difficulty, disability or health condition"
        'c1.Attributes.Add("class", "text=center")
        'c2.Text = "Please indicate your primary 'main' condition which could impact on your studies"
        'rowH.Cells.AddRange({c1, c2})

        'tblDisability.Rows.Add(rowH)

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentDisability += 1
                ElseIf btn.ID = "btnNoDisability" Then
                    intCurrentDisability = 0
                    WorkingData.EnrolmentRequestDisabilityCategory.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No learning difficulty, disability or health condition"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add learning difficulty, disability or health condition"
                        btn.ToolTip = "Click to show a list below that you can add Disability to"
                    End If
                End If
            ElseIf c.GetType Is GetType(DropDownList) Then
                Dim dropDown = DirectCast(c, DropDownList)
                If dropDown.ID = "selectLearnDiff" Then
                    If dropDown.SelectedValue = "1" Then
                        slidingdiv.Visible = True
                    Else
                        intCurrentDisability = 0
                        WorkingData.EnrolmentRequestDisabilityCategory.Clear()
                        slidingdiv.Visible = Not slidingdiv.Visible
                    End If
                End If
            End If
        End If

        If slidingdiv.Visible Then

            For i = 0 To intCurrentDisability
                Dim row As New TableRow
                'Dim cell1, cell2 As New TableCell
                Dim disabilityCategoryID, isPrimary As New StudentDisabilityField

                'System Fields
                disabilityCategoryID.StudentDisabilityFieldType = StudentDisabilityFieldType.DisabilityCategoryID
                disabilityCategoryID.StudentDisabilityRowNumber = i
                disabilityCategoryID.CustomCaption = "Difficulty/Disability"
                'disabilityCategoryID.LabelWidth = 0
                'cell1.Controls.Add(disabilityCategoryID)

                isPrimary.StudentDisabilityFieldType = StudentDisabilityFieldType.IsPrimary
                isPrimary.StudentDisabilityRowNumber = i
                isPrimary.CustomCaption = "Primary Support Need"
                'isPrimary.LabelWidth = 0
                'cell2.Controls.Add(isPrimary)

                'HTML Controls
                Dim removeDisabilityButton As New Button
                removeDisabilityButton.Text = "X"
                removeDisabilityButton.CssClass = "btn btn-danger"
                removeDisabilityButton.CommandArgument = i
                removeDisabilityButton.CommandName = "RemoveQOEButton"

                AddHandler removeDisabilityButton.Command, AddressOf RemoveDisabilityButton_Click

                'row.Cells.AddRange({cell1, cell2})
                'row.Controls.Add(removeDisabilityBox)
                'tblDisability.Rows.Add(row)

                'New Div Tag For Better Responsiveness
                Dim disabilityOuterBox As New HtmlGenericControl("DIV")
                disabilityOuterBox.Attributes.Add("class", "col-md-12 mb-4 d-flex align-items-stretch")
                Dim disabilityCard As New HtmlGenericControl("DIV")
                disabilityCard.Attributes.Add("class", "card w-100")

                Dim disabilityEntry As New HtmlGenericControl("DIV")
                disabilityEntry.Attributes.Add("class", "card-body d-flex flex-column")

                Dim disabilityEntryRow As New HtmlGenericControl("DIV")
                disabilityEntryRow.Attributes.Add("class", "row")

                Dim disabilityCategoryIDBox As New HtmlGenericControl("DIV")
                disabilityCategoryIDBox.Attributes.Add("class", "form-group col-md-6 col-xl")
                disabilityCategoryIDBox.Controls.Add(disabilityCategoryID)
                disabilityEntryRow.Controls.Add(disabilityCategoryIDBox)

                Dim isPrimaryBox As New HtmlGenericControl("DIV")
                isPrimaryBox.Attributes.Add("class", "form-group col-md-3 col-xl")
                isPrimaryBox.Controls.Add(isPrimary)
                disabilityEntryRow.Controls.Add(isPrimaryBox)

                Dim removeDisabilityBox As New HtmlGenericControl("DIV")
                removeDisabilityBox.Attributes.Add("class", "form-group col-md-3 col-xl text-right")
                removeDisabilityBox.Controls.Add(removeDisabilityButton)
                disabilityEntryRow.Controls.Add(removeDisabilityBox)

                disabilityEntry.Controls.Add(disabilityEntryRow)
                disabilityCard.Controls.Add(disabilityEntry)
                disabilityOuterBox.Controls.Add(disabilityCard)
                Disabilities.Controls.Add(disabilityOuterBox)
            Next
        End If
    End Sub

    Public Property intCurrentDisability() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intDisabilityRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intDisabilityRows") = value
        End Set
    End Property

    Sub RemoveDisabilityButton_Click(sender As Object, e As CommandEventArgs)
        Dim rowToDelete As Integer = CInt(e.CommandArgument)

        Dim rowNumber As Integer = 0
        Dim rowDeleted As Boolean = False

        For Each row As EnrolmentRequestDisabilityCategoryRow In WorkingData.EnrolmentRequestDisabilityCategory.Rows
            If rowNumber = rowToDelete Then
                row.Delete()
                rowDeleted = True

                Exit For
            End If

            rowNumber += 1
        Next

        If rowDeleted = True Then
            HttpContext.Current.Session("intDisabilityRows") = intCurrentDisability - 1
        End If

        'Added redirect otherwise session variable was still showing old value
        Response.Redirect(GetResourceValue("checkout_enrolments2_HE_aspx"))
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        Session("dis") = selectLearnDiff.SelectedValue

        If Session("dis") <> "" Then WorkingData.EnrolmentRequestRow.LearningDiffOrDisID = Session("dis")

        If Me.Page.IsValid Then

            Response.Redirect(GetResourceValue("checkout_quals_on_entry_HE_aspx"))

        End If

    End Sub
    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click

        ' Me.Page.Validate()

        Session("dis") = selectLearnDiff.SelectedValue
        If Session("dis") <> "" Then WorkingData.EnrolmentRequestRow.LearningDiffOrDisID = Session("dis")

        Response.Redirect(GetResourceValue("checkout_parent_guardian_HE_aspx"))

        'End If

    End Sub

    Public Overrides Sub ValidateControl()

        'Drop-downs that are set as required are not picked up
        If Not IsNothing(fldNationalityID) Then
            If String.IsNullOrEmpty(fldNationalityID.Value) Then
                fldNationalityIDValidator.ErrorMessage = "Nationality must not be blank"
                fldNationalityIDValidator.IsValid = False
                fldNationalityIDValidator.CssClass = "error alert alert-danger"
                fldNationalityID.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(fldCountryID) Then
            If String.IsNullOrEmpty(fldCountryID.Value) Then
                fldCountryIDValidator.ErrorMessage = "Main Country of Residence must not be blank"
                fldCountryIDValidator.IsValid = False
                fldCountryIDValidator.CssClass = "error alert alert-danger"
                fldCountryID.CssClass = "ErrorInput"
            End If
        End If

        'If Not IsNothing(fldEthnicGroupID) Then
        '    If String.IsNullOrEmpty(fldEthnicGroupID.Value) Then
        '        fldEthnicGroupIDValidator.ErrorMessage = "Ethnic Group must not be blank"
        '        fldEthnicGroupIDValidator.IsValid = False
        '        fldEthnicGroupIDValidator.CssClass = "error alert alert-danger"
        '        fldEthnicGroupID.CssClass = "ErrorInput"
        '    End If
        'End If

        'Response.Write(selectEuro.SelectedValue)

        If selectLearnDiff.SelectedValue = "" Then
            selectLearnDiffValidator.ErrorMessage = "Please confirm if you have a learning difficulty, disability or health condition"
            selectLearnDiffValidator.IsValid = False
            selectLearnDiffValidator.CssClass = "error alert alert-danger"
            selectLearnDiff.Style.Add("border", "1px solid red")
        ElseIf selectLearnDiff.SelectedValue = "1" And WorkingData.EnrolmentRequestDisabilityCategory.Rows.Count = 0 Then
            selectLearnDiffValidator.ErrorMessage = "You have indicated you have a difficulty/disability but the disability category has not been selected. Please select the nature of your diifficulty/disability or if you do not have one, change the selection to no."
            selectLearnDiffValidator.IsValid = False
            selectLearnDiffValidator.CssClass = "error alert alert-danger"
            selectLearnDiff.Style.Add("border", "1px solid red")
        End If

        Dim rowCount As Integer = 0
        Dim isPrimaryCount As Integer = 0

        'Check for rows without a disability
        For Each row As EnrolmentRequestDisabilityCategoryRow In WorkingData.EnrolmentRequestDisabilityCategory.Rows
            'row.Cells(0).Controls(0).ToString

            rowCount += 1

            If selectLearnDiff.SelectedValue = "1" Then
                Dim disabilityCategoryID As Integer = row.DisabilityCategoryID.GetValueOrDefault
                Dim isPrimary As String = row.IsPrimary.GetValueOrDefault

                If Not disabilityCategoryID > 0 Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Error on line " + (rowCount).ToString + " as no disability category has been selected. Please remove the row or enter the disability category."
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                End If

                If isPrimary = True Then
                    isPrimaryCount += 1
                End If
            End If
        Next

        'Check for disabilities duplicated in the list
        Dim disabilities As List(Of String) = New List(Of String)
        For Each row As EnrolmentRequestDisabilityCategoryRow In WorkingData.EnrolmentRequestDisabilityCategory.Rows

            If selectLearnDiff.SelectedValue = "1" And row.DisabilityCategoryID > 0 Then
                Dim tblDisabilityCategory As New DisabilityCategoryDataTable
                Dim vDisabilityCategory As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblDisabilityCategory)
                vDisabilityCategory.Columns.AddPKColumns()
                vDisabilityCategory.Columns.EnsureColumnsAreSelected(True, False, tblDisabilityCategory.DisabilityCategoryIDColumn, tblDisabilityCategory.DescriptionColumn)

                vDisabilityCategory.Filters.SetColumnFilter(tblDisabilityCategory.DisabilityCategoryIDColumn, row.DisabilityCategoryID, FilterOperator.OperatorInList)

                tblDisabilityCategory.TableAdapter.Load(tblDisabilityCategory, vDisabilityCategory)
                Dim disabilityList As String = tblDisabilityCategory.FirstOrDefault().Description.ToString()
                disabilities.Add(disabilityList)
            End If
        Next
        Dim duplicates As List(Of String) =
               disabilities.GroupBy(Function(n) n) _
               .Where(Function(g) g.Count() > 1) _
               .Select(Function(g) g.First) _
               .ToList()

        Dim duplicatesOnly As String() = duplicates.ToArray
        Dim duplicatesString As String = String.Join(", ", duplicatesOnly)

        If Not IsNothing(duplicatesString) Then
            If Not String.IsNullOrEmpty(duplicatesString) Then
                DisabilitiesValidator.ErrorMessage = "The following difficulties/disabilities have been entered more than once: <strong>""" + duplicatesString + """</strong>. Please remove the duplicated options."
                DisabilitiesValidator.IsValid = False
                DisabilitiesValidator.CssClass = "error alert alert-danger"
            End If
        End If

        If rowCount >= 1 And selectLearnDiff.SelectedValue = "1" And isPrimaryCount = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please record which difficulty/disability is the primary (main) one."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        ElseIf rowCount >= 1 And isPrimaryCount > 1 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please record only one difficulty/disability as your primary (main) one."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        'If selectLearnDiff.SelectedValue = "1" And CType("" & WorkingData.EnrolmentRequestRow.DisabilityCategory1ID, String) = CType("" & WorkingData.EnrolmentRequestRow.DisabilityCategory2ID, String) Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Primary 'main' condition and Secondary condition must not be the same"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If




        MyBase.ValidateControl()
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)
        ' Move UK to top of Nationality Drop Down
        Dim ctlNationality As DropDownList = TryCast(fldNationalityID.InternalFieldControl, DropDownList)
        Dim ctlResidence As DropDownList = TryCast(fldCountryID.InternalFieldControl, DropDownList)
        Dim ctlEthnicity As DropDownList = TryCast(fldEthnicGroupID.InternalFieldControl, DropDownList)

        Dim itemGB = ctlNationality.Items.FindByValue("GB") ' United Kingdom
        Dim itemXF = ctlResidence.Items.FindByValue("XF") ' UK
        Dim ItemEng = ctlEthnicity.Items.FindByValue("31")

        ctlEthnicity.Items.Remove(ItemEng)
        ctlEthnicity.Items.Insert(1, ItemEng)

        ctlResidence.Items.Remove(itemXF)
        ctlResidence.Items.Insert(1, itemXF)


        ctlNationality.Items.Remove(itemGB)
        ctlNationality.Items.Insert(1, itemGB)

        MyBase.RenderControl(writer)

    End Sub
End Class


