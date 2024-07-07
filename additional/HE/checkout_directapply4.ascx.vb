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

        If WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 <> "" Then
            liEmergency.Visible = False
        End If

        Session("RequestMode") = RequestMode.ApplicationRequest

        If Not IsPostBack Then

            If divPersonalStatement.Visible = True Then
                personalstatement.Text = WorkingData.ApplicationRequestRow.StudentDeclaration
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

        If divPersonalStatement.Visible = True Then
            If WorkingData.ApplicationRequestRow.StudentDeclaration = "" Then
                Dim v As New CustomValidator()
                v.ErrorMessage = "Please enter your personal statement."
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Dim redirectString As String = String.Empty

        If divPersonalStatement.Visible = True Then WorkingData.ApplicationRequestRow.StudentDeclaration = personalstatement.Text

        Me.Page.Validate()


        If Me.Page.IsValid Then

            CheckData()

            redirectString = GetResourceValue("checkout_directapply3_HEapp_aspx")
            Response.Redirect(redirectString)

        End If

    End Sub

    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click

        Dim redirectString As String = String.Empty

        CheckData()

        redirectString = GetResourceValue("checkout_directapply5_HEapp_aspx")
            Response.Redirect(redirectString)

    End Sub

End Class
