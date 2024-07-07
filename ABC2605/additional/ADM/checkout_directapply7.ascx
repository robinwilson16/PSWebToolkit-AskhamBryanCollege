<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_directapply7.ascx.vb" Inherits="checkout_directapply" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>
<%@ Register Src="~/webcontrols/StudentSignature.ascx" TagPrefix="uc1" TagName="StudentSignature" %>

<div class="progress" style="height: 20px;">
  <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>
                <ol class="breadcrumb">
                    <li>Personal Details</li>
                    <li>Address</li>
                    <li>Supporting You</li>
                    <li>Contact Information</li>
                    <li>Education</li>
                    <li>Data Protection</li>
                    <li><strong>Monitoring and Supporting</strong></li>
                    </ol>

<div class="form-field-section grey">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
        DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none">


        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Course Name">
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
            <asp:BoundField DataField="TotalFeeAmount" HeaderText="Total Fees" DataFormatString="{0:c}" Visible="false">
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

    <br />
    <br />
    <h2 class="app-title">Monitoring and Supporting</h2>

    <p>To help us monitor and support our diverse College population we would appreciate your answers to the following questions - <b>these are optional and are not part of your application.</b></p>
    <p>Please feel free to not answer any question that is not applicable or that you do not wish to answer.</p>

    <p class="textfieldlabelrequired1">Do you have caring responsibilities? Please tick all that apply.</p>
    <p class="textfieldlabelrequired1">Do you have a disability and or a medical condition?</p>
    <p class="textfieldlabelrequired1">If you answered yes to the question above - please tell us if any of the below apply to you.</p>

     <div class="form-input">
        <cc1:StudentEnrolmentField StudentEnrolmentFieldType="EthnicGroupID" ID="StudentEnrolmentField12" runat="server" LabelWidth="500" IsRequired="false" CustomCaption="What is your ethnic group?" />
    </div>    

        <span class="textfieldlabelrequired1">What is your gender?</span>
    <asp:RadioButtonList ID="rdoGender" runat="server">
         <asp:ListItem Value="Agender" Text="Agender - Not having a gender or identifying with a gender"></asp:ListItem>
         <asp:ListItem Value="Bigender" Text="Bigender - Fluctuates between traditionally “male” and “female” gender-based behaviours and identities"></asp:ListItem>
         <asp:ListItem Value="Cisgender" Text="Cisgender - Gender identity and biological sex assigned at birth are the same"></asp:ListItem>
         <asp:ListItem Value="Gender Expression" Text="Gender Expression - The external display of one’s gender, through a combination of how they dress, how they act and other factors"></asp:ListItem>
         <asp:ListItem Value="Gender Fluid" Text="Gender Fluid - May always feel like a mix of the two traditional genders"></asp:ListItem>
         <asp:ListItem Value="Genderqueer" Text="Genderqueer - Does not identify with being a man or a woman"></asp:ListItem>
         <asp:ListItem Value="Gender Variant" Text="Gender Variant - Either by nature or by choice does not conform to gender-based expectations of society"></asp:ListItem>
         <asp:ListItem Value="Mx" Text="Mx. - Gender neutral, often the option of choice for folks who do not identify as cisgender"></asp:ListItem>
         <asp:ListItem Value="Non-Binary" Text="Non-Binary - Identity falls outside of the binary of male and female"></asp:ListItem>
         <asp:ListItem Value="Passing" Text="Passing - Gender variant, regarded to be, or 'passes' as a cisgender man or cisgender woman"></asp:ListItem>
         <asp:ListItem Value="Third Gender" Text="Third Gender - Does not identify with either man or woman, but identifies with another gender"></asp:ListItem>
         <asp:ListItem Value="Transgender" Text="Transgender - Lives as a member of a gender other than that expected based on sex assigned at birth"></asp:ListItem>
         <asp:ListItem Value="Transgender Man" Text="Transgender Man - Assigned female at birth but identifies and lives as a man"></asp:ListItem>
         <asp:ListItem Value="Transgender Woman" Text="Transgender Woman - Assigned male at birth but identifies and lives as a woman"></asp:ListItem>
         <asp:ListItem Value="Two-Spirit" Text="Two-Spirit - Individuals who possess qualities of both genders"></asp:ListItem>
         <asp:ListItem Value="Ze / Hir" Text="Ze / Hir - Prefer not to be identified as he/his or she/hers"></asp:ListItem>
         <asp:ListItem Value="Male / Man" Text="Male / Man"></asp:ListItem>
         <asp:ListItem Value="Female / Woman" Text="Female / Woman"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
         <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
    </asp:RadioButtonList>

        <span class="textfieldlabelrequired1">Does your gender identity match your gender as registered at birth (or within 6 weeks)?</span>   
    <asp:RadioButtonList ID="rdoMBGender" runat="server">
         <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
         <asp:ListItem Text="No" Value="No"></asp:ListItem>
         <asp:ListItem Text="Prefer not say" Value="Prefer not say"></asp:ListItem>    
    </asp:RadioButtonList>

        <span class="textfieldlabelrequired1">If you are a UK citizen, how would you describe your national identity?</span>
    <asp:RadioButtonList ID="rdoUKNationality" runat="server">
         <asp:ListItem Value="British" Text="British"></asp:ListItem>
         <asp:ListItem Value="English" Text="English"></asp:ListItem>
         <asp:ListItem Value="Irish" Text="Irish"></asp:ListItem>
         <asp:ListItem Value="Northern Irish" Text="Northern Irish"></asp:ListItem>
         <asp:ListItem Value="Scottish" Text="Scottish"></asp:ListItem>
         <asp:ListItem Value="Welsh" Text="Welsh"></asp:ListItem>
         <asp:ListItem Value="International" Text="International"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
         <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
    </asp:RadioButtonList>

        <span class="textfieldlabelrequired1">What is your religion or belief?</span>
    <asp:RadioButtonList ID="rdoReligion" runat="server">
         <asp:ListItem Value="Atheism/Agnosticism" Text="Atheism/Agnosticism - No beliefs or religion"></asp:ListItem>
         <asp:ListItem Value="Baha'i" Text="Baha'i"></asp:ListItem>
         <asp:ListItem Value="Buddism" Text="Buddism"></asp:ListItem>
         <asp:ListItem Value="Christianity" Text="Christianity"></asp:ListItem>
         <asp:ListItem Value="Confucianism" Text="Confucianism"></asp:ListItem>
         <asp:ListItem Value="Druze" Text="Druze"></asp:ListItem>
         <asp:ListItem Value="Gnosticism" Text="Gnosticism"></asp:ListItem>
         <asp:ListItem Value="Hinduism" Text="Hinduism"></asp:ListItem>
         <asp:ListItem Value="Islam" Text="Islam"></asp:ListItem>
         <asp:ListItem Value="Jainism" Text="Jainism"></asp:ListItem>
         <asp:ListItem Value="Judaism" Text="Judaism"></asp:ListItem>
         <asp:ListItem Value="Muslim" Text="Muslim"></asp:ListItem>
         <asp:ListItem Value="Rastafarianism" Text="Rastafarianism"></asp:ListItem>
         <asp:ListItem Value="Roman Catholic" Text="Roman Catholic"></asp:ListItem>
         <asp:ListItem Value="Shinto" Text="Shinto"></asp:ListItem>
         <asp:ListItem Value="Sikhism" Text="Sikhism"></asp:ListItem>
         <asp:ListItem Value="Taoism" Text="Taoism"></asp:ListItem>
         <asp:ListItem Value="Zoroastrianism" Text="Zoroastrianism"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
         <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
    </asp:RadioButtonList>

        <span class="textfieldlabelrequired1">Which of the following options best describes your sexual orientation?</span>
    <asp:RadioButtonList ID="rdoSexualOrientation" runat="server">
         <asp:ListItem Value="Allosexual" Text="Allosexual - Typically feels sexual attraction toward other people"></asp:ListItem>
         <asp:ListItem Value="Asexual" Text="Asexual - Experiences little or no sexual attraction to other people"></asp:ListItem>
         <asp:ListItem Value="Bisexual" Text="Bisexual - Feels attraction to both males and females"></asp:ListItem>
         <asp:ListItem Value="Demisexual" Text="Demisexual - Feels sexual attraction toward a person with whom they have already established a strong emotional bond"></asp:ListItem>
         <asp:ListItem Value="Gay / Homosexual" Text="Gay / Homosexual - Men with sexual attraction towards other men"></asp:ListItem>
         <asp:ListItem Value="Graysexual" Text="Graysexual - Experiences an infrequent sexual attraction towards others"></asp:ListItem>
         <asp:ListItem Value="Lesbian / Homosexual" Text="Lesbian / Homosexual - Women with sexual attractions towards other women"></asp:ListItem>
         <asp:ListItem Value="Omnisexual" Text="Omnisexual - Romantically, emotionally, or sexually attracted to persons of all genders and orientations"></asp:ListItem>
         <asp:ListItem Value="Pansexual" Text="Pansexual - Attracted – either emotionally, physically or both – to all genders"></asp:ListItem>
         <asp:ListItem Value="Polysexual" Text="Polysexual - Sexually and/or romantically attracted to multiple genders"></asp:ListItem>
         <asp:ListItem Value="Straight / Heterosexual" Text="Straight / Heterosexual - Romantically attracted to people of the opposite sex"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
         <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
    </asp:RadioButtonList>

        <span class="textfieldlabelrequired1">Have you ever undergone gender reassignment surgery?</span>
    <asp:RadioButtonList ID="rdoGenderSurgery" runat="server">
         <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
         <asp:ListItem Value="No" Text="No"></asp:ListItem>
         <asp:ListItem Value="Not Applicable" Text="Not Applicable"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
    </asp:RadioButtonList>        
    
        <span class="textfieldlabelrequired1">Are you pregnant or on maternity leave?</span>
    <asp:DropDownList ID="rdoPregnant" runat="server">
         <asp:ListItem Value="" Text="--please select--"></asp:ListItem>
         <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
         <asp:ListItem Value="No" Text="No"></asp:ListItem>
         <asp:ListItem Value="Not Applicable" Text="Not Applicable"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
    </asp:DropDownList>
    
        <span class="textfieldlabelrequired1">What is your Marital Status?</span>
    <asp:RadioButtonList ID="rdoMarried" runat="server">
         <asp:ListItem Value="Married / Partnership" Text="Married, or in a domestic partnership"></asp:ListItem>
         <asp:ListItem Value="Single" Text="Single"></asp:ListItem>
         <asp:ListItem Value="Divorced" Text="Divorced"></asp:ListItem>
         <asp:ListItem Value="Widowed" Text="Widowed"></asp:ListItem>
         <asp:ListItem Value="Separated" Text="Separated"></asp:ListItem>
         <asp:ListItem Value="Civil Partnership" Text="Civil Partnership"></asp:ListItem>
         <asp:ListItem Value="Prefer not to say" Text="Prefer not to say"></asp:ListItem>
         <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
    </asp:RadioButtonList>

    <p> If you require a blank paper copy of this form please click here - <a href="https://bit.ly/33ke1Tu" target="_blank">https://bit.ly/33ke1Tu</a> </p>
    <p> Printed or paper copies of this form should be returned to:</p>
    <p>The Applications Team, Askham Bryan College, Askham Bryan, York, YO23 3FR or scan by email to <a href="mailto:applications@askham-bryan.ac.uk">applications@askham-bryan.ac.uk</a></p>

</div>

    <cc1:CCCButton ID="btnBack" runat="server" Text="Back" CssClass="button" />
    <cc1:CCCButton ID="btnContinue" runat="server" Text="Submit" CausesValidation="true" CssClass="button" />

<br />
<asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />

