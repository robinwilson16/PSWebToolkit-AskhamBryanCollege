Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class webcontrols_checkout_enquiriesEVENTS
    Inherits CheckoutBaseControl
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

        If PaymentSubmitter.AllowEmptyBasket And WorkingData.ShoppingCart.Items.Count = 0 Then
            Session("RequestMode") = RequestMode.EnquiryRequest
        End If


        If Not IsPostBack Then
            'Dim i As Byte = 1
            'For Each c As ShoppingCartItem In WorkingData.ShoppingCart.Items
            '    c.ChoiceNumber = i
            '    i = CByte(i + 1)
            'Next
        End If


        ' PutAllOfferingsInBasket()
        '  PopulateOfferingFeeTable()
        'BuildHTML()


    End Sub
    'Private Sub BuildHTML()

    '    '  <a href="#" class="list-group-item active">
    '    '    <h4 class="list-group-item-heading">List group item heading</h4>
    '    '    <p class="list-group-item-text">...</p>
    '    '  </a>
    '    '</div>
    '    Me.BasketPlaceHolder.Controls.Clear()

    '    Me.BasketPlaceHolder.Controls.Add(New LiteralControl("<div class=""list-group"">"))
    '    For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
    '        Me.BasketPlaceHolder.Controls.Add(New LiteralControl("<div class=""list-group-item"">"))
    '        Me.BasketPlaceHolder.Controls.Add(New LiteralControl("<h4 class=""list-group-item-heading"">"))
    '        Me.BasketPlaceHolder.Controls.Add(New LiteralControl(item.Description & "</h4>"))

    '        Me.BasketPlaceHolder.Controls.Add(New LiteralControl("<p>" & item.ItemType & "</p>"))
    '        '  Me.BasketPlaceHolder.Controls.Add(New LiteralControl("<p>Cost:£" & item.Cost & "</p>"))
    '        Dim pnl As New Panel
    '        pnl.Visible = PaymentSubmitter.ShouldMakeNewApplicationForEachOffering


    '        pnl.Controls.Add(New LiteralControl("<p>Choice:"))
    '        Dim txt As New TextBox
    '        txt.ID = "txtChoice" & item.OfferingID & item.ItemType
    '        txt.Attributes.Add("data-offeringID", CStr(item.OfferingID))
    '        txt.Text = CStr(item.ChoiceNumber)
    '        txt.AutoPostBack = True
    '        txt.MaxLength = 1
    '        txt.Width = 20
    '        AddHandler txt.TextChanged, AddressOf txtChoice_TextChanged


    '        pnl.Controls.Add(txt)
    '        pnl.Controls.Add(New LiteralControl("</p>"))
    '        Me.BasketPlaceHolder.Controls.Add(pnl)
    '        Dim btn As New CCCButton
    '        btn.ID = "btnRemove" & item.OfferingID & item.ItemType
    '        btn.Attributes.Add("data-offeringID", CStr(item.OfferingID))
    '        btn.CommandName = "Delete"
    '        btn.Text = "Remove"
    '        AddHandler btn.Click, AddressOf btnRemove_Click
    '        Me.BasketPlaceHolder.Controls.Add(btn)
    '        Me.BasketPlaceHolder.Controls.Add(New LiteralControl("</div>"))
    '    Next
    '    Me.BasketPlaceHolder.Controls.Add(New LiteralControl("</div>"))


    'End Sub


    'Protected Sub btnRemove_Click(ByVal sender As Object, e As EventArgs)

    '    Dim btn As CCCButton = DirectCast(sender, CCCButton)

    '    Select Case btn.CommandName
    '        Case "Delete"
    '            'Remove from shopping cart
    '            With WorkingData.ShoppingCart
    '                .Items.Remove(CInt(btn.Attributes("data-offeringID")))
    '            End With

    '            'Recalculate Choices
    '            Dim i As Byte = 1
    '            For Each c As ShoppingCartItem In WorkingData.ShoppingCart.Items
    '                c.ChoiceNumber = i
    '                i = CByte(i + 1)
    '            Next

    '            'Render changes
    '            BuildHTML()


    '    End Select
    'End Sub

    'Protected Sub txtChoice_TextChanged(sender As Object, e As EventArgs)
    '    Dim txt As TextBox = TryCast(sender, TextBox)
    '    Dim NewChoice As Byte = 1
    '    Try
    '        NewChoice = CByte(txt.Text)
    '    Catch ex As Exception
    '    End Try
    '    'Find item

    '    Dim OfferingID As Integer = CInt(txt.Attributes("data-offeringID"))
    '    For Each Item As ShoppingCartItem In WorkingData.ShoppingCart.Items
    '        If Item.OfferingID = OfferingID Then
    '            Item.ChoiceNumber = NewChoice
    '        End If
    '    Next
    'End Sub


    Protected Sub PutAllOfferingsInBasket()

        Dim IntOffering1ID As Integer = Me.Offering1ID
        If IntOffering1ID <> -1 Then

            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn, tblOffering1.CollegeLevelUserDefined1Column)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)

            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)


                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enquiry"

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



            If tblOffering2.Count > 0 AndAlso tblOffering2(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering2(0)

                    '  Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enquiry"

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


            If tblOffering3.Count > 0 AndAlso tblOffering3(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering3(0)


                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enquiry"

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

            If tblOffering4.Count > 0 AndAlso tblOffering4(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering4(0)


                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enquiry"

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



            If tblOffering5.Count > 0 AndAlso tblOffering5(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering5(0)



                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enquiry"

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



            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)



                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enquiry"

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
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationColumn, tblOffering.DayOfWeekColumn, tblOffering.NumberOfWeeksColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)





            'Me.GridView1.DataSource = tblOffering
            'Me.GridView1.DataBind()
            'Me.GridView1.Visible = True


        End If
    End Sub
    Public Overrides Sub ValidateControl()


        If Len(DoB.Text) = 0 Then
            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Please enter your date of birth"
            Me.Page.Validators.Add(v)

        End If

        MyBase.ValidateControl()


    End Sub


    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Me.Page.Validate()

        If Me.Page.IsValid Then


            WorkingData.EnquiryRequestRow.DateOfBirth = CDate(DoB.Text)

        End If


    End Sub



End Class
