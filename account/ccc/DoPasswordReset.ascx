<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DoPasswordReset.ascx.vb" Inherits="account_ccc_DoPasswordReset" %>

<nav aria-label="Breadcrumb navigation">
    <ol class="breadcrumb">
        <li><a href="default.aspx">Home</a></li>
        <li class="active" aria-current="page">Reset Password</li>
    </ol>
</nav>
<div class="panel panel-info">
    <div class="panel-heading">To change your password, enter your new password below</div>

    <div class=" form-group">
        <label for="passwordnew" class="label2 ">New Password</label>
        <a id="lnkMinRequirements" runat="server" clientidmode="Static" data-toggle="tooltip" data-placement="top" data-html="true" title="Tooltip on top" href="javascript:void(0)">(Minimum Requirements)
        </a>
        <input type="password" id="passwordnew" name="passwordnew" class="form-control" placeholder="New password here..." autocomplete="off" />

    </div>
    <div class=" form-group">
        <label for="password_mirror" class="label2 ">Retype New Password</label>
        <input type="password" id="password_mirror" name="password_mirror" class="form-control" placeholder="Retype your new password..." autocomplete="off" oninput="check(this)" />
    </div>

    <div class=" form-group">
        <p runat="server" id="errtext"></p>
    </div>
    <div class=" form-group">

        <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary btn-block" />

    </div>
</div>
<div class=" form-group">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" role="alert" ForeColor="" />
</div>
<script type="text/javascript" src="<%= ResolveUrl("~/account/ccc/DoPasswordReset.js") %>"></script>
