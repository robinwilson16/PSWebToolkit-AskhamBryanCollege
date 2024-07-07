

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_payment
    Inherits System.Web.UI.Page

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)

        If SystemSettings.UseWorldPay Then
            Dim strPaymentID As String = Request("cartId")
            Dim strStatus As String = Request("transStatus")
            If Len(strStatus) > 0 And Len(strPaymentID) > 0 Then
                If strStatus.ToString.ToUpper = "Y" Then
                    'Update payment status
                    Dim tbl As New EnrolmentRequestDataTable
                    Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                    v.Columns.AddAllColumns(False, False)
                    v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, strPaymentID)
                    tbl.TableAdapter.Load(tbl, v)

                    For Each row As EnrolmentRequestRow In tbl.Select()
                        row.PaymentStatus = "Paid"
                    Next
                    tbl.TableAdapter.Save(tbl)

                End If

                Me.Controls.Add(New LiteralControl("<h2>Process Complete - Payment Successful</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Please come into college to complete the process</p>"))

            Else
                Dim strMsg As String = "transStatus and cartId must be supplied"

                Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing the result your payment. The payment may have been successful. The error message received was:" & strMsg & " Please contact the college to continue the process.</p>"))
            End If
        ElseIf SystemSettings.UseRealEx Then
            Dim strPaymentID As String = Request("WebPaymentID")
            Dim strStatus As String = Request("RESULT")
            If Len(strStatus) > 0 And Len(strPaymentID) > 0 Then
                If strStatus.ToString = "00" Then
                    'Update payment status
                    Dim tbl As New EnrolmentRequestDataTable
                    Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                    v.Columns.AddAllColumns(False, False)
                    v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, strPaymentID)
                    tbl.TableAdapter.Load(tbl, v)

                    For Each row As EnrolmentRequestRow In tbl.Select()
                        row.PaymentStatus = "Paid"
                    Next
                    tbl.TableAdapter.Save(tbl)

                End If

                Me.Controls.Add(New LiteralControl("<h2>Process Complete - Payment Successful</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Please come into college to complete the process</p>"))

            Else
                Dim strMsg As String = "ORDER_ID and/or RESULT not returned from RealEx"
                Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing the result your payment. The payment may have been successful. The error message received was:" & strMsg & " Please contact the college to continue the process.</p>"))

            End If
        ElseIf SystemSettings.UsePayPal Then
            'If sent here by PayPal then payment successful...

            Dim strInvoice As String = Request("invoice")
            If Len(strInvoice) > 0 Then
                'Update payment status
                Dim tbl As New EnrolmentRequestDataTable
                Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                v.Columns.AddAllColumns(False, False)
                v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, strInvoice)
                tbl.TableAdapter.Load(tbl, v)

                For Each row As EnrolmentRequestRow In tbl.Select()
                    row.PaymentStatus = "Paid"
                Next
                tbl.TableAdapter.Save(tbl)
            End If
        ElseIf SystemSettings.UseCapita Then

            Dim err As String = Request("errorCode")
            Dim errField As String = Request("errorField")

            If Len(err) > 0 Then
                Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing the result your payment. The payment may have been successful. Please contact the course provider to continue the process.</p><br/><br/>"))
                Me.Controls.Add(New LiteralControl("<p>Error Code:" & err.ToString & "</p><br/>"))
                Me.Controls.Add(New LiteralControl("<p>Error Details:" & errField.ToString & "</p>"))
            Else

                Dim result As String = Request("status")


                If Len(result) = 0 Then 'No response received
                    Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                    Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing the result your payment. The payment may have been successful. Please contact the course provider to continue the process.</p>"))

                Else
                    Try
                        Dim xd As New System.Xml.XmlDocument
                        xd.LoadXml(result)
                        Dim status As String = xd.GetElementsByTagName("statusCode")(0).InnerText
                        Dim paymentID As String = xd.GetElementsByTagName("uniqueTranID")(0).InnerText.TrimStart("0")
                        Dim message As String = xd.GetElementsByTagName("message")(0).InnerText
                        Dim authCode As String = xd.GetElementsByTagName("authCode")(0).InnerText

                        If status = "0" Then 'Accepted

                            Dim tbl As New EnrolmentRequestDataTable
                            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                            v.Columns.AddAllColumns(False, False)
                            v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, paymentID)
                            tbl.TableAdapter.Load(tbl, v)

                            For Each row As EnrolmentRequestRow In tbl.Select()
                                row.PaymentStatus = "Paid"
                            Next
                            tbl.TableAdapter.Save(tbl)

                            Me.Controls.Add(New LiteralControl(String.Format("<h2>{0}</h2>", message)))
                            Me.Controls.Add(New LiteralControl(String.Format("<h4>Auth Code: {0}</h2>", authCode)))


                        Else 'Declined

                            Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                            Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing your payment. Please contact the course provider to continue the enrolment process.</p>"))

                        End If
                    Catch ex As Exception
                        Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                        Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing the result your payment. The payment may have been successful. Please contact the course provider to continue the process.</p>"))

                    End Try

                End If
            End If
        ElseIf SystemSettings.UseCivica Then
            Dim strWebPaymentID As String = Request("WebPaymentID")
            Dim strResponseCode As String = Request("ResponseCode")
            Dim strResponseDescription As String = Request("ResponseDescription")
            Dim strOriginatorsReference As String = Request("OriginatorsReference")

            If Len(strResponseCode) > 0 Then

                If strResponseCode = "00000" Then 'success
                    Dim tbl As New EnrolmentRequestDataTable
                    Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                    v.Columns.AddAllColumns(False, False)
                    v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, strWebPaymentID)
                    tbl.TableAdapter.Load(tbl, v)

                    For Each row As EnrolmentRequestRow In tbl.Select()
                        row.PaymentStatus = "Paid"
                    Next
                    tbl.TableAdapter.Save(tbl)

                    Me.Controls.Add(New LiteralControl(String.Format("<h2>{0}</h2>", strResponseDescription)))
                    Me.Controls.Add(New LiteralControl(String.Format("<h4>Auth Code: {0}</h2>", strOriginatorsReference)))

                Else
                    Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                    Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing your payment. Please contact the college to continue the enrolment process.</p>"))
                    Me.Controls.Add(New LiteralControl("<p>Response Code: " & strResponseCode & " </p>"))
                    Me.Controls.Add(New LiteralControl("<p>Response: " & strResponseDescription & " </p>"))
                End If
            Else
                Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing the result your payment. The payment may have been successful.</p>"))

            End If
        ElseIf SystemSettings.UseBucksNet Then
            Dim crypto As New Crypto(SystemSettings.Payment_Secret)
            Dim nvc As NameValueCollection = HttpUtility.ParseQueryString(crypto.Decrypt(Request.Form("crypt")))

            Dim status As String = If(nvc("Success") = "1", "successful", "declined")
            Dim paymentid As String = nvc("orderno")
            Dim authcode As String = nvc("authcode")
            Dim description As String = nvc("status")

            If status = "successful" Then
                Dim tbl As New EnrolmentRequestDataTable
                Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                v.Columns.AddAllColumns(False, False)
                v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, paymentid)
                tbl.TableAdapter.Load(tbl, v)

                For Each row As EnrolmentRequestRow In tbl.Select()
                    row.PaymentStatus = "Paid"
                Next
                tbl.TableAdapter.Save(tbl)

                Me.Controls.Add(New LiteralControl(String.Format("<h2>Status: {0}</h2>", If(description = "A", "Approved", "Declined"))))
                Me.Controls.Add(New LiteralControl(String.Format("<h4>Auth Code: {0}</h2>", authcode)))
            Else
                Dim errcode As String = nvc("errdesc")
                Dim failreason As String = nvc("failreason")

                Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing your payment. Please contact the course provider to continue the enrolment process.</p>"))
                Me.Controls.Add(New LiteralControl(String.Format("<h4>Error description: {0}</h2>", errcode)))
                Me.Controls.Add(New LiteralControl(String.Format("<h4>Fail reason: {0}</h2>", failreason)))
            End If
        ElseIf SystemSettings.UseXPay Then
            Dim ResponseCode As String = Request("Rc")
            Dim ReceiptNumber As String = Request("RecNo")
            Dim AuthCode As String = Request("AuthCode")
            'Dim PaymentAmount As String = Request("Pmt")
            Dim Sid As String = Request("SID")

            If ResponseCode = "A" Then ''Approved
                Dim tbl As New EnrolmentRequestDataTable
                Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tbl)
                v.Columns.AddAllColumns(False, False)
                v.Filters.SetColumnFilter(tbl.WebPaymentIDColumn, Sid)
                tbl.TableAdapter.Load(tbl, v)

                For Each row As EnrolmentRequestRow In tbl.Select()
                    row.PaymentStatus = "Paid"
                Next
                tbl.TableAdapter.Save(tbl)

                Me.Controls.Add(New LiteralControl(String.Format("<h2>Status: {0}</h2>", If(ResponseCode = "A", "Approved", "Declined"))))
                Me.Controls.Add(New LiteralControl(String.Format("<h4>Auth Code: {0}</h2>", AuthCode)))


            Else ''Declined

                Me.Controls.Add(New LiteralControl("<h2>Process Complete</h2>"))
                Me.Controls.Add(New LiteralControl("<p>Your request has been received but there was a problem processing your payment. Please contact the course provider to continue the enrolment process.</p>"))
                Threading.Thread.Sleep(5000)
                Response.Redirect(GetResourceValue("thankyou_failpayment_aspx"))
            End If

        End If

        Threading.Thread.Sleep(5000)
        Response.Redirect(GetResourceValue("thankyou_aspx"))

    End Sub
End Class