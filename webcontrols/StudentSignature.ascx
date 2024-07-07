<%@ Control Language="VB" AutoEventWireup="false" CodeFile="StudentSignature.ascx.vb" Inherits="webcontrols_StudentSignature" %>
<style>
    #signature {
        width:500px;
    }
</style>   

<div class="form-group">
       <p>Signature</p>
       <div id="signature"></div>
    <div class="btn btn-danger" id="clear" data-action="clear"> Clear Signature
    <%--    <p><small><i>Press to reset signature</i></small></p>--%>
   </div>
    </div>
	
<asp:HiddenField runat="server" ID="hidSignature" ClientIDMode="Static" />
 <!--[if lt IE 9]>
	<script type="text/javascript" src="scripts/jSignature/flashcanvas.js"></script>
	<![endif]-->
	<script src="scripts/jSignature/jSignature.min.js"></script>
<script>
    $(document).ready(function () {
        $("#signature").jSignature()

        $("#signature").bind('change', function (e) {
            var datapair = $("#signature").jSignature("getData", "base30")
            $("#hidSignature").val(datapair);
        })

        $("#clear").bind('click', function (e) {
            var $sigdiv = $("#signature");
            $sigdiv.jSignature("reset");
        })

    });

</script>