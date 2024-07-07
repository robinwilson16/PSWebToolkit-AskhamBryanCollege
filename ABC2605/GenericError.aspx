<%@ Page Language="vb" AutoEventWireup="false" Inherits="GenericError" CodeFile="GenericError.aspx.vb" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>ProSolution Web Enrolments - Application Error </title>
    <link href="content/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="js/holder.js"></script>--%>
</head>
<body style="padding:20px">
    <form id="Form1" method="post" runat="server">
    <div>
        
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
    </div>
    </form>
</body>
</html>
