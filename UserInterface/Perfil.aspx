<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="UserInterface.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div class="formularioHead">
        <h2>Perfil&nbsp; <asp:TextBox ID="Nif" runat="server" Enabled="false" Width="100px" ReadOnly="true" BorderStyle="None" Font-Size="14pt"></asp:TextBox></h2>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <div class="formularioContent">
        <div id="perfilInf">
            <table style="width: 400px;">
                <tr>
                    <td>Nombre </td>
                    <td>Apellido</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="Nombre" runat="server" Enabled="false"></asp:TextBox> </td>
                    <td><asp:TextBox ID="Apellido" runat="server" Enabled="false"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td>Email</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="Telefono" runat="server" Enabled="false"></asp:TextBox></td>
                    <td><asp:TextBox ID="Emali" runat="server" Enabled="false" TextMode="Email"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Premium <asp:CheckBox ID="Premium" runat="server" Enabled="false"/></td>
                </tr>
            </table>
        </div>
        <p>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
                Contrasenya <asp:TextBox ID="OldPassword" runat="server" EnableTheming="True" TextMode="Password"></asp:TextBox>
            </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <p>
            </p>
            <p>
                <asp:Button ID="ModPerfil" runat="server" OnClick="ModPerfil_Click" Text="Modificar" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="UpdatePerfil" runat="server" OnClick="UpdatePerfil_Click" Text="Update" Visible="false" />
            </p>
            <p>
            </p>
        </p>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
