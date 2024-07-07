Imports Microsoft.VisualBasic
Imports Newtonsoft.Json

Public Class Team
    <JsonProperty(PropertyName:="teamCode", Order:=1)>
    Public TeamCode As String

    <JsonProperty(PropertyName:="teamName", Order:=2)>
    Public TeamName As String
End Class
