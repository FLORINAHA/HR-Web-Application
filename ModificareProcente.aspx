<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModificareProcente.aspx.cs" Inherits="ModificareProcente" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 127px;
        }
        .auto-style2 {
            width: 250px;
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
        <asp:Label ID="lblParola" runat="server" Text="Introduceti parola:"></asp:Label>
        <br />
        <asp:TextBox ID="txtParola" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnConectare" runat="server" Text="Conectare" OnClick="btnConectare_Click" />
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblCAS" runat="server" Text="CAS"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtCAS" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCAS" ErrorMessage="CAS-ul trebuie sa fie intre 0-100 (%)" ForeColor="Red" ValidationExpression="^([0-9]|[1-9][0-9]|100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblCASS" runat="server" Text="CASS"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtCASS" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCASS" ErrorMessage="CASS-ul trebuie sa fie intre 0-100 (%)" ForeColor="Red" ValidationExpression="^[0-9]$|^[1-9][0-9]$|^(100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblImpozit" runat="server" Text="Impozit"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtImpozit" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtImpozit" ErrorMessage="Impozitul trebuie sa fie intre 0-100 (%)" ForeColor="Red" ValidationExpression="^[0-9]$|^[1-9][0-9]$|^(100)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnActualizare" runat="server" OnClick="btnActualizare_Click" Text="Actualizare procente" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnRenuntare" runat="server" OnClick="btnRenuntare_Click" Text="Renuntare" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
