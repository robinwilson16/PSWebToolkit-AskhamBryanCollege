Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate


    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
            liEmergency.Visible = False
        End If

        Session("RequestMode") = RequestMode.ApplicationRequest


        If Not IsPostBack Then

            If WorkingData.ApplicationRequestRow.CriminalConvictionID.HasValue Then
                rdoCC.SelectedValue = WorkingData.ApplicationRequestRow.CriminalConvictionID
            End If

            If WorkingData.EnrolmentRequestRow.CareLeaver = True Then
                NotHECareLeaver.SelectedValue = "1"
            End If

            If WorkingData.ApplicationRequestRow.LearningDiffOrDisID <> "" Then
                rdoLearnDiff.SelectedValue = WorkingData.ApplicationRequestRow.LearningDiffOrDisID
            End If

            'PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

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

        If rdoCC.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Do you have any unspent conditional cautions or convictions? must not be blank"
            Me.Page.Validators.Add(a)
            rdoCC.Style.Add("border", "1px solid red")
        End If

        If NotHECareLeaver.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Are you in care? must not be blank"
            Me.Page.Validators.Add(a)
            NotHECareLeaver.Style.Add("border", "1px solid red")
        End If

        If rdoLearnDiff.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Do consider yourself to have a learning difficulty and/or disability? must not be blank"
            Me.Page.Validators.Add(a)
            rdoLearnDiff.Style.Add("border", "1px solid red")
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

        'WorkingData.ApplicationRequestRow.EuroResidentID = CType(RadioButtonListEU.SelectedValue, Boolean?)
        WorkingData.ApplicationRequestRow.CriminalConvictionID = CType(rdoCC.SelectedValue, Integer?)
        WorkingData.ApplicationRequestRow.LearningDiffOrDisID = rdoLearnDiff.SelectedValue
        WorkingData.EnrolmentRequestRow.CareLeaver = NotHECareLeaver.SelectedValue

    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then

            CheckData()

            redirectString = GetResourceValue("checkout_directapply6_HEapp_aspx")
            Response.Redirect(redirectString)

        End If


    End Sub

    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click

        Dim redirectString As String = String.Empty

        redirectString = GetResourceValue("checkout_directapply4_HEapp_aspx")
            Response.Redirect(redirectString)

    End Sub

End Class
