<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="UserInterface.Registros" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel= "Stylesheet" type="text/css" href="css/Registros.css" />
        <h2>Registro de usuarios:</h2>
        <div class="PanelTitulo"></div>
        <div runat="server" id="main"></div>
            Premium:
             <asp:RadioButtonList
                ID="RadioButtonList1"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem>Si</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <br /> <br /> 
            Ingrese su DNI:
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nif"  ForeColor="Red"   ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br /> <br /> 
           <asp:TextBox CssClass="textBox" ID="nif" MaxLength="10" runat="server"  BorderStyle="Inset" ToolTip="Escriba aqui el nif"/>
            <br />
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="nif" ValidationExpression="(\d{8}[a-zA-Z])|([a-zA-Z]\d{8}[a-zA-Z])" runat="server" ErrorMessage="Formato incorrecto nif "></asp:RegularExpressionValidator>
           <br /> 
           Ingrese su nombre: 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NombreUsuario" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br /> <br /> 
            <asp:TextBox CssClass="txtBox" ID="NombreUsuario" MaxLength="45" runat="server"  BorderStyle="Inset" ToolTip="Escriba aqui el nombre de usuario"/>  
           <br /> <br /> 
            Ingrese sus apellidos:
            <br /> <br /> 
            <asp:TextBox ID="apellidos" runat="server"> </asp:TextBox> <br /><br />
            Ingrese su correo:
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="email" ForeColor="Red"  ErrorMessage="Campo obligatorio" ></asp:RequiredFieldValidator>
             <br /><br /> 
             <asp:TextBox CssClass="txtBox" ID="email"  MaxLength="45" runat="server" BorderStyle="Inset" ToolTip="Escriba aqui el email" />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" runat="server" ForeColor="Red"  ErrorMessage="Formato incorrecto"></asp:RegularExpressionValidator>
               <br /><br /> 
              Ingrese su contraseña:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Contraseña" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br /> <br /> 
            <asp:TextBox CssClass="txtBox" ID="Contraseña"  TextMode="Password" MaxLength="45" runat="server"  BorderStyle="Inset" ToolTip="Escriba aqui su contraseña"/>
            <br /> <br /> 
            Vuelva a introducirla:
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Contraseña2" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br /> <br /> 
             <asp:TextBox CssClass="textBox" ID="Contraseña2" TextMode="Password" MaxLength="45" runat="server" BorderStyle="Inset" ToolTip="Escriba otra vez su contraseña"/>
          <asp:CompareValidator ID="CompareValidator1" runat="server"  Type="String" Operator="Equal"  ControlToCompare="Contraseña" ControlToValidate="Contraseña2" ErrorMessage="Error al introducir la contraseña"></asp:CompareValidator>
              <br /> <br /> 
            Introduzca su numero de telefono:
             <br /> <br /> 
            <asp:TextBox ID="movil" runat="server"> </asp:TextBox> <br /><br />
            Administrador si/no :
                    <asp:RadioButtonList
                     ID="RadioButtonList3"
                     runat ="server"
                     AutoPostBack="true"
                      OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
                     <asp:ListItem>Si</asp:ListItem>
                     <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList>
                    <div class="from-register botons"></div>
                     <br /> <br /> 
                   <asp:Button ID="registar" runat="server" Text="Registrar" onClick="RegistarClick"/>
                    <br />
                  <asp:CustomValidator ID="CustomValidator4" runat="server"  ControlToValidate="nif"  OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"  ErrorMessage="Ya existe un usuario con ese NIF"> </asp:CustomValidator>
                  <p> <a href ="./Inicio.aspx">¿Ya tiene cuenta?</a></p>

</asp:Content>

   

