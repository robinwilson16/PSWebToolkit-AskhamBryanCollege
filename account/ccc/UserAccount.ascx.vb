Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class account_ccc_UserAccount
    Inherits webenrolmentcontrolvalidate

    Private m_errortext As String

    Protected Overrides Sub OnPreRender(e As EventArgs)
        MyBase.OnPreRender(e)
        errtext.InnerText = m_errortext
    End Sub

    Protected Overrides Sub OnLoad(e As EventArgs)

        errtext.InnerText = m_errortext

        If WorkingData.CurrentLoggedOnUserRow Is Nothing Then
            Response.Redirect("webenrolment.aspx?page=~/account/ccc/Register.ascx")
        End If

        Dim tblApplicationInterviews As New vApplicationRequestInterviewDataTable
        Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblApplicationInterviews)
        v.Columns.AddDBColumns(False, False)
        v.Columns.EnsureColumnIsSelected(True, False, tblApplicationInterviews.ApplicationStageIDColumn)
        v.Filters.SetColumnFilter(tblApplicationInterviews.ApplicationRequestEmailColumn, WorkingData.CurrentLoggedOnUserRow.Email)
        v.Filters.SetColumnFilter(tblApplicationInterviews.OfferingNameColumn, Nothing, FilterOperator.OperatorNotIsBlank)
        v.SortOrders.SetColumnSortOrder(SortDirection.Descending, tblApplicationInterviews.ApplicationCreatedDateColumn)
        tblApplicationInterviews.TableAdapter.Load(tblApplicationInterviews, v)

        If tblApplicationInterviews.Rows.Count > 0 Then
            strRefNo.InnerText = tblApplicationInterviews(0).RefNo
        Else
            strRefNo.InnerText = "N/A"
        End If

        Me.lstDetails.DataSource = tblApplicationInterviews
        Me.lstDetails.DataBind()
        Me.lstDetails.Visible = True

		WorkingData.PopulateWorkingData(WorkingData.CurrentLoggedOnUserRow)
        postcode.Value = WorkingData.CurrentLoggedOnUserRow.PostcodeOut & WorkingData.CurrentLoggedOnUserRow.PostcodeIn

        MyBase.OnLoad(e)
    End Sub



    Public Sub btnSubmit_OnClick(sender As Object, e As EventArgs)
        m_errortext = ""
        ValidateControl()

        If Me.Page.IsValid Then
            Dim tblWebUser As WebUserDataTable = WorkingData.WebUser
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblWebUser)
            v.Columns.AddDBColumns(True, True)
            v.Filters.SetColumnFilter(tblWebUser.EmailColumn, WorkingData.CurrentLoggedOnUserRow.Email)
            tblWebUser.TableAdapter.Load(tblWebUser, v)

            If tblWebUser.Rows.Count = 1 Then
                Dim DataRow As WebUserRow = tblWebUser.Rows(0)

                DataRow.Surname = fldSurname.Value
                DataRow.FirstForename = fldFirstForename.Value
                DataRow.Title = fldTitle.Value
                DataRow.Sex = fldSex.Value
                If Not fldDateOfBirth.Value = "" Then DataRow.DateOfBirth = CDate(fldDateOfBirth.Value)
                DataRow.Address1 = fldAddress1.Value
                DataRow.Address2 = fldAddress2.Value
                DataRow.Address3 = fldAddress3.Value
                DataRow.Address4 = fldAddress4.Value
                Dim pcode As String = Request.Form("pre[postalcode]")
                'postcode stuff            
                If Len(pcode) > 0 Then
                    DataRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                    DataRow.PostcodeIn = Right(pcode, 3)
                End If
                DataRow.Email = fldEmail.Value

                If Len(Request.Form("password")) > 0 AndAlso Len(Request.Form("passwordnew")) > 0 AndAlso CCCAuthenticationLibrary.DoesSpecifiedPasswordMatchEncryptedPassword(Request.Form("password"), DataRow.Password) Then
                    DataRow.Password = CCCAuthenticationLibrary.EncryptPassword(Request.Form("passwordnew"))
                    m_errortext = "Password Changed"
                ElseIf Len(Request.Form("password")) > 0 AndAlso Len(Request.Form("passwordnew")) > 0 And Not CCCAuthenticationLibrary.DoesSpecifiedPasswordMatchEncryptedPassword(Request.Form("password"), DataRow.Password) Then
                    m_errortext = "Incorrect password"
                ElseIf Len(Request.Form("password")) > 0 AndAlso Len(Request.Form("passwordnew")) = 0 Then
                    m_errortext = "Please specify a new password"
                Else
                    m_errortext = ""
                End If

                tblWebUser.TableAdapter.Save(tblWebUser)
            End If

        End If

    End Sub

    Protected Sub lstDetails_ItemDataBound(sender As Object, e As ListViewItemEventArgs) Handles lstDetails.ItemDataBound
        Dim item As ListViewItem = e.Item
        ' Verify if the item is a data item.
        If item.ItemType = ListViewItemType.DataItem Then
            Dim rowView As System.Data.DataRowView
            rowView = CType(CType(e.Item, System.Web.UI.WebControls.ListViewDataItem).DataItem, Data.DataRowView)


            'Interview Details
            Dim iDateTime As Label = e.Item.FindControl("iDateTime")          
            Dim interviewDetails As HtmlGenericControl = e.Item.FindControl("interviewDetails")
            interviewDetails.Visible = Len(iDateTime.Text) > 0

            'Enrolment Details
            Dim iEnrolmentStartDate As Label = e.Item.FindControl("iEnrolmentStartDate")

            Dim enrolmentDetails As HtmlGenericControl = e.Item.FindControl("enrolmentDetails")
            enrolmentDetails.Visible = Len(iEnrolmentStartDate.Text) > 0



            Dim stage1 As HtmlGenericControl = e.Item.FindControl("stage1")
            Dim stage2 As HtmlGenericControl = e.Item.FindControl("stage2")
            Dim stage3 As HtmlGenericControl = e.Item.FindControl("stage3")
            Dim stage4 As HtmlGenericControl = e.Item.FindControl("stage4")

            Dim stage1details As HtmlGenericControl = e.Item.FindControl("stage1Details")
            Dim stage2details As HtmlGenericControl = e.Item.FindControl("stage2Details")
            Dim stage3details As HtmlGenericControl = e.Item.FindControl("stage3Details")
            Dim stage4details As HtmlGenericControl = e.Item.FindControl("stage4Details")


            If Len(rowView("ApplicationCreatedDate").ToString) > 0 Then
                stage1.Attributes.Add("class", "progtrckr-done")
                stage1details.Attributes.Add("class", "prog-details done")
                stage2.Attributes.Add("class", "progtrckr-current")
                stage2details.Attributes.Add("class", "prog-details current")
                stage3.Attributes.Add("class", "progtrckr-todo")
                stage3details.Attributes.Add("class", "prog-details todo")
                stage4.Attributes.Add("class", "progtrckr-todo")
                stage4details.Attributes.Add("class", "prog-details todo")
            Else
                stage1.Attributes.Add("class", "progtrckr-current")
                stage1details.Attributes.Add("class", "prog-details current")
                stage2.Attributes.Add("class", "progtrckr-todo")
                stage2details.Attributes.Add("class", "prog-details todo")
                stage3.Attributes.Add("class", "progtrckr-todo")
                stage3details.Attributes.Add("class", "prog-details todo")
                stage4.Attributes.Add("class", "progtrckr-todo")
                stage4details.Attributes.Add("class", "prog-details todo")
            End If

            If Len(rowView("DateTime").ToString) > 0 Then
                stage1.Attributes.Add("class", "progtrckr-done")
                stage1details.Attributes.Add("class", "prog-details done")
                stage2.Attributes.Add("class", "progtrckr-done")
                stage2details.Attributes.Add("class", "prog-details done")
                stage3.Attributes.Add("class", "progtrckr-current")
                stage3details.Attributes.Add("class", "prog-details current")
                stage4.Attributes.Add("class", "progtrckr-todo")
                stage4details.Attributes.Add("class", "prog-details todo")
            End If

            If Len(rowView("ApplicationOffer").ToString) > 0 Then
                stage1.Attributes.Add("class", "progtrckr-done")
                stage1details.Attributes.Add("class", "prog-details done")
                stage2.Attributes.Add("class", "progtrckr-done")
                stage2details.Attributes.Add("class", "prog-details done")
                stage3.Attributes.Add("class", "progtrckr-done")
                stage3details.Attributes.Add("class", "prog-details done")
                stage4.Attributes.Add("class", "progtrckr-current")
                stage4details.Attributes.Add("class", "prog-details current")
            End If

            If Len(rowView("EnrolmentStartDate").ToString) > 0 Then
                stage1.Attributes.Add("class", "progtrckr-done")
                stage1details.Attributes.Add("class", "prog-details done")
                stage2.Attributes.Add("class", "progtrckr-done")
                stage2details.Attributes.Add("class", "prog-details done")
                stage3.Attributes.Add("class", "progtrckr-done")
                stage3details.Attributes.Add("class", "prog-details done")
                stage4.Attributes.Add("class", "progtrckr-done")
                stage4details.Attributes.Add("class", "prog-details done")
            End If



        End If



    End Sub
End Class
