Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class webcontrols_checkout_enquiriesMAIN
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
        If IsPostBack Then
            ' UpdateAddress()

        End If

        ' PutAllOfferingsInBasket()
        ' PopulateOfferingFeeTable()
        ' BuildHTML()


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

    'Private Sub UpdateAddress()

    '    ' Declare XML Objects and variables
    '    Dim xmlDoc As System.Xml.XmlDocument
    '    Dim root As System.Xml.XmlNode
    '    Dim dataNode As System.Xml.XmlNode
    '    Dim itemNodes As System.Xml.XmlNodeList
    '    Dim lstStr As String
    '    Dim xmlLocation As String

    '    ' Create the XML Document Object Instance
    '    xmlDoc = New System.Xml.XmlDocument()

    '    ' Build up the XML query string
    '    xmlLocation = BuildServerDetails(SearchType.Retrieve)

    '    ' Replace lstResult with the name of your list box for the results
    '    With lstresult

    '        If lstresult.Items.Count = 0 Then
    '            Exit Sub
    '        Else
    '            ' Check a valid item is selected
    '            If .SelectedIndex < 0 Then
    '                Dim v As New CustomValidator
    '                v.ErrorMessage = "Please select an item from the list."
    '                v.IsValid = False
    '                Me.Page.Validators.Add(v)

    '                Exit Sub
    '            End If
    '        End If

    '        ' Set XML parameter to retrieve the selected record
    '        lstStr = .Items.Item(.SelectedIndex).ToString

    '        xmlLocation = xmlLocation + "&Key=" + lstStr.Substring(lstStr.Length - 40, 40).Trim

    '        ' Finished with the list box
    '    End With

    '    ' Load the XML from the webserver with the query string
    '    Try

    '        xmlDoc.Load(xmlLocation)

    '    Catch
    '        Dim v As New CustomValidator
    '        v.ErrorMessage = "Error loading address results, please enter address manually"
    '        v.IsValid = False
    '        Me.Page.Validators.Add(v)

    '        Exit Sub

    '    End Try

    '    ' Check if PCE returned an error and if the document is valid
    '    root = xmlDoc.DocumentElement
    '    dataNode = root.SelectSingleNode("Result")
    '    itemNodes = root.SelectNodes("Item")
    '    If dataNode Is Nothing Or itemNodes Is Nothing Then
    '        Dim v As New CustomValidator
    '        v.ErrorMessage = "Error loading address results, please enter address manually"
    '        v.IsValid = False
    '        Me.Page.Validators.Add(v)
    '        Exit Sub
    '    End If
    '    If Val(dataNode.InnerText) < 1 Then
    '        dataNode = root.SelectSingleNode("ErrorText")
    '        If dataNode Is Nothing Then
    '            Dim v As New CustomValidator
    '            v.ErrorMessage = "Error loading address results, please enter address manually"
    '            v.IsValid = False
    '            Me.Page.Validators.Add(v)
    '        Else
    '            Dim v As New CustomValidator
    '            v.ErrorMessage = dataNode.InnerText & vbCrLf & "Please enter address manually"
    '            v.IsValid = False
    '            Me.Page.Validators.Add(v)

    '        End If
    '        Exit Sub
    '    End If


    '    Dim strProperty As String = String.Empty

    '    dataNode = itemNodes(0).SelectSingleNode("Property")
    '    If Not (dataNode Is Nothing) Then strProperty = dataNode.InnerText

    '    dataNode = itemNodes(0).SelectSingleNode("Street")
    '    If Not (dataNode Is Nothing) Then
    '        If Not CCCBlankLibrary.IsBlank(strProperty) Then
    '            txtAddress1.Value = String.Format("{0}, {1}", strProperty, dataNode.InnerText)
    '        Else
    '            txtAddress1.Value = dataNode.InnerText
    '        End If
    '    End If

    '    dataNode = itemNodes(0).SelectSingleNode("Locality")
    '    If Not (dataNode Is Nothing) Then txtAddress2.Value = dataNode.InnerText

    '    dataNode = itemNodes(0).SelectSingleNode("Town")
    '    If Not (dataNode Is Nothing) Then txtAddress3.Value = dataNode.InnerText

    '    dataNode = itemNodes(0).SelectSingleNode("PostalCounty")
    '    If Not (dataNode Is Nothing) Then txtAddress4.Value = dataNode.InnerText

    '    dataNode = itemNodes(0).SelectSingleNode("Postcode")
    '    If Not (dataNode Is Nothing) Then
    '        'txtpostcodeout.Value = Trim(dataNode.InnerText.Substring(0, InStr(1, dataNode.InnerText, " ")))
    '        'txtpostcodein.Value = Trim(Mid(dataNode.InnerText, InStr(1, dataNode.InnerText, " ") + 1))
    '        If Not (dataNode Is Nothing) Then postcode.Value = dataNode.InnerText
    '    End If

    'End Sub
    'Private Sub btnFind_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFind.Click

    '    If txtLookup.Text = "" Then
    '        Dim v As New CustomValidator
    '        v.ErrorMessage = "Please enter a search term."
    '        v.IsValid = False
    '        Me.Page.Validators.Add(v)
    '        Exit Sub
    '    End If
    '    ' Declare XML Objects and variables
    '    Dim xmlDoc As System.Xml.XmlDocument
    '    Dim xmlLocation As String

    '    ' Create the XML Document Object Instance
    '    xmlDoc = New System.Xml.XmlDocument()

    '    ' Replace lstResult with the name of your list box for the results
    '    With lstresult

    '        ' Clear out any existing items in the list
    '        .Items.Clear()

    '        ' Build up the XML query string
    '        xmlLocation = BuildServerDetails(SearchType.FastFind)

    '        ' Set the Country Name or ISO code for International operations
    '        xmlLocation = xmlLocation + "&Country=UK"

    '        ' Set the lookup string
    '        xmlLocation = xmlLocation + "&Lookup=" + txtLookup.Text ' Change txtLookup to your lookup entry textbox

    '        ' Load the XML from the webserver with the query string
    '        Try
    '            xmlDoc.Load(xmlLocation)
    '        Catch
    '            Dim v As New CustomValidator
    '            v.ErrorMessage = "Error loading address results, please enter address manually"
    '            v.IsValid = False
    '            Me.Page.Validators.Add(v)
    '            Exit Sub
    '        End Try

    '        GetSearchResults(xmlDoc, btnFind)

    '    End With


    'End Sub

    'Private Sub GetSearchResults(xmlDoc As System.Xml.XmlDocument, btnButton As Button)
    '    Dim root As System.Xml.XmlNode
    '    Dim pcFromNode As System.Xml.XmlNode
    '    Dim dataNode As System.Xml.XmlNode
    '    Dim itemNodes As System.Xml.XmlNodeList
    '    Dim listNode As System.Xml.XmlNode
    '    Dim keyNode As System.Xml.XmlNode
    '    With lstresult
    '        ' Check if PCE returned an error and if the document is valid
    '        root = xmlDoc.DocumentElement
    '        dataNode = root.SelectSingleNode("Result")
    '        itemNodes = root.SelectNodes("Item")
    '        If dataNode Is Nothing Or itemNodes Is Nothing Then
    '            Dim v As New CustomValidator
    '            v.ErrorMessage = "Error loading address results, please enter address manually"
    '            v.IsValid = False
    '            Me.Page.Validators.Add(v)
    '            Exit Sub
    '        End If
    '        If Val(dataNode.InnerText) < 1 Then
    '            dataNode = root.SelectSingleNode("ErrorText")
    '            If dataNode Is Nothing Then
    '                Dim v As New CustomValidator
    '                v.ErrorMessage = "Error loading address results, please enter address manually"
    '                v.IsValid = False
    '                Me.Page.Validators.Add(v)
    '            Else
    '                Dim v As New CustomValidator
    '                v.ErrorMessage = dataNode.InnerText & vbCrLf & "Please enter address manually"
    '                v.IsValid = False
    '                Me.Page.Validators.Add(v)
    '            End If
    '            Exit Sub
    '        End If

    '        ' Display any changed postcode if applicable
    '        pcFromNode = itemNodes(0).SelectSingleNode("PostcodeFrom")
    '        dataNode = itemNodes(0).SelectSingleNode("Postcode")
    '        If Not (pcFromNode Is Nothing) And Not (dataNode Is Nothing) Then
    '            If pcFromNode.InnerText <> "" Then
    '                Dim v As New CustomValidator
    '                v.ErrorMessage = "Postcode has changed from " + pcFromNode.InnerText + " to " + dataNode.InnerText
    '                v.IsValid = True
    '                Me.Page.Validators.Add(v)
    '            End If
    '        End If

    '        ' Now add matching records to the list box
    '        For Each dataNode In itemNodes
    '            ' Get the data nodes
    '            listNode = dataNode.SelectSingleNode("List")
    '            keyNode = dataNode.SelectSingleNode("Key")
    '            If Not (listNode Is Nothing) And Not (keyNode Is Nothing) Then
    '                ' Add the item to the list box with hidden key
    '                .Items.Add(listNode.InnerText + Space(512) + keyNode.InnerText)
    '            End If
    '        Next

    '        If .Items.Count() <> 0 Then .SelectedIndex = 0 ' Select First item in the list

    '    End With
    'End Sub


    'Private ReadOnly Property AFD_SERVER As String
    '    Get
    '        Return SystemSettings.AFDEvolution_Server
    '    End Get
    'End Property

    'Private ReadOnly Property AFD_SERIAL_NUMBER As String
    '    Get
    '        Return SystemSettings.AFDEvolution_SerialNumber
    '    End Get
    'End Property

    'Private ReadOnly Property AFD_PASSWORD As String
    '    Get
    '        Return SystemSettings.AFDEvolution_Password
    '    End Get
    'End Property

    'Private ReadOnly Property AFD_USER_ID As String
    '    Get
    '        Return SystemSettings.AFDEvolution_UserID
    '    End Get
    'End Property

    'Private Enum SearchType
    '    FastFind
    '    Search
    '    Retrieve
    'End Enum

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

    Public Overrides Sub ValidateControl()


        If over19.SelectedValue = "" Then

            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Will you be over 19 years old on the 31st August this year? "
            Me.Page.Validators.Add(v)
        End If


        If over19.SelectedValue = "1" AndAlso enqudf9.SelectedValue = "" Then

            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Are you currently working in the industry that the course relates to?"
            Me.Page.Validators.Add(v)
        End If



        MyBase.ValidateControl()


    End Sub


    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Me.Page.Validate()

        If Me.Page.IsValid Then

            If Not enqudf9.SelectedValue = "" Then
                WorkingData.EnquiryRequestRow.EnquiryUserDefined9 = enqudf9.SelectedItem.Text

            End If

            If Not EmployerAware.SelectedValue = "" Then
                WorkingData.EnquiryRequestRow.EnquiryUserDefined8 = EmployerAware.SelectedItem.Text

            End If


            WorkingData.EnquiryRequestRow.DateOfBirth = CDate(DoB.Text)

        End If


    End Sub




End Class
