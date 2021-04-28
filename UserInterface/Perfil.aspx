<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="UserInterface.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <h1>Perfil</h1>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Nombre <asp:TextBox ID="Nombre" runat="server" ReadOnly="True"></asp:TextBox> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Apellido <asp:TextBox ID="Apellido" runat="server" ReadOnly="True"></asp:TextBox> 
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Telefono <asp:TextBox ID="Telefono" runat="server" ReadOnly="True"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Email <asp:TextBox ID="Emali" runat="server" ReadOnly="True"></asp:TextBox>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Premium <asp:RadioButton ID="Premium" runat="server"  Enabled="False" />
        </p>
        <p>
            <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Contrasenya <asp:TextBox ID="OldPassword" runat="server"></asp:TextBox>
            </asp:Panel>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button ID="ModPerfil" runat="server" Text="Modificar" OnClick="ModPerfil_Click" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdatePerfil" runat="server" Text="Update" Visible="false" OnClick="UpdatePerfil_Click" />
        </p>
    </div>
</asp:Content>
