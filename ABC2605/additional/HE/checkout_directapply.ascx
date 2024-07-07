<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 16.6%;" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li><strong>Personal Details</strong></li>
                    <li id="liEmergency" runat="server">Emergency Contact Details</li>                   
                    <li>Employment Qualifications and References</li>
                    <li>Personal Statement</li>
                    <li>Supporting You</li>
                    <li>Data Protection</li>
                    </ol>



<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="CourseInformation" HeaderText="Course Name">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date"
                HtmlEncode="False">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
            <asp:BoundField DataField="SiteDescription" HeaderText="Site" />
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="true">
                <ControlStyle CssClass="searchgridfield" />
            </asp:BoundField>
        </Columns>
        <RowStyle CssClass="searchgridcell" />
        <HeaderStyle CssClass="searchgridheader" />
        <EmptyDataTemplate>
            <p>
                No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.
            </p>
        </EmptyDataTemplate>
    </asp:GridView>
</div>



<div class="form-field-section grey">
    <h2 class="app-title">Personal Details</h2>
    <hr />

    <p><strong>Please note that all fields on this form marked with a <span class="textfieldlabelrequired"></span> must be completed in order to submit the form.</strong></p>

    <br />

    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo"  ID="StudentEnrolmentFieldRefNo" CustomCaption ="Student ID" runat="server" Visible="false" IsRequired="false" LabelWidth="300" />
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Title" ID="StudentEnrolmentField3" runat="server" IsRequired="true" LabelWidth="300" />
        </div>
    </div>
    
    <div class="row">
        <div class="col-sm-6 columns form-group">
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="FirstForename" ID="StudentEnrolmentField1" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Forenames or given name" />
                </div>
    
        <div class="col-sm-6 columns form-group">       
            <cc1:StudentEnrolmentField StudentEnrolmentFieldType="Surname" ID="fldSurname" runat="server" IsRequired="true" LabelWidth="300" CustomCaption="Surname or family name" />
                </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEnrolmentField ID="datepicker" runat="server" IsRequired="true" StudentEnrolmentFieldType="DateOfBirth" CustomCaption ="Date of Birth" LabelWidth="300" ClientIDMode="Static" Placeholder="dd/mm/yyyy" />
                </div>
    </div>

    <hr />

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
    <h5>Address and Contact Details</h5>
                </div>
    </div>


<%--    <div class="row">
      <div class="col-sm-6 columns form-group"><p>Quickly find your address, enter postcode or partial address below:</p>
<p><asp:TextBox ID="txtLookup" runat="server" CssClass="formtext" ></asp:TextBox>
<asp:Button ID="btnFind" runat="server" Text="Find" CausesValidation="False" /></p>
          <div id="divlstResult" runat="server" visible="true"><asp:ListBox ID="lstresult" runat="server"  AutoPostBack="True" Width="400"></asp:ListBox></div>
          </div>
        </div>--%>

    <p><strong>Home/Permanent address</strong></p>

  <div id="divAddresslines" runat="server" visible="true">
    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="txtAddress1" StudentEnrolmentFieldType="Address1" IsRequired="true" CustomCaption="Address Line 1"/>
                </div>
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="txtAddress2" StudentEnrolmentFieldType="Address2" CustomCaption="Address Line 2"/>
                </div>
    </div>
  
    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="txtAddress3" StudentEnrolmentFieldType="Address3" IsRequired="false" CustomCaption="Address Line 3"/>
                </div>
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField runat="server" ID="txtAddress4" StudentEnrolmentFieldType="Address4" CustomCaption="Address Line 4" />
                </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group"> 
            <input type="text" runat="server" id="postcode" title="Postcode" placeholder="Enter postcode here" maxlength="9" Pattern="^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$" />
                </div>
           
    </div>

  </div>

    <div class="row">
        <div class="col-sm-12 columns form-group">  <p><strong>You must provide at least one phone number below:</strong></p>
                </div>
    </div>

    <div class="row">
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField CustomCaption="* Home phone (inc. STD code)" LabelWidth="350" StudentEnrolmentFieldType="Tel" ID="StudentEnrolmentField5" runat="server" title="The format of the home telephone must be a UK standard number begining with 0, with no spaces eg 01273800900" Pattern="^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$"/>
                </div>
       
        <div class="col-sm-6 columns form-group"> 
            <cc1:StudentEnrolmentField CustomCaption="* Personal Mobile" StudentEnrolmentFieldType="MobileTel" ID="StudentEnrolmentField2" runat="server" title="The format of the mobile must be beginning 07, with no spaces and 11 digits in length eg 07771900900" Pattern="^(07[\d]{8,12}|447[\d]{7,11})$"/>
                </div>
    </div>

    <div class="row">
        <div class="col-sm-12 columns form-group">
            <cc1:StudentEmailField StudentEnrolmentFieldType="EmailAddress" ID="StudentEnrolmentField7" runat="server" IsRequired="true" LabelWidth="300" Pattern="^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$" Title="Please enter a valid email address - a@b.c" CustomCaption="Personal Email" />
                </div>
    </div>

    <p><strong>PLEASE ENSURE YOU PROVIDE ACCURATE CONTACT DETAILS FOR CORRESPONDENCE SUCH AS TEXT ALERTS.</strong></p>

</div>


 <cc1:CCCButton ID="btnBack" runat="server" Text="Start Again" LinkResource="courseapply_HEapp_aspx" CssClass="button" Visible ="true" /> 
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="button" />
<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />




   