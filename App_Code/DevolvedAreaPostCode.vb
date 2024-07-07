Imports Microsoft.VisualBasic
Imports Newtonsoft.Json

Public Class DevolvedAreaPostCode
    <JsonProperty(PropertyName:="devolvedAreaPostCodeID", Order:=1)>
    Public DevolvedAreaPostCodeID As Integer?

    <JsonProperty(PropertyName:="postCode", Order:=1)>
    Public PostCode As String

    <JsonProperty(PropertyName:="fundingSourceCode", Order:=1)>
    Public FundingSourceCode As String

    <JsonProperty(PropertyName:="fundingSourceName", Order:=1)>
    Public FundingSourceName As String

    <JsonProperty(PropertyName:="effectiveStartDate", Order:=1)>
    Public EffectiveStartDate As DateTime?

    <JsonProperty(PropertyName:="effectiveEndDate", Order:=1)>
    Public EffectiveEndDate As DateTime?

    <JsonProperty(PropertyName:="isSOFOffered", Order:=1)>
    Public IsSOFOffered As Boolean
End Class
