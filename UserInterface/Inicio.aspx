<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="UserInterface.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel= "Stylesheet" type="text/css" href="css/Inicio.css" />
     <h2> Inicio sesion: </h2>
     <div runat="server" id="main"></div>
      Ingrese su correo:
      <asp:TextBox ID="correo" runat="server"> </asp:TextBox> <br /><br />
      Ingrese su contraseña:
      <asp:TextBox ID="contrasenya" runat="server"> </asp:TextBox> <br /><br />
      <asp:Button ID="entrar" runat="server" Text="Entrar" onClick="EntrarClick"/>
            
</asp:Content>
