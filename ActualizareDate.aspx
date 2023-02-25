<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActualizareDate.aspx.cs" Inherits="ActualizareDate" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <asp:Label ID="Label1" runat="server" Text="Introduceti numele angajatului:"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtNumeCautat" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnCauta" runat="server" OnClick="btnCauta_Click" Text="Cauta angajat" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
        </asp:GridView>
        <br />

         <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblID" runat="server" Text="ID:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtID" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
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
                    <asp:Button ID="btnActualizare" runat="server" OnClick="btnActualizare_Click" Text="Actualizare date" />
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Renuntare" />
                </td>
            </tr>
            </table>
    </form>
</body>
</html>
