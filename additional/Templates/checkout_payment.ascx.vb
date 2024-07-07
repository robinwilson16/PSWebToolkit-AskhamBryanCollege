Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_payment
    Inherits CheckoutBaseControl


    'Implements IHttpModule
    'Public Overrides Sub Dispose()



    'End Sub

    'Public Shadows Sub Init(context As HttpApplication)
    '    AddHandler context.BeginRequest, New EventHandler(AddressOf context_BeginRequest)
    'End Sub

    'Private Sub context_BeginRequest(sender As Object, e As EventArgs)

    '    Dim currentContext As HttpContext = TryCast(sender, HttpApplication).Context
    '    If (currentContext.Request.Url.ToString().Contains("OfferingID") _
    '                Or currentContext.Request.Url.ToString().Contains("Offering1ID") _
    '                Or currentContext.Request.Url.ToString().Contains("Offering2ID") _
    '                Or currentContext.Request.Url.ToString().Contains("Offering3ID") _
    '                Or currentContext.Request.Url.ToString().Contains("Offering4ID") _
    '                Or currentContext.Request.Url.ToString().Contains("Offering5ID")) Then
    '        currentContext.SetSessionStateBehavior(System.Web.SessionState.SessionStateBehavior.ReadOnly)
    '    Else
    '        currentContext.SetSessionStateBehavior(System.Web.SessionState.SessionStateBehavior.Default)
    '    End If

    'End Sub

    'Private Sub IHttpModule_Init(context As HttpApplication) Implements IHttpModule.Init
    '    Throw New NotImplementedException()
    'End Sub

    'Private Sub IHttpModule_Dispose() Implements IHttpModule.Dispose
    '    Throw New NotImplementedException()
    'End Sub
    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get

    End Property

    Public ReadOnly Property Offering1ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering1ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering1ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering2ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering2ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering2ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering3ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering3ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering3ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering4ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering4ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering4ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering5ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering5ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering5ID"))
            End If
        End Get
    End Property
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)



        If Not IsPostBack Then
            ' Insert the table of offerings
            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

        End If
    End Sub
    Protected Sub PutAllOfferingsInBasket()


        Dim IntOffering1ID As Integer = Me.Offering1ID
        If IntOffering1ID <> -1 Then

            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)

            With tblOffering1(0)

                If tblOffering1.Count > 0 AndAlso tblOffering1(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect

                        'ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))



                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value
                    End If
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

        Dim IntOffering2ID As Integer = Me.Offering2ID

        If IntOffering2ID <> -1 Then

            Dim tblOffering2 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering2)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering2.WebSiteAvailabilityIDColumn, tblOffering2.CourseInformationIDColumn, tblOffering2.TotalFeeAmountColumn, tblOffering2.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering2.OfferingIDColumn, IntOffering2ID)
            tblOffering2.TableAdapter.Load(tblOffering2, v)
            With tblOffering2(0)

                If tblOffering2.Count > 0 AndAlso tblOffering2(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        ' ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering2.Count > 0 AndAlso tblOffering2(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering2(0)

                    '  Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value
                    End If
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
        Dim IntOffering3ID As Integer = Me.Offering3ID

        If IntOffering3ID <> -1 Then

            Dim tblOffering3 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering3)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering3.WebSiteAvailabilityIDColumn, tblOffering3.CourseInformationIDColumn, tblOffering3.TotalFeeAmountColumn, tblOffering3.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering3.OfferingIDColumn, IntOffering3ID)
            tblOffering3.TableAdapter.Load(tblOffering3, v)
            With tblOffering3(0)

                If tblOffering3.Count > 0 AndAlso tblOffering3(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        ' ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering3.Count > 0 AndAlso tblOffering3(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering3(0)

                    ''Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value
                    End If

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

        Dim IntOffering4ID As Integer = Me.Offering4ID

        If IntOffering4ID <> -1 Then

            Dim tblOffering4 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering4)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering4.WebSiteAvailabilityIDColumn, tblOffering4.CourseInformationIDColumn, tblOffering4.TotalFeeAmountColumn, tblOffering4.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering4.OfferingIDColumn, IntOffering4ID)
            tblOffering4.TableAdapter.Load(tblOffering4, v)
            With tblOffering4(0)

                If tblOffering4.Count > 0 AndAlso tblOffering4(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '  ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering4.Count > 0 AndAlso tblOffering4(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering4(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value
                    End If
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
        Dim IntOffering5ID As Integer = Me.Offering5ID

        If IntOffering5ID <> -1 Then

            Dim tblOffering5 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering5)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering5.WebSiteAvailabilityIDColumn, tblOffering5.CourseInformationIDColumn, tblOffering5.TotalFeeAmountColumn, tblOffering5.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering5.OfferingIDColumn, IntOffering5ID)
            tblOffering5.TableAdapter.Load(tblOffering5, v)
            With tblOffering5(0)

                If tblOffering5.Count > 0 AndAlso tblOffering5(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '  ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering5.Count > 0 AndAlso tblOffering5(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering5(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value
                    End If
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




        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)

            With tblOffering(0)

                If tblOffering.Count > 0 AndAlso tblOffering(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '   ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value
                    End If
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
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            Me.GridView1.DataSource = tblOffering
            Me.GridView1.DataBind()
            Me.GridView1.Visible = True
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            Dim OfferingID As Integer = DataBinder.Eval(e.Row.DataItem, "OfferingID")
            ' Dim CourseOfferingFees As New CourseOfferingFees(OfferingID)



        End If
    End Sub




    Public Overrides Sub ValidateControl()

        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that the payment amount is correct - if this is not correct please get in touch using the contact number below"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary1.ShowSummary = True
        End If
    End Sub








    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click



        Me.Page.Validate()

        If Me.Page.IsValid Then

            'WorkingData.EnrolmentRequestRow.Address1 = Address1.Value
            'WorkingData.EnrolmentRequestRow.Address2 = Address2.Value
            'WorkingData.EnrolmentRequestRow.Address3 = Address3.Value
            'WorkingData.EnrolmentRequestRow.Address4 = Address4.Value

            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then

                'avoid dodgy postcodes breaking system
                Try
                    WorkingData.EnrolmentRequestRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.PostcodeOut = ""
                End Try

                Try
                    WorkingData.EnrolmentRequestRow.PostcodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.PostcodeIn = ""
                End Try

                Dim chkconfirm As Boolean = True

                WorkingData.EnrolmentRequestRow.StudentDeclaration = chkconfirm

                Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))

            End If
        End If

    End Sub


End Class
