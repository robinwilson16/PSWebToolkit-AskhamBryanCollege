Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
''' <summary>
''' CCCPS-75837: A sample step to depict integration of new Attachemnt option for user to upload data against Enrolment and Application requests.
''' </summary>
Partial Class webcontrols_checkout_photo
    Inherits CheckoutBaseControl




    Public Overrides Sub ValidateControl()

        'If FileUpload1.HasFile Then Session("photo") = "Y"

        'If Not FileUpload1.HasFile Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please upload a photo."
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If
        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then


            If FileUpload1.HasFile Then
                Dim fs As System.IO.Stream = FileUpload1.PostedFile.InputStream()
                Dim MyData(CInt(fs.Length)) As Byte
                fs.Read(MyData, 0, CInt(fs.Length))
                fs.Close()

                WorkingData.EnrolmentRequestRow.Photo = MyData

            End If
            Response.Redirect(GetResourceValue("checkout_dataprotection_1618_aspx"))
        End If


    End Sub

End Class
