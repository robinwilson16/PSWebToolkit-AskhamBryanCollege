Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_home
    Inherits webenrolmentcontrolvalidate
    Public ReadOnly Property RefNo() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("RefNo")) Then
                Return ""
            Else
                Return CStr(Me.Page.Request("RefNo"))
            End If
        End Get
    End Property

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property


    ''Load Page

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        'If WorkingData.ShoppingCart.Items.Count >= 1 Then
        '    WorkingData.ClearWorkingData()
        'End If


        If Not IsPostBack Then
            PutAllOfferingsInBasket()
            'If ddSite.SelectedValue <> "" Then

            'End If
        End If

        '' do course
        If ddAppType.SelectedValue = "FE" And ddSubject.SelectedValue <> "" Then
            PopulateDropDowns()
        End If
        If ddSite.SelectedValue <> "" Then
            SetSubjects()
        End If

        'If ddAppType.SelectedValue = "" Then
        '    ddSite.Visible = False
        '    ddSubject.Visible = False
        'Else
        '    ddSite.Visible = False
        'End If
        'If ddSite.SelectedValue = "" Then
        '    ddSubject.Visible = False
        'Else
        '    ddSite.Visible = False
        'End If

    End Sub


    Private Sub PopulateDropDowns()

        'Populate dropdowns with offerings where OUDF1 = A Level


        'Load offering table with filter 


        Dim tblOffering1 As New OfferingDataTable
        Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
        v.Columns.AddPKColumns()
        v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.CourseInformationColumn, tblOffering1.OfferingIDColumn)
        v.Filters.SetColumnFilter(tblOffering1.SiteIDColumn, ddSite.SelectedValue, FilterOperator.OperatorEquals)
        v.Filters.SetColumnFilter(tblOffering1.UserDefined5Column, ddSubject.SelectedValue, FilterOperator.OperatorEquals)
        tblOffering1.TableAdapter.Load(tblOffering1, v)

        'Add to dropdowns (keeping offeringID as option value for use in adding to basket

        Dim l As New CCCLookup(tblOffering1, v, tblOffering1.OfferingIDColumn)
        'CCCListControlLibrary.PopulateList(l, CourseChoice1, True)
        ' CCCListControlLibrary.PopulateList(l, CourseChoice2, True)
        '' CCCListControlLibrary.PopulateList(l, CourseChoice3, True)
        CCCListControlLibrary.PopulateList(l, ddCourse, True)


    End Sub


    Private Sub SetSubjects()

        'find items
        Dim item4 As ListItem = ddSubject.Items.FindByValue("Animal Management") '
        Dim item5 As ListItem = ddSubject.Items.FindByValue("Agriculture") ' 
        Dim item6 As ListItem = ddSubject.Items.FindByValue("Engineering") ' 
        Dim item7 As ListItem = ddSubject.Items.FindByValue("Floristry") ' 
        Dim item8 As ListItem = ddSubject.Items.FindByValue("Forestry and Arboriculture") ' 
        Dim item9 As ListItem = ddSubject.Items.FindByValue("Motorsport") ' 
        Dim item10 As ListItem = ddSubject.Items.FindByValue("Horticulture") ' 
        Dim item11 As ListItem = ddSubject.Items.FindByValue("Sport And Public Services") ' 
        Dim item12 As ListItem = ddSubject.Items.FindByValue("The Royal Horticultural Society") ' 
        Dim item13 As ListItem = ddSubject.Items.FindByValue("Veterinary Nursing") ' 
        Dim item14 As ListItem = ddSubject.Items.FindByValue("Foundation Learning") ' 
        Dim item15 As ListItem = ddSubject.Items.FindByValue("Land and Wildlife") ' 
        Dim item16 As ListItem = ddSubject.Items.FindByValue("Equine") ' 

        'set them all enabled first

        item4.Enabled = True
        item5.Enabled = True
        item6.Enabled = True
        item7.Enabled = True
        item8.Enabled = True
        item9.Enabled = True
        item10.Enabled = True
        item11.Enabled = True
        item12.Enabled = True
        item13.Enabled = True
        item14.Enabled = True
        item15.Enabled = True
        item16.Enabled = True


        'mbro
        If ddSite.SelectedValue = "9" Then
            item5.Enabled = False
            item6.Enabled = False
            item7.Enabled = False
            item8.Enabled = False
            item9.Enabled = False
            item10.Enabled = False
            item11.Enabled = False
            item12.Enabled = False
            item13.Enabled = False
        End If


        'salt/wake
        If ddSite.SelectedValue = "13" Or ddSite.SelectedValue = "18" Then
            item5.Enabled = False
            item6.Enabled = False
            item7.Enabled = False
            item8.Enabled = False
            item9.Enabled = False
            item10.Enabled = False
            item11.Enabled = False
            item12.Enabled = False
            item13.Enabled = False
            item14.Enabled = False
            item15.Enabled = False
            item16.Enabled = False
        End If

        'newc
        If ddSite.SelectedValue = "10" Then
            item4.Enabled = False
            item5.Enabled = False
            item6.Enabled = False
            item7.Enabled = False
            item8.Enabled = False
            item9.Enabled = False
            item10.Enabled = False
            item11.Enabled = False
            item12.Enabled = False
            item14.Enabled = False
            item15.Enabled = False
            item16.Enabled = False
        End If
    End Sub


    Protected Sub PutAllOfferingsInBasket()


        Dim IntOffering1ID As Integer = Me.OfferingID
        If IntOffering1ID <> -1 Then

            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.GrossTuitionFeeOverrideColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn, tblOffering1.CollegeLevelUserDefined1Column)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)

            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)
                    item.Cost = 0
                    item.Description = .GetRowDescription
                    item.ItemType = "Application"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault()

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
                    item.ItemType = "Application"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault()

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If



    End Sub



    ''Databind the Grid
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))
            '   Dim CourseOfferingFees As New CourseOfferingFees(OfferingID)

        End If
    End Sub

    Public Overrides Sub ValidateControl()

        If ddAppType.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please select your application type"
            v.IsValid = False
            Me.Page.Validators.Add(v)

        End If

        If ddAppType.SelectedValue = "FE" Then
            If ddSite.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Please select which campus you wish to study at"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            Else
                If ddSubject.SelectedValue = "" Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Please Select a Course Area"
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                Else
                    If ddCourse.SelectedValue = "" Then
                        Dim v As New CustomValidator
                        v.ErrorMessage = "Please select your level and course"
                        v.IsValid = False
                        Me.Page.Validators.Add(v)
                    End If

                End If
            End If

        End If

        ''    And ddSubject.SelectedValue <> "" Then
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


    Protected Sub btnGetStarted_click(ByVal sender As Object, ByVal e As EventArgs) Handles getstarted.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            If ddCourse.SelectedValue <> "" Then
                Call addToCart(ddCourse.SelectedValue)
            End If
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = ddAppType.SelectedValue
            Response.Redirect(GetResourceValue("checkout_directapply_aspx"))
        End If

    End Sub





End Class
