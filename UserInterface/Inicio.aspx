<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UserInterface.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel= "Stylesheet" type="text/css" href="css/Inicio.css" />
    <div>
        Usuario: 
        <asp:TextBox CssClass="textBox" ID="nombreUsuario" runat="server"  BorderStyle="Inset" ToolTip="Escriba aquí su nombre de usuario" Width="16%"/>  
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  ErrorMessage="Campo Requerido"  ControlToValidate="nombreUsuario">
        </asp:RequiredFieldValidator>
         <br />
        Password:
          <asp:TextBox CssClass="txtBox" ID="Contraseña" runat="server"  MaxLength="30" BorderStyle="Inset" ToolTip="Escriba aqui la contraseña" Width="16%" TextMode="Password" />  
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"  ErrorMessage="Campo Requerido" ControlToValidate="Contraseña"></asp:RequiredFieldValidator>
       
          <br> 
      <asp:Button ID="entrar" runat="server" Text="Entrar" onClick="EntrarClick"/>
    </div>
       
            
</asp:Content>
