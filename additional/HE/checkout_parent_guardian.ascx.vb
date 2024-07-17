
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient


Partial Class webcontrols_checkout_parent_guardian
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub OnLoad(e As EventArgs)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        If IsPostBack Then
            ' UpdateAddress()
        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.ParentPostCodeOut + WorkingData.EnrolmentRequestRow.ParentPostCodeIn

        End If

        MyBase.OnLoad(e)
        ''show course name 
    End Sub




    Public Overrides Sub ValidateControl()

        'Mobile Tel
        If Not IsNothing(fldParentMobileTel) And Not IsNothing(fldParentPhoneNumber) Then
            If String.IsNullOrEmpty(fldParentMobileTel.Value) And String.IsNullOrEmpty(fldParentPhoneNumber.Value) Then
                fldMobileTelValidator.ErrorMessage = "Please enter at least one Parent, Guardian or Carer Telephone number."
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            ElseIf fldParentMobileTel.Value.ToString.Length <> 11 Then
                fldMobileTelValidator.ErrorMessage = "Your Parent, Guardian or Carer mobile phone number must be 11 digits long"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            ElseIf Not fldParentMobileTel.Value.ToString.StartsWith("07") Then
                fldMobileTelValidator.ErrorMessage = "Your Parent, Guardian or Carer mobile phone number must start with 07"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            ElseIf fldParentMobileTel.Value.ToString = WorkingData.EnrolmentRequestRow.MobileTel Then
                fldMobileTelValidator.ErrorMessage = "You must provide a different emergency contact number to your own mobile number " + WorkingData.EnrolmentRequestRow.MobileTel
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldParentMobileTel.CssClass = "ErrorInput"
                fldParentPhoneNumber.CssClass = "ErrorInput"
            End If
        End If

        If WorkingData.EnrolmentRequestRow.Email = WorkingData.EnrolmentRequestRow.ParentEmailAddress Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must provide a different emergency email address to your own email address " + WorkingData.EnrolmentRequestRow.Email
            v.IsValid = False
            Me.Page.Validators.Add(v)

        End If

        'Parental Relationship
        If Not IsNothing(fldParentRelationshipID) Then
            If String.IsNullOrEmpty(fldParentRelationshipID.Value) Then
                fldParentRelationshipIDValidator.ErrorMessage = "Parental Relationship must not be blank"
                fldParentRelationshipIDValidator.IsValid = False
                fldParentRelationshipIDValidator.CssClass = "error alert alert-danger"
                fldParentRelationshipID.CssClass = "ErrorInput"
            End If
        End If

        ''only mandatory if under 19, check the age in UDF
        'Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1)

        'Post Code
        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        If Not IsNothing(postcode) Then
            Dim match As Match = regexPostCode.Match(postcode.Value)
            If Not match.Success Then
                postcodeValidator.ErrorMessage = "Please enter a valid Postcode"
                postcodeValidator.IsValid = False
                postcodeValidator.CssClass = "error alert alert-danger"
                postcode.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

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
                    If pcode.Substring(0, pcode.Length - 3).Length <= 4 Then
                        WorkingData.EnrolmentRequestRow.ParentPostCodeOut = pcode.Substring(0, pcode.Length - 3)
                    Else
                        WorkingData.EnrolmentRequestRow.ParentPostCodeOut = ""
                    End If
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
