Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directenrol
    Inherits webenrolmentcontrolvalidate
    Private ReadOnly Property AFD_SERVER As String
        Get
            Return SystemSettings.AFDEvolution_Server
        End Get
    End Property

    Private ReadOnly Property AFD_SERIAL_NUMBER As String
        Get
            Return SystemSettings.AFDEvolution_SerialNumber
        End Get
    End Property

    Private ReadOnly Property AFD_PASSWORD As String
        Get
            Return SystemSettings.AFDEvolution_Password
        End Get
    End Property

    Private ReadOnly Property AFD_USER_ID As String
        Get
            Return SystemSettings.AFDEvolution_UserID
        End Get
    End Property

    Private Enum SearchType
        FastFind
        Search
        Retrieve
    End Enum
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

    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property
    Protected Sub rptAttachments_ItemCommand(source As Object, e As RepeaterCommandEventArgs)
        If (e.CommandName = "RemoveAttachment") Then
            Dim attachmentID = CCCDataTypeConverter.Convert(Of Integer)(e.CommandArgument)
            Dim rowToDelete = WorkingData.EnrolmentRequestAttachments.FindByAttachmentID(attachmentID)
            If (rowToDelete IsNot Nothing) Then
                WorkingData.EnrolmentRequestAttachments.RemoveRow(rowToDelete)
                loadAttachments()
            End If
        End If
    End Sub



    ''Load Page

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)



        If IsPostBack AndAlso Len(DoB.Text) > 0 Then
            WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(DoB.Text)

        End If

        If Not IsPostBack Then
            Session("Image") = Nothing
            PutAllOfferingsInBasket()
        Else
            Session("Image") = FileUpload1.PostedFile

        End If




        Session("RequestMode") = RequestMode.EnrolmentRequest


        If Not IsPostBack Then

            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()
            CheckifHE()
            Checkif19()
            CheckcourseSpecificQuestions()
            'CheckforLevel()
            'CheckDBS()




        Else


            'If FileUpload1.HasFile Then
            '    Dim fs As System.IO.Stream = FileUpload1.PostedFile.InputStream()
            '    Dim MyData(CInt(fs.Length)) As Byte
            '    fs.Read(MyData, 0, CInt(fs.Length))
            '    fs.Close()

            '    WorkingData.EnrolmentRequestRow.Photo = MyData
            'End If


            Page.MaintainScrollPositionOnPostBack = True
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
                postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut & WorkingData.EnrolmentRequestRow.PostcodeIn
            End If

            'Dim pcode1 As String = Replace(Postcode1.Value, " ", "")
            'If Len(pcode1) > 0 Then
            '    Try
            '        WorkingData.EnrolmentRequestRow.AltPostcodeOut = pcode1.Substring(0, pcode1.Length - 3)
            '    Catch ex As ArgumentOutOfRangeException
            '        WorkingData.EnrolmentRequestRow.AltPostcodeOut = ""
            '    End Try

            '    Try
            '        WorkingData.EnrolmentRequestRow.AltPostcodeIn = Right(pcode1, 3)
            '    Catch ex As ArgumentOutOfRangeException
            '        WorkingData.EnrolmentRequestRow.AltPostcodeIn = ""
            '    End Try
            '    Postcode1.Value = WorkingData.EnrolmentRequestRow.AltPostcodeOut & WorkingData.EnrolmentRequestRow.AltPostcodeIn

            'End If

        End If


        If IsPostBack AndAlso Not txtLookup.Text Is Nothing AndAlso (Session("Index") <> lstresult.SelectedValue) Then
            UpdateAddress()
        End If




        feeamount.Text = CStr(WorkingData.ShoppingCart.GetTotalCost())

    End Sub

    Private Sub CheckcourseSpecificQuestions()


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
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.UserDefined20Column, tblOffering.UserDefined21Column, tblOffering.UserDefined24Column, tblOffering.UserDefined22Column, tblOffering.UserDefined23Column, tblOffering.OfferingTypeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            With tblOffering(0)

                If Not .UserDefined20 Is Nothing Then

                    courseQs.Visible = True

                    CQS1.CustomCaption = .UserDefined20
                    CQS1.IsRequired = True
                    CQS1.Visible = True


                End If

                If Not .UserDefined21 Is Nothing Then
                    courseQs.Visible = True
                    CQS2.CustomCaption = .UserDefined21
                    CQS2.IsRequired = True
                    CQS2.Visible = True


                End If

                If Not .UserDefined22 Is Nothing Then
                    courseQs.Visible = True

                    CQS3.CustomCaption = .UserDefined22
                    CQS3.IsRequired = True
                    CQS3.Visible = True


                End If

                If Not .UserDefined23 Is Nothing Then
                    courseQs.Visible = True

                    CQS4.CustomCaption = .UserDefined23
                    CQS4.IsRequired = True
                    CQS4.Visible = True


                End If


                If Not .UserDefined24 Is Nothing Then
                    courseQs.Visible = True

                    SpecificUpload.InnerText = .UserDefined24


                End If


            End With


        End If

    End Sub
    Private Sub UpdateAddress()

        ' Declare XML Objects and variables
        Dim xmlDoc As System.Xml.XmlDocument
        Dim root As System.Xml.XmlNode
        Dim dataNode As System.Xml.XmlNode
        Dim itemNodes As System.Xml.XmlNodeList
        Dim lstStr As String
        Dim xmlLocation As String

        ' Create the XML Document Object Instance
        xmlDoc = New System.Xml.XmlDocument()

        ' Build up the XML query string
        xmlLocation = BuildServerDetails(SearchType.Retrieve)

        ' Replace lstResult with the name of your list box for the results
        With lstresult

            If lstresult.Items.Count = 0 Then
                Exit Sub
            Else
                ' Check a valid item is selected
                If .SelectedIndex < 0 Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Please select an item from the list."
                    v.IsValid = False
                    Me.Page.Validators.Add(v)

                    Exit Sub
                End If
            End If

            ' Set XML parameter to retrieve the selected record
            lstStr = .Items.Item(.SelectedIndex).ToString

            xmlLocation = xmlLocation & "&Key=" & lstStr.Substring(lstStr.Length - 40, 40).Trim

            ' Finished with the list box
        End With

        ' Load the XML from the webserver with the query string
        Try

            xmlDoc.Load(xmlLocation)

        Catch
            Dim v As New CustomValidator
            v.ErrorMessage = "Error loading address results, please enter address manually"
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Exit Sub

        End Try

        ' Check if PCE returned an error and if the document is valid
        root = xmlDoc.DocumentElement
        dataNode = root.SelectSingleNode("Result")
        itemNodes = root.SelectNodes("Item")
        If dataNode Is Nothing Or itemNodes Is Nothing Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Error loading address results, please enter address manually"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            Exit Sub
        End If
        If Val(dataNode.InnerText) < 1 Then
            dataNode = root.SelectSingleNode("ErrorText")
            If dataNode Is Nothing Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Error loading address results, please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            Else
                Dim v As New CustomValidator
                v.ErrorMessage = dataNode.InnerText & vbCrLf & "Please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)

            End If
            Exit Sub
        End If


        Dim strProperty As String = String.Empty

        dataNode = itemNodes(0).SelectSingleNode("Property")
        If Not (dataNode Is Nothing) Then strProperty = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("Street")
        If Not (dataNode Is Nothing) Then
            If Not CCCBlankLibrary.IsBlank(strProperty) Then
                txtAddress1.Value = String.Format("{0}, {1}", strProperty, dataNode.InnerText)
            Else
                txtAddress1.Value = dataNode.InnerText
            End If
        End If

        dataNode = itemNodes(0).SelectSingleNode("Locality")
        If Not (dataNode Is Nothing) Then txtAddress2.Value = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("Town")
        If Not (dataNode Is Nothing) Then txtAddress3.Value = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("PostalCounty")
        If Not (dataNode Is Nothing) Then txtAddress4.Value = dataNode.InnerText

        dataNode = itemNodes(0).SelectSingleNode("Postcode")
        If Not (dataNode Is Nothing) Then
            'txtpostcodeout.Value = Trim(dataNode.InnerText.Substring(0, InStr(1, dataNode.InnerText, " ")))
            'txtpostcodein.Value = Trim(Mid(dataNode.InnerText, InStr(1, dataNode.InnerText, " ") + 1))
            If Not (dataNode Is Nothing) Then postcode.Value = dataNode.InnerText
        End If

    End Sub
    Private Sub btnFind_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFind.Click

        If txtLookup.Text = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter a search term."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            Exit Sub
        End If
        ' Declare XML Objects and variables
        Dim xmlDoc As System.Xml.XmlDocument
        Dim xmlLocation As String

        ' Create the XML Document Object Instance
        xmlDoc = New System.Xml.XmlDocument()

        ' Replace lstResult with the name of your list box for the results
        With lstresult

            ' Clear out any existing items in the list
            .Items.Clear()

            ' Build up the XML query string
            xmlLocation = BuildServerDetails(SearchType.FastFind)

            ' Set the Country Name or ISO code for International operations
            xmlLocation = xmlLocation & "&Country=UK"

            ' Set the lookup string
            xmlLocation = xmlLocation & "&Lookup=" & txtLookup.Text ' Change txtLookup to your lookup entry textbox

            ' Load the XML from the webserver with the query string
            Try
                xmlDoc.Load(xmlLocation)
            Catch
                Dim v As New CustomValidator
                v.ErrorMessage = "Error loading address results, please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                Exit Sub
            End Try

            GetSearchResults(xmlDoc, btnFind)

        End With


    End Sub
    Private Function BuildServerDetails(ByVal Type As SearchType) As String
        Dim xmlLocation As String
        ' Build up the XML query string
        xmlLocation = AFD_SERVER & "/afddata.pce?"
        xmlLocation = xmlLocation & "Serial=" & AFD_SERIAL_NUMBER & "&"
        xmlLocation = xmlLocation & "Password=" & AFD_PASSWORD & "&"
        xmlLocation = xmlLocation & "UserID=" & AFD_USER_ID & "&"

        Select Case Type
            Case SearchType.FastFind
                xmlLocation = xmlLocation & "Data=Address&Task=FastFind&Fields=List"
            Case SearchType.Search
                xmlLocation = xmlLocation & "Data=Address&Task=Search&Fields=List"
            Case SearchType.Retrieve
                xmlLocation = xmlLocation & "Data=Address&Task=Retrieve&Fields=Standard"
            Case Else

        End Select

        ' Set the maximum number of records to return
        xmlLocation = xmlLocation & "&MaxQuantity=100"

        Return xmlLocation
    End Function

    Private Sub GetSearchResults(xmlDoc As System.Xml.XmlDocument, btnButton As Button)
        Dim root As System.Xml.XmlNode
        Dim pcFromNode As System.Xml.XmlNode
        Dim dataNode As System.Xml.XmlNode
        Dim itemNodes As System.Xml.XmlNodeList
        Dim listNode As System.Xml.XmlNode
        Dim keyNode As System.Xml.XmlNode
        With lstresult
            ' Check if PCE returned an error and if the document is valid
            root = xmlDoc.DocumentElement
            dataNode = root.SelectSingleNode("Result")
            itemNodes = root.SelectNodes("Item")
            If dataNode Is Nothing Or itemNodes Is Nothing Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Error loading address results, please enter address manually"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                Exit Sub
            End If
            If Val(dataNode.InnerText) < 1 Then
                dataNode = root.SelectSingleNode("ErrorText")
                If dataNode Is Nothing Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Error loading address results, please enter address manually"
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                Else
                    Dim v As New CustomValidator
                    v.ErrorMessage = dataNode.InnerText & vbCrLf & "Please enter address manually"
                    v.IsValid = False
                    Me.Page.Validators.Add(v)
                End If
                Exit Sub
            End If

            ' Display any changed postcode if applicable
            pcFromNode = itemNodes(0).SelectSingleNode("PostcodeFrom")
            dataNode = itemNodes(0).SelectSingleNode("Postcode")
            If Not (pcFromNode Is Nothing) And Not (dataNode Is Nothing) Then
                If pcFromNode.InnerText <> "" Then
                    Dim v As New CustomValidator
                    v.ErrorMessage = "Postcode has changed from " & pcFromNode.InnerText & " to " & dataNode.InnerText
                    v.IsValid = True
                    Me.Page.Validators.Add(v)
                End If
            End If

            ' Now add matching records to the list box
            For Each dataNode In itemNodes
                ' Get the data nodes
                listNode = dataNode.SelectSingleNode("List")
                keyNode = dataNode.SelectSingleNode("Key")
                If Not (listNode Is Nothing) And Not (keyNode Is Nothing) Then
                    ' Add the item to the list box with hidden key
                    .Items.Add(listNode.InnerText & Space(512) & keyNode.InnerText)
                End If
            Next

            If .Items.Count() <> 0 Then .SelectedIndex = 0 ' Select First item in the list

        End With
    End Sub

    Protected Sub Upload(ByVal sender As Object, ByVal e As EventArgs)

        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = FileUpload1.PostedFile
        Dim fs As Stream = FileUpload1.PostedFile.InputStream()
        Dim br As BinaryReader = New BinaryReader(fs)
        Dim bytes As Byte() = br.ReadBytes(fs.Length)
        Dim base64String As String = Convert.ToBase64String(bytes, 0, bytes.Length)
        Image1.ImageUrl = "data:image/png;base64," & base64String
        Panel1.Visible = True

        WorkingData.EnrolmentRequestRow.Photo = bytes


    End Sub

    Protected Sub Save(ByVal sender As Object, ByVal e As EventArgs)

        Page.MaintainScrollPositionOnPostBack = True
        Panel1.Visible = False
        Panel2.Visible = True

    End Sub

    Protected Sub Cancel(ByVal sender As Object, ByVal e As EventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = Nothing
        WorkingData.EnrolmentRequestRow.Photo = Nothing
        Response.Redirect(Request.Url.AbsoluteUri)

    End Sub

    Private Sub Checkif19()


        If WorkingData.EnrolmentRequestRow.DateOfBirth.HasValue Then

            If DateDiff(DateInterval.Day, WorkingData.EnrolmentRequestRow.DateOfBirth.Value, Now) < (19 * 365) Then

                ' feearea.Visible = False
                ' StudentEnrolmentField230.Visible = False
                NINum.Visible = False
                NINum.IsRequired = False


            Else

                ' feearea.Visible = True
                '  StudentEnrolmentField230.Visible = True
                NINum.Visible = True
                NINum.IsRequired = True


            End If

        Else
            ' feearea.Visible = True
            ' StudentEnrolmentField230.Visible = True
            NINum.Visible = False
            NINum.IsRequired = False


        End If








    End Sub

    'Private Sub CheckDBS()


    '    Dim stb As New Text.StringBuilder
    '    For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
    '        If stb.Length > 0 Then stb.Append(",")
    '        stb.Append(item.OfferingID)
    '    Next
    '    If stb.Length > 0 Then
    '        'Load offerings
    '        Dim tblOffering As New OfferingDataTable
    '        Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
    '        vOffering.Columns.AddPKColumns()
    '        vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.OfferingTypeColumn, tblOffering.EnrolmentTypeIDColumn, tblOffering.UserDefined4Column, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
    '        vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

    '        vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

    '        tblOffering.TableAdapter.Load(tblOffering, vOffering)
    '        If tblOffering.Count > 0 Then

    '            With tblOffering(0)

    '                If Len(.UserDefined4) > 0 Then ' If UDF exists 

    '                    Dim intUDF As String = CType(.UserDefined4, String)

    '                    If intUDF = "True" Then


    '                        DBSrequired.Visible = True
    '                        NonDBS.Visible = False

    '                    ElseIf intUDF = "False" Then

    '                        DBSrequired.Visible = False
    '                        NonDBS.Visible = True

    '                    End If

    '                Else

    '                    DBSrequired.Visible = False
    '                    NonDBS.Visible = True

    '                End If


    '            End With
    '        End If
    '    End If



    'End Sub

    'Private Sub CheckforLevel()

    '    Dim stb As New Text.StringBuilder
    '    For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
    '        If stb.Length > 0 Then stb.Append(",")
    '        stb.Append(item.OfferingID)
    '    Next
    '    If stb.Length > 0 Then
    '        'Load offerings
    '        Dim tblOffering As New OfferingDataTable
    '        Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
    '        vOffering.Columns.AddPKColumns()
    '        vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.OfferingTypeColumn, tblOffering.EnrolmentTypeIDColumn, tblOffering.UserDefined3Column, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
    '        vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

    '        vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

    '        tblOffering.TableAdapter.Load(tblOffering, vOffering)
    '        If tblOffering.Count > 0 Then

    '            With tblOffering(0)

    '                If Len(.UserDefined3) > 0 Then ' If UDF 5 exists 


    '                    If .UserDefined3 = "1" Then 'Level 1 Course

    '                        Dim itemLevel2 As ListItem = howtopay.Items.FindByValue("3") ' Disable Level 2 option
    '                        itemLevel2.Enabled = False
    '                        Dim itemLevel3 As ListItem = howtopay.Items.FindByValue("6") ' Disable Level 3 Option
    '                        itemLevel3.Enabled = False
    '                        Dim itemSFE As ListItem = howtopay.Items.FindByValue("4") '  Disable Student Finance Option
    '                        itemSFE.Enabled = False

    '                        evidencerequired.Visible = False

    '                    ElseIf .UserDefined3 = "2" Then 'Level 2 Course


    '                        Dim itemLevel3 As ListItem = howtopay.Items.FindByValue("6") ' Disable Level 3 Option
    '                        itemLevel3.Enabled = False
    '                        Dim itemSFE As ListItem = howtopay.Items.FindByValue("4") '  Disable Student Finance Option
    '                        itemSFE.Enabled = False

    '                        evidencerequired.Visible = False


    '                    ElseIf .UserDefined3 = "3" Then 'Level 3 Course


    '                        Dim itemLevel2 As ListItem = howtopay.Items.FindByValue("3") ' Disable Level 2 option
    '                        itemLevel2.Enabled = False
    '                        Dim itemSFE As ListItem = howtopay.Items.FindByValue("4") '  Disable Student Finance Option
    '                        itemSFE.Enabled = False
    '                        evidencerequired.Visible = False

    '                    ElseIf .UserDefined3 = "4" Or .UserDefined3 = "5" Then


    '                      ;  HEFields.Visible = True
    '                        ' AccomType.Visible = True
    '                        evidencerequired.Visible = True


    '                    End If




    '                End If

    '                If .EnrolmentTypeID.HasValue Then

    '                    If .EnrolmentTypeID = 17 Then


    '                        Dim item3 As ListItem = howtopay.Items.FindByValue("3") ' Disable Level 2 option
    '                        item3.Enabled = False
    '                        Dim itemSFE As ListItem = howtopay.Items.FindByValue("4") ' 
    '                        itemSFE.Enabled = False
    '                        Dim item5 As ListItem = howtopay.Items.FindByValue("5") ' 
    '                        item5.Enabled = False
    '                        Dim item6 As ListItem = howtopay.Items.FindByValue("6") ' 
    '                        item6.Enabled = False
    '                        Dim item7 As ListItem = howtopay.Items.FindByValue("7") ' 
    '                        item7.Enabled = False

    '                    ElseIf .EnrolmentTypeID = 16 Then ' HE


    '                        Dim item5 As ListItem = howtopay.Items.FindByValue("7") ' 
    '                        item5.Enabled = False
    '                        Dim item6 As ListItem = howtopay.Items.FindByValue("6") ' 
    '                        item6.Enabled = False
    '                        Dim item7 As ListItem = howtopay.Items.FindByValue("3") ' 
    '                        item7.Enabled = False


    '                    End If



    '                End If




    '            End With
    '        End If
    '    End If





    'End Sub


    Private Sub CheckifHE()

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
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.OfferingTypeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            With tblOffering(0)


                Dim StrOfferType As String = .OfferingType


                If StrOfferType.Contains("Higher Education") OrElse StrOfferType.Contains("HE") Then
                    HEQs.Visible = True
                    HESSN.IsRequired = True
                    HESOC.IsRequired = True
                    HELast.IsRequired = True
                    HESocio.IsRequired = True
                    HEHQ.IsRequired = True
                    HEHQID.IsRequired = True

                Else

                    HEQs.Visible = False

                    HESSN.IsRequired = False
                    HESOC.IsRequired = False
                    HELast.IsRequired = False
                    HESocio.IsRequired = False
                    HEHQ.IsRequired = False
                    HEHQID.IsRequired = False




                End If


            End With




        End If

    End Sub







    ''Put offerings in basket
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


                    item.Cost = CDec(.TotalFeeAmount.Value.ToString())


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



            If tblOffering2.Count > 0 AndAlso tblOffering2(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering2(0)

                    '  Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))

                    item.Cost = CDec(.TotalFeeAmount.Value.ToString())


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


            If tblOffering3.Count > 0 AndAlso tblOffering3(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering3(0)


                    item.Cost = CDec(.TotalFeeAmount.Value.ToString())


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

            If tblOffering4.Count > 0 AndAlso tblOffering4(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering4(0)


                    item.Cost = CDec(.TotalFeeAmount.Value.ToString())


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



            If tblOffering5.Count > 0 AndAlso tblOffering5(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering5(0)



                    item.Cost = CDec(.TotalFeeAmount.Value.ToString())


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



            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)



                    item.Cost = CDec(.TotalFeeAmount.Value.ToString())


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

        ' Residency dropdown reordering
        Dim ctlNationality As DropDownList = TryCast(fldNationalityID.InternalFieldControl, DropDownList)
        Dim ctlResidence As DropDownList = TryCast(StudentEnrolmentField9.InternalFieldControl, DropDownList)
        Dim ctlEthnicity As DropDownList = TryCast(StudentEnrolmentField12.InternalFieldControl, DropDownList)
        ' Dim ctlLanguage As DropDownList = TryCast(fldLanguage.InternalFieldControl, DropDownList)


        Dim itemGB = ctlNationality.Items.FindByValue("GB") ' United Kingdom
        Dim itemXF = ctlResidence.Items.FindByValue("XF") ' UK
        Dim ItemEng = ctlEthnicity.Items.FindByValue("31")
        ' Dim itemLang = ctlLanguage.Items.FindByValue("1")

        ctlEthnicity.Items.Remove(ItemEng)
        ctlEthnicity.Items.Insert(1, ItemEng)

        ctlResidence.Items.Remove(itemXF)
        ctlResidence.Items.Insert(1, itemXF)


        ctlNationality.Items.Remove(itemGB)
        ctlNationality.Items.Insert(1, itemGB)

        'ctlLanguage.Items.Remove(itemLang)
        ' ctlLanguage.Items.Insert(1, itemLang)

        'Employment field reordering

        Dim ctlLOE As DropDownList = TryCast(StudentEmploymentHistoryField1.InternalFieldControl, DropDownList)
        Dim ctlEII As DropDownList = TryCast(Field_EmploymentIntensityID.InternalFieldControl, DropDownList)
        Dim ctlUL As DropDownList = TryCast(Field_LengthOfUnemploymentID.InternalFieldControl, DropDownList)


        Dim ItemLOE = ctlLOE.Items.FindByValue("1")
        ctlLOE.Items.Remove(ItemLOE)
        ctlLOE.Items.Insert(1, ItemLOE)



        Dim itemUL1 = ctlUL.Items.FindByValue("1")
        ctlUL.Items.Remove(itemUL1)
        ctlUL.Items.Insert(1, itemUL1)



        Dim itemUL2 = ctlUL.Items.FindByValue("2")
        ctlUL.Items.Remove(itemUL2)
        ctlUL.Items.Insert(2, itemUL2)

        'Dim ctlGrades As DropDownList = TryCast(EnglishQual.InternalFieldControl, DropDownList)
        ''Dim ctlPredictedGrades As DropDownList = TryCast(StudentQualsOnEntryField19.InternalFieldControl, DropDownList)

        '' Move all GCSE Grades to the top
        'Dim indexGrade = 0
        'For k As Integer = 0 To ctlGrades.Items.Count - 1 Step 1
        '    Dim item = ctlGrades.Items(k)
        '    Dim itemGradeName = item.Text

        '    ' Is this a GCSE Grade A*-G or 1-9?
        '    Select Case itemGradeName
        '        Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
        '             "1", "2", "3", "4", "5", "6", "7", "8", "9"
        '            ' Remove the item and reinsert at top
        '            ctlGrades.Items.Remove(item)
        '            ctlGrades.Items.Insert(indexGrade, item)
        '            ' Increment index to maintain alpha sort
        '            indexGrade += 1
        '    End Select
        'Next



        'Dim itemGradeBlank = ctlGrades.Items.FindByValue("")
        'ctlGrades.Items.Remove(itemGradeBlank)
        'ctlGrades.Items.Insert(0, itemGradeBlank)


        'Dim ctlgrades1 As DropDownList = TryCast(MathsQual.InternalFieldControl, DropDownList)

        'Dim indexGrade1 = 0
        'For k As Integer = 0 To ctlgrades1.Items.Count - 1 Step 1
        '    Dim item1 = ctlgrades1.Items(k)
        '    Dim itemGradeName1 = item1.Text

        '    ' Is this a GCSE Grade A*-G or 1-9?
        '    Select Case itemGradeName1
        '        Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
        '             "1", "2", "3", "4", "5", "6", "7", "8", "9"
        '            ' Remove the item and reinsert at top
        '            ctlgrades1.Items.Remove(item1)
        '            ctlgrades1.Items.Insert(indexGrade1, item1)
        '            ' Increment index to maintain alpha sort
        '            indexGrade1 += 1
        '    End Select
        'Next


        'Dim itemGradeBlank1 = ctlgrades1.Items.FindByValue("")
        'ctlgrades1.Items.Remove(itemGradeBlank1)
        'ctlgrades1.Items.Insert(0, itemGradeBlank1)



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


        If intCurrentQuals = 0 AndAlso tblQuals.Visible = True Then

            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Please add your qualifications"
            Me.Page.Validators.Add(v)
            tblQuals.Attributes.Add("border:", "1 px solid red;")

        End If

        If RadioButtonListEU.SelectedValue = "0" AndAlso Len(DOEUK.Value) = 0 Then


            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Please enter your date of entry into the UK"
            Me.Page.Validators.Add(a)
            DOEUK.Style.Add("border", "1px solid red")



        End If


        If RadioButtonListEU.SelectedValue = "0" AndAlso VisaID.Value Is Nothing Then


            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Please enter your Visa Type"
            Me.Page.Validators.Add(a)
            VisaID.Style.Add("border", "1px solid red")



        End If

        If RadioButtonListEU.SelectedValue = "0" AndAlso STUDF9.Value Is Nothing Then


            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Please enter your Settlement / pre settlement status"
            Me.Page.Validators.Add(a)
            VisaID.Style.Add("border", "1px solid red")



        End If



        If Field_EmploymentStatusID.Value = "10" AndAlso rdoSelfEmp.SelectedValue = "" Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are Employed, are you self employed?"
            Me.Page.Validators.Add(a)


        End If
        If Field_EmploymentStatusID.Value = "10" AndAlso (Field_EmploymentIntensityID.Value = "") Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are Employed, please say how many hours you work for per week, and how long"
            Me.Page.Validators.Add(a)


        End If
        If Field_EmploymentStatusID.Value = "10" AndAlso (StudentEmploymentHistoryField1.Value = "") Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are Employed, please say how long youve been employed for, and how many hours"
            Me.Page.Validators.Add(a)


        End If
        ''Unemployed check for length of unemp
        If (Field_EmploymentStatusID.Value = "11" Or Field_EmploymentStatusID.Value = "12") AndAlso Field_LengthOfUnemploymentID.Value = "" Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are unemployed, please say for how long you have been"
            Me.Page.Validators.Add(a)
            ValidationSummary1.CssClass = "error"
        End If

        If trNoItems.Visible = True Then

            Dim v As New CustomValidator
            v.ErrorMessage = "Please provide evidence of ID"
            v.IsValid = False
            Me.Page.Validators.Add(v)


        End If

        If Not chkConfirm.Checked Then

            Dim v As New CustomValidator
            v.ErrorMessage = "Please confirm the declaration"
            v.IsValid = False
            Me.Page.Validators.Add(v)

        End If



        If Len(txtAddress1.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the 1st line of the address"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            txtAddress1.Style.Add("border", "1px solid red")
        End If

        If Len(txtAddress2.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the 2nd line of the address"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            txtAddress2.Style.Add("border", "1px solid red")
        End If

        If Len(postcode.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            postcode.Style.Add("border", "1px solid red")
        End If

        If AdditionalSupport.SelectedValue = "" Then


            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Did you receive additional support at school"
            Me.Page.Validators.Add(a)
            AdditionalSupport.Style.Add("border", "1px solid red")



        End If

        If ExamDis.SelectedValue = "" Then


            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Did you receive additional Exam support at school"
            Me.Page.Validators.Add(a)
            ExamDis.Style.Add("border", "1px solid red")



        End If

        If HasEHCP.SelectedValue = "1" AndAlso StudentEnrolmentField19.Value Is Nothing Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "What Local Authority issues your EHCP ? "
            Me.Page.Validators.Add(a)
            StudentEnrolmentField19.Style.Add("border", "1px solid red")

        End If

        If HEQs.Visible = True AndAlso HEAccomType.SelectedValue = "" Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Please enter your accomodation type"
            Me.Page.Validators.Add(a)
            HEAccomType.Style.Add("border", "1px solid red")
        End If





        MyBase.ValidateControl()
    End Sub

    Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        Page.MaintainScrollPositionOnPostBack = True
        trNoItems.Visible = False
        'Me.Page.Validate()
        ''Following line is important to perform validations on File Upload control based on setup done on control.
        Me.fuAttachment.ValidateFile()

        'If Not Me.Page.IsValid Then
        '    Return
        'End If


        Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        _lastAttachmentID -= 1
        With rowAttachment
            .AttachmentID = _lastAttachmentID
            .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & System.DateTime.Now)
            .Notes = txtNotes.Text.Trim
            .Attachment = fuAttachment.FileBytes
            .FileName = fuAttachment.FileName
            .Size = fuAttachment.FileBytes.Length
            If CCCAttachmentThumbnailGenerator.FilenameIndicatesFileIsCompatibleImage(fuAttachment.FileName) Then
                Try
                    .ImageThumb = CCCAttachmentThumbnailGenerator.CreateThumbnailAsByteArray(.Attachment, 96)
                Catch ex As Exception
                    ' Cannot create thumb nail- ignore error
                    .ImageThumb = Nothing ' No thumb-nail
                End Try
            End If
            .CreatedDate = DateTime.Now
        End With
        WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
        ''Reload attachments to refresh the grid and clear the controls for user to do fresh entry again.
        loadAttachments()
        txtNotes.Text = Nothing
        ddlTypeOfEvidence.SelectedIndex = 0
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



        'If Not IsPostBack Then
        '    intCurrentQuals = WorkingData.EnrolmentRequestQualsOnEntry.Rows.Count

        'End If
        'Dim rowH As New TableRow

        'Dim c1, c2, c3, c5, c6, c7 As New TableHeaderCell
        'c1.Visible = False
        'rowH.Cells.AddRange({c1, c2, c3, c5, c6, c7})

        'tblQuals.Rows.Add(rowH)


        If IsPostBack Then
            Page.MaintainScrollPositionOnPostBack = True
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add row" Then
                    intCurrentQuals += 1
                ElseIf btn.ID = "btnNoPriorQualifications" Then
                    intCurrentQuals = 0
                    WorkingData.EnrolmentRequestQualsOnEntry.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No prior qualifications"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add prior qualifications"
                        btn.ToolTip = "Click to show a list below that you can add Qualifications to"
                    End If
                End If
            End If
        End If




        For i = 0 To intCurrentQuals
            Dim row As New TableRow
            Dim cell1, cell2, cell3, cell5, cell6, cell7 As New TableCell
            Dim ctl1, ctl2, ctl3, ctl5, ctl6, ctl7 As New StudentQualsOnEntryField
            cell1.Visible = False

            ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
            ctl1.StudentQualsOnEntryRowNumber = i

            ctl1.LabelWidth = 67
            ctl1.IsHidden = True

            'show/hide mobile
            cell1.Controls.Add(ctl1)

            ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
            ctl2.StudentQualsOnEntryRowNumber = i
            ctl2.IsRequired = True
            ctl2.LabelWidth = 72
            ctl2.CustomCaption = "Subject"
            cell2.Controls.Add(ctl2)

            ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
            ctl3.StudentQualsOnEntryRowNumber = i
            ctl3.IsRequired = True
            ctl3.LabelWidth = 62
            ctl3.CustomCaption = "Grade"
            'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
            cell3.Controls.Add(ctl3)

            'ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
            'ctl4.StudentQualsOnEntryRowNumber = i
            'ctl4.LabelWidth = 90
            'cell4.Controls.Add(ctl4)

            ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
            ctl5.StudentQualsOnEntryRowNumber = i
            ctl5.LabelWidth = 90
            ctl5.IsRequired = True
            ctl5.CustomFieldType = CCCFieldType.Date
            ctl5.CustomCaption = "Date"
            cell5.Controls.Add(ctl5)

            ctl6.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Level

            ctl6.StudentQualsOnEntryRowNumber = i
            ctl6.LabelWidth = 62
            ctl6.IsRequired = True
            ctl6.CustomCaption = "Level"

            cell6.Controls.Add(ctl6)

            ctl7.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
            ctl7.StudentQualsOnEntryRowNumber = i
            ctl7.IsRequired = True
            ctl7.CustomCaption = "Predicted Grade"
            ctl7.LabelWidth = 140

            cell7.Controls.Add(ctl7)

            row.Cells.AddRange({cell1, cell2, cell3, cell5, cell6, cell7})
            tblQuals.Rows.Add(row)
            'tblQuals.Rows.Add(row)

        Next

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentReferences += 1
                ElseIf btn.ID = "btnNoReferences" Then
                    intCurrentReferences = 0
                    WorkingData.EnrolmentRequestHE.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No References"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add References"
                        btn.ToolTip = "Click to show a list below that you can add References to"
                    End If
                End If
            End If
        End If

        If refs.Visible Then

            For i = 0 To intCurrentReferences
                Dim row1, row2 As New HtmlTableRow
                Dim cell1, cell2, cell3, cell4, cell5, cell6 As New HtmlTableCell
                Dim ctl1, ctl2, ctl3, ctl4, ctl5, ctl6 As New StudentReferenceField

                ctl1.StudentReferenceFieldType = StudentReferenceFieldType.RefereeSurname
                ctl1.StudentReferenceRowNumber = i

                cell1.Controls.Add(ctl1)

                ctl2.StudentReferenceFieldType = StudentReferenceFieldType.RefereeForename
                ctl2.StudentReferenceRowNumber = i

                cell2.Controls.Add(ctl2)

                ctl3.StudentReferenceFieldType = StudentReferenceFieldType.RefereeTel
                ctl3.StudentReferenceRowNumber = i
                ctl3.CustomCaption = "Tel"
                cell3.Controls.Add(ctl3)

                ctl4.StudentReferenceFieldType = StudentReferenceFieldType.RefereeEmail
                ctl4.StudentReferenceRowNumber = i
                ctl4.CustomCaption = "Email"

                cell4.Controls.Add(ctl4)

                ctl5.StudentReferenceFieldType = StudentReferenceFieldType.RefereeRelationshipToStudent
                ctl5.StudentReferenceRowNumber = i
                ctl5.CustomCaption = "Relationship to you"
                cell5.Controls.Add(ctl5)

                ctl6.StudentReferenceFieldType = StudentReferenceFieldType.RefereeJobTitle
                ctl6.StudentReferenceRowNumber = i
                ctl6.CustomCaption = "Referee Job Title"
                cell6.Controls.Add(ctl6)

                row1.Cells.Add(cell1)
                row1.Cells.Add(cell2)
                row1.Cells.Add(cell3)
                row2.Cells.Add(cell4)
                row2.Cells.Add(cell5)
                row2.Cells.Add(cell6)

                If i Mod 2 = 0 Then
                    row1.Attributes.Add("style", "background-color:#f9f9f9")
                    row2.Attributes.Add("style", "background-color:#f9f9f9")
                End If

                tblReferences.Rows.Add(row1)
                tblReferences.Rows.Add(row2)
            Next
        End If
    End Sub

    Public Property intCurrentReferences() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intReferenceRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intReferenceRows") = value
        End Set
    End Property


    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
            trNoItems.Visible = True
        Else
            trNoItems.Visible = False
        End If
    End Sub




    Private Sub CheckData()

        If Not HEAccomType.SelectedValue = "" Then

            WorkingData.EnrolmentRequestRow.AccommodationTypeID = HEAccomType.SelectedValue
        End If

        WorkingData.EnrolmentRequestRow.Address1 = txtAddress1.Value
        WorkingData.EnrolmentRequestRow.Address2 = txtAddress2.Value
        WorkingData.EnrolmentRequestRow.Address3 = txtAddress3.Value
        WorkingData.EnrolmentRequestRow.Address4 = txtAddress4.Value

        Dim pcode As String = Replace(postcode.Value, " ", "")
        If Len(pcode) > 0 Then

            'avoid dodgy postcodes breaking system
            Try
                WorkingData.EnrolmentRequest(0).PostcodeOut = pcode.Substring(0, pcode.Length - 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.EnrolmentRequest(0).PostcodeOut = ""
            End Try

            Try
                WorkingData.EnrolmentRequest(0).PostcodeIn = Right(pcode, 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.EnrolmentRequest(0).PostcodeIn = ""
            End Try


        End If

        If Len(DOEUK.Value) > 0 Then

            WorkingData.EnrolmentRequestRow.DateOfEntryUK = CDate(DOEUK.Value)

        End If

        'If rdoStillAt.SelectedValue = "1" Then
        '    WorkingData.EnrolmentRequestRow.F = 1

        'End If

        'If Not howtopay.SelectedValue = "" Then
        '    WorkingData.EnrolmentRequestRow.EnrolmentUserDefined3 = howtopay.SelectedItem.Text

        'End If

        'If Not rdolessthan.SelectedValue = "" Then
        '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined15 = "1"

        'End If

        If Not hhs.SelectedValue = "" Then
            If hhs.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.HouseholdSituation1ID = 1
            ElseIf hhs.SelectedValue = "2" Then
                WorkingData.EnrolmentRequestRow.HouseholdSituation1ID = 2
            ElseIf hhs.SelectedValue = "3" Then
                WorkingData.EnrolmentRequestRow.HouseholdSituation1ID = 3
            ElseIf hhs.SelectedValue = "13" Then
                WorkingData.EnrolmentRequestRow.HouseholdSituation1ID = 1
                WorkingData.EnrolmentRequestRow.HouseholdSituation2ID = 3
            ElseIf hhs.SelectedValue = "98" Then
                WorkingData.EnrolmentRequestRow.HouseholdSituation1ID = 98
            ElseIf hhs.SelectedValue = "99" Then
                WorkingData.EnrolmentRequestRow.HouseholdSituation1ID = 99
            End If

        End If

        WorkingData.EnrolmentRequestRow.EuroResidentID = CType(RadioButtonListEU.SelectedValue, Boolean?)
        WorkingData.EnrolmentRequestRow.CriminalConvictionID = CType(RadioButtonList1.SelectedValue, Integer?)





        If Len(Dfrom.Text) > 0 Then

            WorkingData.EnrolmentRequestRow.SchoolAttendedFrom = CDate(Dfrom.Text)

        End If

        WorkingData.EnrolmentRequestRow.StudentDeclaration = "Accepted Terms & Conditions as stated on: " & CStr(System.DateTime.Now)


        'If HasDSA.Checked Then
        '    WorkingData.EnrolmentRequestRow.ALSRequested = True
        'Else
        '    WorkingData.EnrolmentRequestRow.ALSRequested = False

        'End If

        'If ExamSupport.Checked Then
        '    WorkingData.EnrolmentRequestRow.ExaminationArrangements = True
        'Else
        '    WorkingData.EnrolmentRequestRow.ExaminationArrangements = False

        'End If

        'If Internet.Checked Then
        '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = True
        'Else

        '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = False
        'End If

        'WorkingData.EnrolmentRequestRow.StudentSignature = StudentSignature.Signature


        ' WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(DoB.Text)


        'Dim pcode As String = Replace(Postcode.Value, " ", "")
        'If Len(pcode) > 0 Then

        '    'avoid dodgy postcodes breaking system
        '    Try
        '        WorkingData.EnrolmentRequestRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
        '    Catch ex As ArgumentOutOfRangeException
        '        WorkingData.EnrolmentRequestRow.PostcodeOut = ""
        '    End Try

        '    Try
        '        WorkingData.EnrolmentRequestRow.PostcodeIn = Right(pcode, 3)
        '    Catch ex As ArgumentOutOfRangeException
        '        WorkingData.EnrolmentRequestRow.PostcodeIn = ""
        '    End Try
        'End If

        'Dim pcode1 As String = Replace(Postcode1.Value, " ", "")
        'If Len(pcode1) > 0 Then
        '    Try
        '        WorkingData.EnrolmentRequestRow.AltPostcodeOut = pcode1.Substring(0, pcode1.Length - 3)
        '    Catch ex As ArgumentOutOfRangeException
        '        WorkingData.EnrolmentRequestRow.AltPostcodeOut = ""
        '    End Try

        '    Try
        '        WorkingData.EnrolmentRequestRow.AltPostcodeIn = Right(pcode1, 3)
        '    Catch ex As ArgumentOutOfRangeException
        '        WorkingData.EnrolmentRequestRow.AltPostcodeIn = ""
        '    End Try

        'End If
        'Dim pcode2 As String = Replace(employerpostcode.Value, " ", "")
        'If Len(pcode2) > 0 Then
        '    Try
        '        WorkingData.EnrolmentRequestRow.EmployerPostcodeOut = pcode2.Substring(0, pcode2.Length - 3)
        '    Catch ex As ArgumentOutOfRangeException
        '        WorkingData.EnrolmentRequestRow.EmployerPostcodeOut = ""
        '    End Try

        '    Try
        '        WorkingData.EnrolmentRequestRow.EmployerPostcodeIn = Right(pcode2, 3)
        '    Catch ex As ArgumentOutOfRangeException
        '        WorkingData.EnrolmentRequestRow.EmployerPostcodeIn = ""
        '    End Try

        'End If
        If Len(Contact1Postcode.Value) > 0 Then
            WorkingData.EnrolmentRequestRow.Contact1PostCodeOut = Contact1Postcode.Value.Substring(0, Contact1Postcode.Value.Length - 3).Trim
            WorkingData.EnrolmentRequestRow.Contact1PostCodeIn = Right(Contact1Postcode.Value, 3).Trim
        End If

        If Len(contact2postcode.Value) > 0 Then
            WorkingData.EnrolmentRequestRow.Contact2PostCodeOut = contact2postcode.Value.Substring(0, contact2postcode.Value.Length - 3).Trim
            WorkingData.EnrolmentRequestRow.Contact2PostCodeIn = Right(contact2postcode.Value, 3).Trim
        End If

        If LivesWithContact1.SelectedValue = "1" Then
            WorkingData.EnrolmentRequestRow.Contact1Address1 = txtAddress1.Value
            WorkingData.EnrolmentRequestRow.Contact1Address2 = txtAddress2.Value
            WorkingData.EnrolmentRequestRow.Contact1Address3 = txtAddress3.Value
            WorkingData.EnrolmentRequestRow.Contact1Address4 = txtAddress4.Value

            WorkingData.EnrolmentRequestRow.Contact1PostCodeOut = postcode.Value.Substring(0, postcode.Value.Length - 3).Trim
            WorkingData.EnrolmentRequestRow.Contact1PostCodeIn = Right(postcode.Value, 3).Trim

        End If


        If LivesWithContact2.SelectedValue = "1" Then
            WorkingData.EnrolmentRequestRow.Contact2Address1 = txtAddress1.Value
            WorkingData.EnrolmentRequestRow.Contact2Address2 = txtAddress2.Value
            WorkingData.EnrolmentRequestRow.Contact2Address3 = txtAddress3.Value
            WorkingData.EnrolmentRequestRow.Contact2Address4 = txtAddress4.Value

            WorkingData.EnrolmentRequestRow.Contact2PostCodeOut = postcode.Value.Substring(0, postcode.Value.Length - 3).Trim
            WorkingData.EnrolmentRequestRow.Contact2PostCodeIn = Right(postcode.Value, 3).Trim

        End If

        'If Not MathsQual.Value Is Nothing Then

        '    WorkingData.EnrolmentRequestRow.EnrolmentUserDefined1 = MathsQual.Value


        'End If

        'If Not EnglishQual.Value Is Nothing Then

        '    WorkingData.EnrolmentRequestRow.EnrolmentUserDefined2 = EnglishQual.Value


        'End If

        WorkingData.EnrolmentRequestEmploymentHistoryRow.IncludeInReturn = True
        WorkingData.EnrolmentRequestEmploymentHistoryRow.DateFrom = Today


    End Sub



    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_makepayment_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


End Class
