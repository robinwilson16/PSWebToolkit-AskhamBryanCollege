Imports System.Collections.Generic
Imports System.IO
Imports System.Net
Imports System.Threading.Tasks
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports Microsoft.VisualBasic
Imports Newtonsoft.Json

Public Class GetProSolutionData

    Public Shared Function GetOfferingID() As Integer
        Dim offeringID As Integer

        If CInt(HttpContext.Current.Request.QueryString("OfferingID")) > 0 Then
            offeringID = CInt(HttpContext.Current.Request.QueryString("OfferingID"))
        ElseIf Not IsNothing(WorkingData.ShoppingCart.Items(0).OfferingID) Then
            offeringID = WorkingData.ShoppingCart.Items(0).OfferingID
        Else
            offeringID = Nothing
        End If

        Return offeringID
    End Function

    Public Shared Function GetCourseByCode(courseCode As String) As Course
        Dim course As Course

        If Not IsNothing(courseCode) Then
            courseCode = courseCode.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Code/" & courseCode & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        course = JsonConvert.DeserializeObject(Of Course)(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            course = Nothing
        End If

        Return course
    End Function

    Public Shared Function GetCourseByID(courseID As Integer) As Course
        Dim course As Course

        If courseID > 0 Then
            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/OfferingID/" & courseID & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        course = JsonConvert.DeserializeObject(Of Course)(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            course = Nothing
        End If

        Return course
    End Function

    Public Shared Function GetTeams() As IList(Of Team)
        Dim teams As IList(Of Team)

        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Team/")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    teams = JsonConvert.DeserializeObject(Of IList(Of Team))(jsonString)

                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return teams
    End Function

    Public Shared Function GetTeamsEnquire() As IList(Of Team)
        Dim teams As IList(Of Team)


        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Team/Enquire")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    teams = JsonConvert.DeserializeObject(Of IList(Of Team))(jsonString)


                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return teams
    End Function

    Public Shared Function GetTeamsApply() As IList(Of Team)
        Dim teams As IList(Of Team)
        'Dim teamsDistinct As IList(Of Team)
        'Dim teamCode As String

        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Team/Apply")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    teams = JsonConvert.DeserializeObject(Of IList(Of Team))(jsonString)
                    'teamsDistinct = New List(Of Team)
                    'teamCode = ""

                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        'For Each team As Team In teams
        '    If team.TeamCode <> teamCode Then
        '        teamsDistinct.Add(team)
        '    End If

        '    teamCode = team.TeamCode
        'Next

        Return teams
    End Function

    Public Shared Function GetTeamsEnrol() As IList(Of Team)
        Dim teams As IList(Of Team)


        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Team/Enrol")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    teams = JsonConvert.DeserializeObject(Of IList(Of Team))(jsonString)


                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return teams
    End Function

    Public Shared Function GetTeamByCode(teamCode As String) As Team
        Dim team As Team

        If Not IsNothing(teamCode) Then
            teamCode = teamCode.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Team/" & teamCode & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        team = JsonConvert.DeserializeObject(Of Team)(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            team = Nothing
        End If

        Return team
    End Function

    Public Shared Function GetCourses() As IList(Of Course)
        Dim courses As IList(Of Course)

        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return courses
    End Function

    Public Shared Function GetCoursesEnquire() As IList(Of Course)
        Dim courses As IList(Of Course)


        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Enquire")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return courses
    End Function

    Public Shared Function GetCoursesEnquire(teamCode As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) Then
            teamCode = teamCode.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Enquire/" & teamCode)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesApply() As IList(Of Course)
        Dim courses As IList(Of Course)


        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Apply")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return courses
    End Function

    Public Shared Function GetCoursesApply(teamCode As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) Then
            teamCode = teamCode.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Apply/" & teamCode)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesEnrol() As IList(Of Course)
        Dim courses As IList(Of Course)


        Using webClient As WebClient = New WebClient()
            Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Enrol")
                Using streamReader As StreamReader = New StreamReader(stream)
                    Dim jsonString As String = streamReader.ReadToEnd()

                    'Best way using built in deseralizer
                    'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                    'Way using NewtonSoft deserializer due to bug in this .NET version
                    courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                    'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                End Using
            End Using
        End Using

        Return courses
    End Function

    Public Shared Function GetCoursesEnrol(teamCode As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) Then
            teamCode = teamCode.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Enrol/" & teamCode)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearch(search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(search) Then
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/" & search & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearch(teamCode As String, search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) And Not IsNothing(search) Then
            teamCode = teamCode.Replace("/", "|")
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/" & teamCode & "/" & search)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearchEnquire(search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(search) Then
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/Enquire/" & search & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearchEnquire(teamCode As String, search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) And Not IsNothing(search) Then
            teamCode = teamCode.Replace("/", "|")
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/Enquire/" & teamCode & "/" & search)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearchApply(search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(search) Then
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/Apply/" & search & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearchApply(teamCode As String, search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) And Not IsNothing(search) Then
            teamCode = teamCode.Replace("/", "|")
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/Apply/" & teamCode & "/" & search)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearchEnrol(search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(search) Then
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/Enrol/" & search & "/")
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function

    Public Shared Function GetCoursesSearchEnrol(teamCode As String, search As String) As IList(Of Course)
        Dim courses As IList(Of Course)

        If Not IsNothing(teamCode) And Not IsNothing(search) Then
            teamCode = teamCode.Replace("/", "|")
            search = search.Replace("/", "|")

            Using webClient As WebClient = New WebClient()
                Using stream As Stream = webClient.OpenRead("https://mis.askham-bryan.ac.uk/ProSolutionData/Course/Search/Enrol/" & teamCode & "/" & search)
                    Using streamReader As StreamReader = New StreamReader(stream)
                        Dim jsonString As String = streamReader.ReadToEnd()

                        'Best way using built in deseralizer
                        'Dim allitems As IList(Of DevolvedAreaPostCode) = JsonSerializer.Deserialize(Of IList(Of DevolvedAreaPostCode))(jsonString)

                        'Way using NewtonSoft deserializer due to bug in this .NET version
                        courses = JsonConvert.DeserializeObject(Of IList(Of Course))(jsonString)


                        'CourseJSON.Text = Teams(6).TeamName 'Test for sixth element
                    End Using
                End Using
            End Using
        Else
            courses = Nothing
        End If

        Return courses
    End Function
End Class
