Imports Microsoft.VisualBasic
Imports Newtonsoft.Json

Public Class Course
    <JsonProperty(PropertyName:="academicYear", Order:=1)>
    Public AcademicYear As String

    <JsonProperty(PropertyName:="facultyCode", Order:=2)>
    Public FacultyCode As String

    <JsonProperty(PropertyName:="facultyName", Order:=3)>
    Public FacultyName As String

    <JsonProperty(PropertyName:="teamCode", Order:=4)>
    Public TeamCode As String

    <JsonProperty(PropertyName:="teamName", Order:=5)>
    Public TeamName As String

    <JsonProperty(PropertyName:="siteCode", Order:=6)>
    Public SiteCode As String

    <JsonProperty(PropertyName:="siteName", Order:=7)>
    Public SiteName As String

    <JsonProperty(PropertyName:="courseId", Order:=8)>
    Public CourseID As Integer

    <JsonProperty(PropertyName:="courseCode", Order:=9)>
    Public CourseCode As String

    <JsonProperty(PropertyName:="courseTitle", Order:=10)>
    Public CourseTitle As String

    <JsonProperty(PropertyName:="courseInformationCode", Order:=11)>
    Public CourseInformationCode As String

    <JsonProperty(PropertyName:="courseInformationTitle", Order:=12)>
    Public CourseInformationTitle As String

    <JsonProperty(PropertyName:="offeringTypeCode", Order:=13)>
    Public OfferingTypeCode As Integer?

    <JsonProperty(PropertyName:="offeringTypeName", Order:=14)>
    Public OfferingTypeName As String

    <JsonProperty(PropertyName:="enrolmentTypeCode", Order:=15)>
    Public EnrolmentTypeCode As Integer?

    <JsonProperty(PropertyName:="enrolmentTypeName", Order:=16)>
    Public EnrolmentTypeName As String

    <JsonProperty(PropertyName:="suitableFor", Order:=17)>
    Public SuitableFor As String

    <JsonProperty(PropertyName:="aimCode", Order:=18)>
    Public AimCode As String

    <JsonProperty(PropertyName:="aimTitle", Order:=19)>
    Public AimTitle As String

    <JsonProperty(PropertyName:="startDate", Order:=20)>
    Public StartDate As DateTime?

    <JsonProperty(PropertyName:="endDate", Order:=21)>
    Public EndDate As DateTime?
End Class
