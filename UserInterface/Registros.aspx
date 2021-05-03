<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="UserInterface.Registros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel: Stylesheet" type: "text/css" href="css/Registro.css" />
        <h2>Registro de usuarios:</h2>
        <div class=".PanelTitulo"></div>
        <div runat="server" id="main">
            Mayor de edad:
             <asp:RadioButtonList
                ID="RadioButtonList1"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem>Si</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>

            Ingrese su nombre:
            <asp:TextBox ID="nombres" runat="server">  </asp:TextBox> <br /><br />
            Ingrese sus apellidos:
            <asp:TextBox ID="TextBox2" runat="server"> </asp:TextBox> <br /><br />
            Ingrese su correo:
            <asp:TextBox ID="email" runat="server"> </asp:TextBox> <br /><br />
            Ingrese su contraseña:
            <asp:TextBox ID="password" runat="server"> </asp:TextBox> <br /><br />
            Vuelva a introducirla:
            <asp:TextBox ID="password2" runat="server"> </asp:TextBox> <br /><br />
            Introduzca su numero de telefono:
            <asp:TextBox ID="TextBox3" runat="server"> </asp:TextBox> <br /><br />
            Introzuca su numero de telefono fijo:
             <asp:TextBox ID="fijo" runat="server"> </asp:TextBox> <br /><br />
            </p> Estas de acuerdo con <a href ="#">Términos y condiciones</a></p>
                <asp:RadioButtonList 
                     ID="RadioButtonList2"
                     runat="server"
                     AutoPostBack="true"
                      OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                     <asp:ListItem>Si</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </div>


             <asp:Button ID="registar" runat="server" Text="Registrar" onClick="RegistarClick"/>
            <p> <a href ="#">¿Ya tiene cuenta?</a></p>

</asp:Content>

   

