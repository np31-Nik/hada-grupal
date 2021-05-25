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
                    <td>Nombre <asp:RequiredFieldValidator ID="NombreValid1" EnableClientScript="false" runat="server" ControlToValidate="Nombre" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>Apellido <asp:RequiredFieldValidator ID="Apellidoalid1" EnableClientScript="false" runat="server" ControlToValidate="Apellido" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="Nombre" runat="server" Enabled="false"></asp:TextBox> 
                        <br /> <asp:RegularExpressionValidator ID="NombreValid2" EnableClientScript="false" ControlToValidate="Nombre" ValidationExpression="[A-Z][a-z]+" runat="server" ErrorMessage="ej:Nombre" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                    <td><asp:TextBox ID="Apellido" runat="server" Enabled="false"></asp:TextBox> 
                        <br /> <asp:RegularExpressionValidator ID="Apellidoalid2" EnableClientScript="false" ControlToValidate="Apellido" ValidationExpression="[A-Z][a-z]+" runat="server" ErrorMessage="ej:Apellido" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Telefono<asp:RequiredFieldValidator ID="TelefonoValid1" EnableClientScript="false" runat="server" ControlToValidate="Telefono" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td>Email<asp:RequiredFieldValidator ID="EmailValid1" EnableClientScript="false" runat="server" ControlToValidate="Emali" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="Telefono" runat="server" Enabled="false"></asp:TextBox>
                        <br /> <asp:RegularExpressionValidator ID="TelefonoValid2" EnableClientScript="false" ControlToValidate="Telefono" ValidationExpression="([+]|\d)\d+" runat="server" ErrorMessage="ej: 000000 o +00000" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                    <td><asp:TextBox ID="Emali" runat="server" Enabled="false"></asp:TextBox>
                        <br /> <asp:RegularExpressionValidator ID="EmailValid2" EnableClientScript="false" ControlToValidate="Emali" ValidationExpression="\w+[@]\w+[.]\w+" runat="server" ErrorMessage="ej: algo@algo.algo" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Premium <asp:CheckBox ID="Premium" runat="server" Enabled="false"/></td>
                </tr>
            </table>
        </div>
            <p>
            </p>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
                Contrasenya <asp:TextBox ID="Password" runat="server" EnableTheming="True" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordValid1" EnableClientScript="false" runat="server" ControlToValidate="Telefono" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
