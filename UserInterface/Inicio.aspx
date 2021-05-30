<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UserInterface.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel= "Stylesheet" type="text/css" href="css/Inicio.css" />
       Email: 
        <asp:TextBox CssClass="textBox" ID="email" runat="server"  BorderStyle="Inset" ToolTip="Escriba SU correo" Width="80%"/>  
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  ErrorMessage="Campo Requerido"  ControlToValidate="email">
        
        </asp:RequiredFieldValidator>
         <br />
        Password:
          <asp:TextBox CssClass="txtBox" ID="contrasenya" runat="server"  MaxLength="30" BorderStyle="Inset" ToolTip="Escriba aqui la contraseña" Width="80%" TextMode="contrasenya" />  
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"  ErrorMessage="Campo Requerido" ControlToValidate="contrasenya"></asp:RequiredFieldValidator>
        <div></div>
       
          <br> 
      <asp:Button ID="entrar" runat="server" Text="Entrar" onClick="EntrarClick"/>
    </div>
       
            
</asp:Content>
