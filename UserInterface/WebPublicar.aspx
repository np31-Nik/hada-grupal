<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebPublicar.aspx.cs" Inherits="UserInterface.WebPublicar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
    <h2>Publicar Articulo:</h2>
            Titulo:
            <asp:TextBox ID="titulo" runat="server"> </asp:TextBox> <br /><br />
            Precio:
            <asp:TextBox ID="precio" runat="server"> </asp:TextBox> <br /><br />
            Localidad:
            <asp:TextBox ID="localidad" runat="server"> </asp:TextBox> <br /><br />
            Descripcion:
            <asp:TextBox ID="descripcion" runat="server"> </asp:TextBox> <br /><br />
            Codigo postal:
            <asp:TextBox ID="cp" runat="server"> </asp:TextBox> <br /><br />

        </div>
        
    <asp:DropDownList ID="marca" runat="server"> 

      <asp:ListItem Text="--Select--" value="0"></asp:ListItem>
      <asp:ListItem Text="--Select--" value="1"></asp:ListItem>
      <asp:ListItem Text="--Select--" value="2">
      </asp:ListItem>  
    </asp:DropDownList>
        <br />
    <asp:RadioButton ID="vehiculo" runat="server" Text="Vehiculo" GroupName="tipo"></asp:RadioButton>
    <asp:RadioButton ID="Propiedad" runat="server" Text="Propiedad" GroupName="tipo"></asp:RadioButton>
        <br />
    <asp:Label ID="mensaje" runat="server"></asp:Label><br />
        <br />
    <asp:Button ID="publicar" runat="server" Text="Publicar" onClick="PublicarClick"/>
    <asp:Button ID="inicio" runat="server" Text="Inicio" OnClick="InicioClick"/>
    </form>
</body>
</html>
