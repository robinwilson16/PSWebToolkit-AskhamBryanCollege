Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.IO
Imports System.Drawing.Imaging
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class photo
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

    Protected Overrides Sub OnLoad(e As EventArgs)

        MyBase.OnLoad(e)
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




    Public Overrides Sub ValidateControl()


        If WorkingData.EnrolmentRequestRow.Photo Is Nothing Then
            Dim a As New CustomValidator
            a.ErrorMessage = "Please upload a photo"
            a.IsValid = False
            Me.Page.Validators.Add(a)
        End If



    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))
        End If

    End Sub



End Class
