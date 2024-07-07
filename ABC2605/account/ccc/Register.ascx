<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Register.ascx.vb" Inherits="account_ccc_Register" %>

<br /><br />
<ol class="breadcrumb">
    <li><a href="default.aspx">Home</a></li>
    <li class="active">Register</li>
</ol>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css" />
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.js"></script>


<br /><br />


<div class="form-field-section grey">
    <div class="panel-heading">Register an account</div>
        <div>         
            
                <%--<form  id="registerform">--%>
                
                    <div class=" form-group">
                         <label for="firstname" class="label2 textfieldlabelrequired">First Name</label>
                        <input type="text" id="firstname" class="form-control" name="pre[firstname]" placeholder="Your first name here..." autocomplete="off" required autofocus  />
                    </div>
                    <div class=" form-group">
                         <label for="surname" class="label2 textfieldlabelrequired">Surname</label>
                        <input type="text" id="surname" class="form-control" name="pre[surname]" placeholder="Your surname here..." autocomplete="off" required />
                    </div>
                    <div class=" form-group">
                         <label for="title" class="label2 textfieldlabelrequired">Title</label>
                        <select id="title" class="form-control" name="pre[title]" title="Title" >
                            <option></option>
                            <option>Mr</option>
                            <option>Mrs</option>
                            <option>Miss</option>
                            <option>Ms</option>
                            <option>Dr</option>
                            <option>Br</option>
                        </select>                  
                    </div>
                    <div class=" form-group">
                         <label for="sex" class="label2 textfieldlabelrequired">Sex</label>
                        <select  id="sex" class="form-control" name="pre[sex]" title="Sex">
                            <option></option>
                            <option title="Male">M</option>
                            <option title="Female">F</option>
                        </select>                      
                    </div>
                    <div class=" form-group">
                         <label for="dob" class="label2 textfieldlabelrequired">Date of Birth</label>
                        <input id="dob" class="form-control" name="pre[dateofbirth]" autocomplete="off"  />
                    </div>
                    <div class=" form-group">
                         <label for="address1" class="label2">Address Line 1</label>
                        <input type="text" id="address1" class="form-control" name="pre[address1]"  autocomplete="off" />
                    </div>
                    <div class=" form-group">
                         <label for="address2" class="label2">Address Line 2</label>
                        <input type="text" id="address2" class="form-control" name="pre[address2]"  autocomplete="off" />
                    </div>
                    <div class=" form-group">
                         <label for="address3" class="label2">Address Line 3</label>
                        <input type="text" id="address3" class="form-control" name="pre[address3]"  autocomplete="off" />
                    </div>
                     <div class=" form-group">
                         <label for="address4" class="label2">Address Line 4</label>
                        <input type="text" id="address4" class="form-control" name="pre[address4]"  autocomplete="off" />
                    </div>
                    <div class=" form-group">
                         <label for="postcode" class="label2">Postcode</label>
                        <input type="text" id="postcode" class="form-control" name="pre[postalcode]" placeholder="Your postcode here..." autocomplete="off" />
                    </div>
                    <div class=" form-group">
                         <label for="email" class="label2 textfieldlabelrequired">Email</label>
                        <input type="email" id="email" class="form-control" name="pre[email]" placeholder="Your E-mail here..." autocomplete="off" required />
                    </div>                   
                    <div class=" form-group">
                        <label for="password" class="label2 textfieldlabelrequired">Password</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Your password here..." autocomplete="off" required />
                    </div>
                    <div class=" form-group">
                        <label for="password_mirror" class="label2 textfieldlabelrequired">Retype Password</label>
                        <input type="password" id="password_mirror" name="password_mirror" class="form-control"  placeholder="Retype your password..." autocomplete="off" required  oninput="check(this)"/>
                    </div>
                   
                    <div class=" form-group">
                        
                       <%--<input type="submit" value="Register" id="register" runat="server"/>--%>
                       <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="button"/>
                        
                    </div>
            <div class=" form-group" style="text-align:center;">
            <label id="lblError" runat="server" visible="false" class="text-center text-danger"></label>
               </div>
                <%--</form>--%>
            </div>

       <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
    </div>

<script>
    function check(input) {
        if (input.value !== $("#password").val()) {
            input.setCustomValidity('Password does not match.');
        } else {
            // input is fine -- reset the error message
            input.setCustomValidity('');
        }
    }
    
</script>

<style>
    .label2 {display:inline-block;width:200px;}
</style>