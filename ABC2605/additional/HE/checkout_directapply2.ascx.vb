Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        If WorkingData.ApplicationRequestRow.Contact1PostCodeOut <> "" Then
            Contact1Postcode.Value = WorkingData.ApplicationRequestRow.Contact1PostCodeOut & " " & WorkingData.ApplicationRequestRow.Contact1PostCodeIn
        End If

        Session("RequestMode") = RequestMode.ApplicationRequest

        If Not IsPostBack Then

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

        If WorkingData.EnrolmentRequestRow.Contact1Tel = "" And WorkingData.EnrolmentRequestRow.Contact1WorkTel = "" And WorkingData.EnrolmentRequestRow.Contact1MobileTel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter at least one Emergency Contact Telephone number."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

        If Len(Contact1Postcode.Value) > 0 Then
            WorkingData.ApplicationRequestRow.Contact1PostCodeOut = Contact1Postcode.Value.Substring(0, Contact1Postcode.Value.Length - 3).Trim
            WorkingData.ApplicationRequestRow.Contact1PostCodeIn = Right(Contact1Postcode.Value, 3).Trim
        End If

        'If Len(contact2postcode.Value) > 0 Then
        '    WorkingData.ApplicationRequestRow.Contact2PostCodeOut = contact2postcode.Value.Substring(0, contact2postcode.Value.Length - 3).Trim
        '    WorkingData.ApplicationRequestRow.Contact2PostCodeIn = Right(contact2postcode.Value, 3).Trim
        'End If

        If LivesWithContact1.SelectedValue = "1" Then
            WorkingData.ApplicationRequestRow.Contact1Address1 = WorkingData.ApplicationRequestRow.Address1
            WorkingData.ApplicationRequestRow.Contact1Address2 = WorkingData.ApplicationRequestRow.Address2
            WorkingData.ApplicationRequestRow.Contact1Address3 = WorkingData.ApplicationRequestRow.Address3
            WorkingData.ApplicationRequestRow.Contact1Address4 = WorkingData.ApplicationRequestRow.Address4

            WorkingData.ApplicationRequestRow.Contact1PostCodeOut = WorkingData.EnrolmentRequest(0).PostcodeOut
            WorkingData.ApplicationRequestRow.Contact1PostCodeIn = WorkingData.EnrolmentRequest(0).PostcodeIn

        End If
        'WorkingData.ApplicationRequestRow.HasEducationHealthCarePlan = CType(HasEHCP.SelectedValue, Integer?)

    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then

            CheckData()

            redirectString = GetResourceValue("checkout_directapply5_HEapp_aspx")
            Response.Redirect(redirectString)

        End If

    End Sub

    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click

        Dim redirectString As String = String.Empty

        redirectString = GetResourceValue("checkout_directapply_HEapp_aspx")
        Response.Redirect(redirectString)

    End Sub

End Class
