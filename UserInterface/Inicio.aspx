<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UserInterface.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel= "Stylesheet" type="text/css" href="css/Inicio.css" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="nif" ValidationExpression="^([0-9]{8}[A-Z])|[XYZ][0-9]{7}[A-Z]|[0-9]{9}$" runat="server" ForeColor="Red" ErrorMessage="Formato incorrecto NIF "></asp:RegularExpressionValidator>

         <br />
       NIF: 
        <asp:TextBox CssClass="textBox" ID="nif" runat="server"  BorderStyle="Inset" Width="8%"/>  
<br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"  ErrorMessage="Campo Requerido"  ControlToValidate="nif">
        </asp:RequiredFieldValidator>
        <br>
    <div>
        Contraseña:
          <asp:TextBox CssClass="txtBox" ID="seguridad" runat="server"  MaxLength="30" BorderStyle="Inset" Width="8%" TextMode="Password" />  
         <br />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red"  ErrorMessage="Campo Requerido" ControlToValidate="seguridad"></asp:RequiredFieldValidator>
         <br />
        </div>
       
          <br> 
      <asp:Button ID="entrar" runat="server" Text="Entrar" onClick="EntrarClick"/>  
        
        <br />
        
        <asp:Label ID="mensaje" runat="server" Visible="false" ForeColor="Red" Text="Usuario o contraseña incorrectos."></asp:Label>
            
</asp:Content>
