
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient


Partial Class webcontrols_checkout_parent_guardian
    Inherits CheckoutBaseControl


    Protected Overrides Sub OnLoad(e As EventArgs)


        If IsPostBack Then
            ' UpdateAddress()
        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.ParentPostCodeOut + WorkingData.EnrolmentRequestRow.ParentPostCodeIn

        End If

        MyBase.OnLoad(e)
        ''show course name 
    End Sub




    Public Overrides Sub ValidateControl()

        ''only one field is required.
        If WorkingData.EnrolmentRequestRow.ParentPhoneNumber = "" And WorkingData.EnrolmentRequestRow.ParentMobileTel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter at least one Emergency Contact Telephone number."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If
        ''only mandatory if under 19, check the age in UDF
        'Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1)

        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        'Response.Write(ddConsent.SelectedValue)
        Me.Page.Validate()


        If Me.Page.IsValid Then
            WorkingData.EnrolmentRequestRow.ParentAddress1 = txtAddress1.Value
            WorkingData.EnrolmentRequestRow.ParentAddress2 = txtAddress2.Value
            WorkingData.EnrolmentRequestRow.ParentAddress3 = txtAddress3.Value
            WorkingData.EnrolmentRequestRow.ParentAddress4 = txtAddress4.Value

            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then

                'avoid dodgy postcodes breaking system
                Try
                    WorkingData.EnrolmentRequestRow.ParentPostCodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.ParentPostCodeOut = ""
                End Try

                Try
                    WorkingData.EnrolmentRequestRow.ParentPostCodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.ParentPostCodeIn = ""
                End Try

            End If
            '            Dim blnApplicationsOnly As Boolean = WorkingData.ShoppingCart IsNot Nothing AndAlso Not WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment")
        End If

    End Sub
End Class
