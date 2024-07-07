<%@ Page Language="vb" AutoEventWireup="false" Inherits="GenericError" CodeFile="GenericError.aspx.vb" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>ProSolution Web Enrolments - Application Error </title>
    <%--<link href="content/bootstrap.min.css" rel="stylesheet" />--%>
    <%--<script src="js/holder.js"></script>--%>
    <link rel="stylesheet" type="text/css" media="print" href="/PSWebEnrolment/content/ProSolutionPrint.css" />
<link rel="stylesheet" type="text/css" href="/PSWebEnrolment/content/custom.css" />
<link rel="stylesheet" type="text/css" href="/PSWebEnrolment/Scripts/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/PSWebEnrolment/Scripts/font-awesome/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="/PSWebEnrolment/content/abc.css" />
<link rel="stylesheet" type="text/css" href="/PSWebEnrolment/content/breadcrumb.css" />
<link rel="stylesheet" type="text/css" href="/PSWebEnrolment/content/callout.css" />
<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/south-street/jquery-ui.css" />
<script type="text/javascript" src="/PSWebEnrolment/Scripts/respond.min.js"></script><script type="text/javascript" src="/PSWebEnrolment/Scripts/html5shiv.js"></script><script type="text/javascript" src="/PSWebEnrolment/Scripts/toastr.min.js"></script><script type="text/javascript" src="/PSWebEnrolment/Scripts/bootstrap/js/bootstrap.bundle.min.js"></script><script type="text/javascript" src="/PSWebEnrolment/Scripts/custom.js"></script><script type="text/javascript" src="https://cdn.getaddress.io/scripts/getaddress-autocomplete-native-1.0.2.min.js"></script><script type="text/javascript" src="/PSWebEnrolment/Scripts/abc.js"></script>
    <style>
        body {
            background-color: #808080;
        }

        .container {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body style="padding:20px">
    <form id="Form1" method="post" runat="server">
        <div class="container White mt-4">
            <div class="row">
                <div class="col-md text-center TopLogo mt-4">
                    <svg>
                        <use xlink:href="_images/sprite.svg#logo"></use>
                    </svg>
                </div>
            </div>
            
        </div>
    <div class="container">
            <div class="row">
                <div class="col-md White">
                    <div class="body-content" id="content">  
                        <div class="container mt-5 mb-3">
                            <div class="row">
                                <div class="col-md">
                                    <%If ImageTooLarge = True %>


                                        <div class="alert alert-danger" role="alert">
                                            <div class="row">
                                                <div class="col-md-auto d-flex align-items-center">
                                                    <h1><i class="fa-solid fa-download"></i></h1>
                                                </div>
                                                <div class="col-md">
                                                    The size of the file you uploaded was too large. Please go back and try again with a smaller file.
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md text-center">
                                                    <a class="btn btn-danger" href="javascript:history.back()" title="Return to previous page"><i class="fa-solid fa-rotate-left"></i> Try Again With A Smaller File</a>
                                                </div>
                                            </div>
                                        </div>
                                    <%Else %>
                                         <div class="text-center" style="margin: 10px">
                                                         <img class="img-responsive errorLogo" src="_images/advanced-logo-header.png" alt="College Logo"/><br/>
                                                         <strong>
                                                 An unexpected application error has occured.
                                             </strong>
                                         </div>

 
                                         <dl class="dl-horizontal">

                                         <dt>Error Message:</dt>
                                         <dd><pre><strong><asp:Label CssClass="text-danger" ID="lblErrorMessage" runat="server"></asp:Label></strong></pre></dd>
 
                                         <dt>Type of Error:</dt>
                                         <dd><pre><asp:Label ID="lblErrorType" runat="server"></asp:Label></pre></dd>

                                         <dt>Referring Page:</dt>
                                         <dd><pre><asp:Label ID="lblErrorPage" runat="server"></asp:Label></pre></dd>

                                        <%-- <dt>Error Location:</dt>
                                         <dd><pre><asp:Label ID="lblErrorLocation" runat="server"></asp:Label></pre></dd>
                                         </dl>--%>

     
 
                                         <a class="btn btn-danger" href="javascript:history.back()" title="Return to previous page">Return to previous page</a>
                                    <%End If %>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
