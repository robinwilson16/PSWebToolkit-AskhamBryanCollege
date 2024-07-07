Imports Microsoft.VisualBasic
Imports Newtonsoft.Json

Public Class Course
    <JsonProperty(PropertyName:="facultyCode", Order:=1)>
    Public FacultyCode As String

    <JsonProperty(PropertyName:="facultyName", Order:=2)>
    Public FacultyName As String

    <JsonProperty(PropertyName:="teamCode", Order:=3)>
    Public TeamCode As String

    <JsonProperty(PropertyName:="teamName", Order:=4)>
    Public TeamName As String

    <JsonProperty(PropertyName:="siteCode", Order:=5)>
    Public SiteCode As String

    <JsonProperty(PropertyName:="siteName", Order:=6)>
    Public SiteName As String

    <JsonProperty(PropertyName:="courseId", Order:=7)>
    Public CourseID As Integer

    <JsonProperty(PropertyName:="courseCode", Order:=8)>
    Public CourseCode As String

    <JsonProperty(PropertyName:="courseTitle", Order:=9)>
    Public CourseTitle As String

    <JsonProperty(PropertyName:="courseInformationCode", Order:=10)>
    Public CourseInformationCode As String

    <JsonProperty(PropertyName:="courseInformationTitle", Order:=11)>
    Public CourseInformationTitle As String

    <JsonProperty(PropertyName:="offeringTypeCode", Order:=12)>
    Public OfferingTypeCode As Integer

    <JsonProperty(PropertyName:="offeringTypeName", Order:=13)>
    Public OfferingTypeName As String

    <JsonProperty(PropertyName:="enrolmentTypeCode", Order:=14)>
    Public EnrolmentTypeCode As Integer

    <JsonProperty(PropertyName:="enrolmentTypeName", Order:=15)>
    Public EnrolmentTypeName As String

    <JsonProperty(PropertyName:="suitableFor", Order:=16)>
    Public SuitableFor As String

    <JsonProperty(PropertyName:="aimCode", Order:=17)>
    Public AimCode As String

    <JsonProperty(PropertyName:="aimTitle", Order:=18)>
    Public AimTitle As String

    <JsonProperty(PropertyName:="startDate", Order:=19)>
    Public StartDate As DateTime?

    <JsonProperty(PropertyName:="endDate", Order:=20)>
    Public EndDate As DateTime?
End Class
