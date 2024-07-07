Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class webcontrols_checkout_enquiriesGENERAL
    Inherits CheckoutBaseControl

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)


    End Sub

    Protected Sub btnContinue_Click(sender As Object, e As System.EventArgs) Handles btnContinue.Click


        Me.Page.Validate()

        If Me.Page.IsValid Then
            Dim tblEnquiryRequest As EnquiryRequestDataTable = WorkingData.EnquiryRequest
            tblEnquiryRequest.Clear()

            Dim row As EnquiryRequestRow = tblEnquiryRequest.NewRow
            row.AcademicYearID = CompassCC.CCCSystem.CCCCommon.CCCBlankLibrary.NoBlank(SystemSettings.AcademicYearID, System.Configuration.ConfigurationManager.AppSettings("AcademicYearID"))

            row.Surname = CStr(fldSurname.Value)
            row.FirstForename = CStr(fldfirstname.Value)

            If Len(DoB.Text) > 0 Then
                row.DateOfBirth = CDate(DoB.Text)
            End If

            row.EMailAddress = CStr(fldEmail.Value)
            row.Enquiry = CStr(fldEnquiry.Value)

            'If Len(fldSubjectID.Value) > 0 Then
            '    row.SubjectID = CInt(fldSubjectID.Value)
            'End If
            'If Len(fldSubject2ID.Value) > 0 Then
            '    row.Subject2ID = CInt(fldSubject2ID.Value)
            'End If
            'If Len(fldSubject3ID.Value) > 0 Then
            '    row.Subject3ID = CInt(fldSubject3ID.Value)
            'End If
            'If Len(fldSubject4ID.Value) > 0 Then
            '    row.Subject4ID = CInt(fldSubject4ID.Value)
            'End If
            'If Len(fldSubject5ID.Value) > 0 Then
            '    row.Subject5ID = CInt(fldSubject5ID.Value)
            'End If

            tblEnquiryRequest.Rows.Add(row)
            tblEnquiryRequest.TableAdapter.Save(tblEnquiryRequest)

            WorkingData.ShoppingCart.Items.Clear()


            CCCPageLibrary.NavigateToPage(GetResourceValue("thankyou_enquiry_aspx"))
        End If

    End Sub
End Class