﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StergereDate.aspx.cs" Inherits="StergereDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 212px;
        }
        .auto-style2 {
            width: 203px;
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
                <td class="auto-style2">
                    <asp:TextBox ID="txtNume" runat="server" ForeColor="Black"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnCauta" runat="server" OnClick="btnCauta_Click" Text="Cauta" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblID" runat="server" Text="ID:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtID" runat="server" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnSterge" runat="server" OnClick="btnSterge_Click" Text="Sterge Angajat" />
                </td>
                <td class="auto-style7" colspan="2">
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Renuntare" />
                </td>
            </tr>
            </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
    </form>
</body>
</html>
