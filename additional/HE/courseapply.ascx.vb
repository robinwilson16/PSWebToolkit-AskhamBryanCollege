Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class courseenrol
    Inherits webenrolmentcontrolvalidate
    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If

        End Get
    End Property

    Public ReadOnly Property FormType() As String
        Get

            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("form")) Then
                Return ""
            Else
                Return (Me.Page.Request("form"))
            End If

        End Get
    End Property

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)
        'Response.Write(FormType())
        Session("RequestMode") = RequestMode.EnrolmentRequest

        If Not IsPostBack Then

            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()
            PopulateDropDowns()

        Else

            Page.MaintainScrollPositionOnPostBack = True

        End If

    End Sub
    Private Sub PopulateDropDowns()

        'Populate dropdowns with offerings where OUDF1 = A Level

        'Load offering table with filter 

        Dim AcademicYearID As String
        AcademicYearID = CompassCC.CCCSystem.CCCCommon.CCCBlankLibrary.NoBlank(SystemSettings.AcademicYearID, System.Configuration.ConfigurationManager.AppSettings("AcademicYearID"))

        Dim tblOffering1 As New OfferingDataTable
        Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
        v.Columns.AddPKColumns()
        v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.CourseInformationColumn, tblOffering1.OfferingIDColumn)
        v.Filters.SetColumnFilter(tblOffering1.OfferingTypeIDColumn, 2, FilterOperator.OperatorEquals)
        v.Filters.SetColumnFilter(tblOffering1.AcademicYearIDColumn, AcademicYearID, FilterOperator.OperatorEquals)
        v.Filters.SetColumnFilter(tblOffering1.ModeOfAttendanceIDColumn, "07", FilterOperator.OperatorEquals)
        tblOffering1.TableAdapter.Load(tblOffering1, v)

        'Add to dropdowns (keeping offeringID as option value for use in adding to basket

        Dim l As New CCCLookup(tblOffering1, v, tblOffering1.OfferingIDColumn)
        'CCCListControlLibrary.PopulateList(l, CourseChoice1, True)
        ' CCCListControlLibrary.PopulateList(l, CourseChoice2, True)
        '' CCCListControlLibrary.PopulateList(l, CourseChoice3, True)
        CCCListControlLibrary.PopulateList(l, ddcourse, True)

    End Sub


    ''Put offerings in basket
    Protected Sub PutAllOfferingsInBasket()

        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)

            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    item.Cost = 0
                    item.Description = .GetRowDescription

                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
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
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

        End If

    End Sub
    Public Overrides Sub ValidateControl()

        If ddCourse.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please select your course"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

    End Sub
    Private Sub addToCart(ByVal offeringid As String)
        ''clear it down first
        WorkingData.ShoppingCart.Items.Clear()
        Dim t As New OfferingDataTable
        Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(t)
        v.Columns.AddDBColumns(True, False)
        v.Filters.SetColumnFilter(t.OfferingIDColumn, offeringid)
        t.TableAdapter.Load(t, v)
        If t.Count > 0 Then
            Dim item As New ShoppingCartItem()
            With t(0)
                item.Cost = .TotalFeeAmount.GetValueOrDefault
                item.Description = .GetRowDescription
                item.ItemType = "Application"
                item.OfferingID = .OfferingID.Value
                item.CourseInfoID = .CourseInformationID.GetValueOrDefault
            End With
            WorkingData.ShoppingCart.Items.Add(item)

            'To fix the College Level not being set
            WorkingData.ApplicationRequestRow.SID = t(0).SID
        End If
    End Sub

    Protected Sub btnGetStarted_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            WorkingData.ApplicationRequestRow.StudentDetailUserDefined1 = FormType()

            If ddCourse.SelectedValue <> "" Then
                Call addToCart(ddCourse.SelectedValue)
            End If

            Response.Redirect(GetResourceValue("checkout_directapply_HEapp_aspx"))

        End If

    End Sub

End Class
