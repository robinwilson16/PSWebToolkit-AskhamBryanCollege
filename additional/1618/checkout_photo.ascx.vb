Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit
''' <summary>
''' CCCPS-75837: A sample step to depict integration of new Attachemnt option for user to upload data against Enrolment and Application requests.
''' </summary>
Partial Class webcontrols_checkout_photo
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        If Not IsPostBack Then

            Session("Image") = Nothing

        Else
            Session("Image") = FileUpload1.PostedFile

            Page.MaintainScrollPositionOnPostBack = True
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
        'Response.BinaryWrite(bytes)
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
