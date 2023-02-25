<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdaugareAngajati.aspx.cs" Inherits="AdaugareAngajati" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            font-weight: 700;
            color: #FFFFFF;
            background-color: #FFFFFF;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    
        <asp:Panel ID="Panel1" runat="server" BackColor="#0099CC" Height="123px">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
                    </asp:Timer>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Image ID="Image2" runat="server" Height="30px" Width="73px" />
                    &nbsp;&nbsp;
                    <asp:Image ID="Image1" runat="server" Height="30px" Width="73px" />
                    <asp:Label ID="lblData" runat="server" ForeColor="Black"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    
    </div>
        <nav id="nav" style="background-color: #B5C7DE;">
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Orientation="Horizontal" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="50px" VerticalPadding="10px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem Text="Acasa" Value="Acasa" NavigateUrl="~/Home.aspx"></asp:MenuItem>
                <asp:MenuItem Text="Introducere date" Value="Introducere date">
                    <asp:MenuItem Text="Actualizare date" Value="Actualizare date" NavigateUrl="~/ActualizareDate.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Adaugare date" Value="Adaugare date" NavigateUrl="~/AdaugareAngajati.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Stergere date" Value="Stergere date" NavigateUrl="~/StergereDate.aspx"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Modificari procente" Value="Modificari procente" NavigateUrl="~/ModificareProcente.aspx"></asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="50px" VerticalPadding="10px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
        </nav>
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblNume" runat="server" ForeColor="Black" Text="Nume:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtNume" runat="server" ForeColor="Black"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNume" ErrorMessage="Numele trebuie sa contina doar litere" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblPrenume" runat="server" ForeColor="Black" Text="Prenume:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPrenume" runat="server" ForeColor="Black"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrenume" ErrorMessage="Prenumele trebuie sa contina doar litere" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Functie:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFunctie" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Functia trebuie sa contina doar litere" ForeColor="Red" ControlToValidate="txtFunctie" ValidationExpression="^[a-zA-Z\s]{1,40}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="Salar de Baza:"></asp:Label>
                    :</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtSalardeBaza" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Salarul de baza trebuie sa fie un numar &gt;= 0" ForeColor="Red" ControlToValidate="txtSalardeBaza" ValidationExpression="^[0-9]$|^[1-9][0-9]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" ForeColor="Black" Text="Spor:"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtSpor" runat="server">0</asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Sporul trebuie sa fie 0-100%" ForeColor="Red" ControlToValidate="txtSpor" ValidationExpression="^[0-9]$|^[1-9][0-9]$|^(100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label8" runat="server" ForeColor="Black" Text="Premii Brute"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPremiiBrute" runat="server">0</asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Premiile Brute trebuie sa fie &gt;= 0" ForeColor="Red" ControlToValidate="txtPremiiBrute" ValidationExpression="^[0-9]$|^[1-9][0-9]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label14" runat="server" ForeColor="Black" Text="Retineri"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtRetineri" runat="server">0</asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Retinerile trebuie sa fie &gt;= 0" ForeColor="Red" ControlToValidate="txtRetineri" ValidationExpression="^[0-9]$|^[1-9][0-9]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="Total Brut"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtBrutImpozitabil" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label12" runat="server" ForeColor="Black" Text="Impozit"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtImpozit" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label runat="server" ForeColor="Black" Text="CAS"></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtCAS" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label13" runat="server" ForeColor="Black" Text="CASS"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtCASS" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label10" runat="server" ForeColor="Black" Text="Brut Impozitabil"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtTotalBrut" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label15" runat="server" ForeColor="Black" Text="Virat Card"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtViratCard" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label16" runat="server" ForeColor="Black" Text="Poza"></asp:Label>
                    <br />
                    <asp:Image ID="imgAngajat" runat="server" Height="158px" Width="178px" ImageUrl="~/pic/profile.png" />
                </td>
                <td class="auto-style6">
                    <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Black" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAdauga" runat="server" Text="Adauga Angajat" OnClick="btnAdauga_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Resetare date introduse" OnClick="btnReset_Click" />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
