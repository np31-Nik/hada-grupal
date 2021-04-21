<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebPublicar.WebForm1" %>

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
            Tipo:
            <asp:TextBox ID="nif" runat="server"> </asp:TextBox> <br /><br />
            Nombre:
            <asp:TextBox ID="nombre" runat="server"> </asp:TextBox> <br /><br />
            Edad:
            <asp:TextBox ID="edad" runat="server"> </asp:TextBox> <br /><br />

        </div>
        
    <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
    <asp:RadioButton runat="server"></asp:RadioButton>
    <asp:Label ID="mensaje" runat="server"></asp:Label><br />

    <asp:Button ID="publicar" runat="server" Text="Publicar" onClick="PublicarClick"/>
    <asp:Button ID="inicio" runat="server" Text="Inicio" OnClick="InicioClick"/>
    </form>
</body>
</html>
