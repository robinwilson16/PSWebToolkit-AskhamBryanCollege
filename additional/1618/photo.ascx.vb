Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.IO
Imports System.Drawing.Imaging
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Linq

Partial Class photo
    Inherits CheckoutBaseControl

    Public MainOfferingID As Integer
    Public Course As Course
    Public IsPhotoRequired As Boolean = True

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property

    Protected Overrides Sub OnLoad(e As EventArgs)

        MyBase.OnLoad(e)

        If Not WorkingData.EnrolmentRequestRow.Photo Is Nothing Then
            Dim base64String As String = Convert.ToBase64String(WorkingData.EnrolmentRequestRow.Photo, 0, WorkingData.EnrolmentRequestRow.Photo.Length)
            Image1.ImageUrl = "data:image/png;base64," & base64String
        Else
            Image1.ImageUrl = "/PSWebEnrolment/images/BlankPhoto.png"
        End If

        MainOfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(MainOfferingID)

        'If PaymentSubmitter.AllowEmptyBasket And WorkingData.ShoppingCart.Items.Count = 0 Then
        '    Session("RequestMode") = RequestMode.EnrolmentRequest
        'End If

        If Not IsPostBack Then
            Session("Image") = Nothing
            PutAllOfferingsInBasket()
        Else
            Session("Image") = FileUpload1.PostedFile

        End If
    End Sub

    Protected Sub PutAllOfferingsInBasket()

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

                        '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '   ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
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

    Protected Sub Upload(ByVal sender As Object, ByVal e As EventArgs)
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic"}

        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = FileUpload1.PostedFile
        Dim fs As Stream = FileUpload1.PostedFile.InputStream()
        Dim br As BinaryReader = New BinaryReader(fs)
        Dim bytes As Byte() = br.ReadBytes(CInt(fs.Length))
        Dim base64String As String = Convert.ToBase64String(bytes, 0, bytes.Length)
        Dim imgPath As String = "data:image/png;base64," & base64String
        Dim fileName As String = FileUpload1.PostedFile.FileName
        PhotoFilename.Text = fileName

        'Panel1.Visible = True
        'Response.BinaryWrite(bytes)

        'Check Image is Valid
        If Not IsNothing(fileName) Then
            If String.IsNullOrEmpty(fileName) Then
                PhotoPathValidator.ErrorMessage = "Please click Choose File above first to browse your device for the photo you wish to use. If you cannot provide evidence at present, please instead select a reason why below."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf fileName.LastIndexOf(".") <= 0 Then
                PhotoPathValidator.ErrorMessage = "This type of file is not valid. Please upload a valid image file"
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf validExtensions.Contains(fileName.Substring(fileName.LastIndexOf(".")).ToLower) = False Then
                PhotoPathValidator.ErrorMessage = "This type of file is not valid. Please upload a valid image file"
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf FileUpload1.FileBytes.Length > 5000 Then
                PhotoPathValidator.ErrorMessage = "This file is too large as the maximum permitted file size is 5MB. Please choose a smaller file."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            Else
                Image1.ImageUrl = imgPath
                WorkingData.EnrolmentRequestRow.Photo = bytes
            End If
        End If
    End Sub

    Protected Sub Save(ByVal sender As Object, ByVal e As EventArgs)

        Page.MaintainScrollPositionOnPostBack = True
        'Panel1.Visible = False
        'Panel2.Visible = True

    End Sub

    Protected Sub Cancel(ByVal sender As Object, ByVal e As EventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = Nothing
        WorkingData.EnrolmentRequestRow.Photo = Nothing
        Response.Redirect(Request.Url.AbsoluteUri)

    End Sub




    Public Overrides Sub ValidateControl()

        'Photo Validation
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic"}

        If Not IsNothing(StudentDetailUserDefined24) Then
            If WorkingData.EnrolmentRequestRow.Photo Is Nothing And (CType(StudentDetailUserDefined24.Value, String) = "" Or CType(StudentDetailUserDefined24.Value, String) = "OK") And IsPhotoRequired = True Then
                PhotoPathValidator.ErrorMessage = "Please upload your photo by clicking on Choose File. If you cannot upload your photo then please state the reason why."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        Else
            If WorkingData.EnrolmentRequestRow.Photo Is Nothing And IsPhotoRequired = True Then
                PhotoPathValidator.ErrorMessage = "Please upload your photo by clicking on Choose File. If you cannot upload your photo then please state the reason why."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            Response.Redirect(GetResourceValue("checkout_dataprotection_1618_aspx"))
        End If

    End Sub



End Class
