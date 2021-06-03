<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registros.aspx.cs" Inherits="UserInterface.Registros" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel= "Stylesheet" type="text/css" href="css/Registros.css" />
    <div class="principal">
        <center>

        <h2>Registro de usuario:</h2>
            Premium:<br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="RadioButtonList1"  ForeColor="Red"   ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            &nbsp;<asp:RadioButtonList
                ID="RadioButtonList1"
                runat="server"
                AutoPostBack="true"
                >
                <asp:ListItem>Si</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <br /> 
            Ingrese su DNI:<br />
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="nif"  ForeColor="Red"   ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br />
           <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="nif" ValidationExpression="^([0-9]{8}[A-Z])|[XYZ][0-9]{7}[A-Z]|[0-9]{9}$" runat="server" ForeColor="Red" ErrorMessage="Formato incorrecto nif "></asp:RegularExpressionValidator>
            <br /> 
           <asp:TextBox CssClass="textBox" ID="nif" MaxLength="10" runat="server"  BorderStyle="Inset" ToolTip="Escriba aqui el nif"/>
            <br />
           <br /> 
           Ingrese su nombre:<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NombreUsuario" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
           <br /> <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Formato incorrecto" ForeColor="Red" ControlToValidate="NombreUsuario" ValidationExpression="^[^\W\d_]+$"></asp:RegularExpressionValidator>
            <br /> 
            <asp:TextBox CssClass="txtBox" ID="NombreUsuario" MaxLength="45" runat="server"  BorderStyle="Inset" ToolTip="Escriba aqui el nombre de usuario"/>  
           <br /> <br /> 
            Ingrese sus apellidos:
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="apellidos" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Formato incorrecto" ForeColor="Red" ControlToValidate="apellidos" ValidationExpression="^[^\W\d_]+$"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="apellidos" runat="server" BorderStyle="Inset"> </asp:TextBox> <br /><br />
            Ingrese su correo:
             <br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="email" ForeColor="Red"  ErrorMessage="Campo obligatorio" ></asp:RequiredFieldValidator>
             <br /> 
             <asp:TextBox CssClass="txtBox" ID="email"  MaxLength="45" runat="server" BorderStyle="Inset" ToolTip="Escriba aqui el email" />
             <br />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" runat="server" ForeColor="Red"  ErrorMessage="Formato incorrecto"></asp:RegularExpressionValidator>
               <br /><br /> 
              Ingrese su contraseña:
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Contraseña" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br /> 
            <asp:TextBox CssClass="txtBox" ID="Contraseña"  TextMode="Password" MaxLength="45" runat="server"  BorderStyle="Inset" ToolTip="Escriba aqui su contraseña"/>
            <br /> <br /> 
            Vuelva a introducirla:
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Contraseña2" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
            <br />
          <asp:CompareValidator ID="CompareValidator1" runat="server"  Type="String" Operator="Equal"  ControlToCompare="Contraseña" ControlToValidate="Contraseña2" ForeColor="Red" ErrorMessage="Error al introducir la contraseña"></asp:CompareValidator>
            <br /> 
             <asp:TextBox CssClass="textBox" ID="Contraseña2" TextMode="Password" MaxLength="45" runat="server" BorderStyle="Inset" ToolTip="Escriba otra vez su contraseña"/>
            <br />
            <br /> 
            Introduzca su numero de telefono:
             <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="movil" ForeColor="Red"  ErrorMessage="Campo obligatorio"></asp:RequiredFieldValidator>
                    <br />     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="movil" ValidationExpression="^\d+$" runat="server" ForeColor="Red"  ErrorMessage="Formato incorrecto"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="movil" runat="server" BorderStyle="Inset"> </asp:TextBox> <br /> <br /> 
                   <asp:Button ID="registar" runat="server" Text="Registrarse" onClick="RegistarClick" Height="50px" Width="110px" style="font-size:18px"/>
                    <br />
                    <asp:Label runat="server" ID="mensaje" Text="Ya existe un usuario con ese NIF." ForeColor="Red" Visible="false"></asp:Label>
                  <p> <a href ="./Inicio.aspx" style="font-size:20px">¿Ya tienes cuenta?</a></p>
            <p> &nbsp;</p>
        </div>
    </center>
</asp:Content>