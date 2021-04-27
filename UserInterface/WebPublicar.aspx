<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebPublicar.aspx.cs" Inherits="UserInterface.WebPublicar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Publicar Articulo:</h2>
        <div runat="server" id="main">
            
    
            <asp:RadioButtonList 
                ID="RadioButtonList1"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem>Vehiculo</asp:ListItem>
                <asp:ListItem>Propiedad</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Titulo:
            <asp:TextBox ID="titulo" runat="server"> </asp:TextBox> <br /><br />
            Localidad:
            <asp:TextBox ID="localidad" runat="server"> </asp:TextBox> <br /><br />
            Descripcion:
            <asp:TextBox ID="descripcion" runat="server"> </asp:TextBox> <br /><br />
            Codigo postal:
            <asp:TextBox ID="cp" runat="server"> </asp:TextBox> <br /><br />
            
             
        </div>
        <div runat="server" id="vehiculo" visible="false">
           Marca:
            <asp:DropDownList ID="marca" runat="server"> 

              <asp:ListItem Text="--Select--" value="0"></asp:ListItem>
              <asp:ListItem Text="--Select--" value="1"></asp:ListItem>
              <asp:ListItem Text="--Select--" value="2"></asp:ListItem>  
            </asp:DropDownList>
            <br />
            Tipo:
             <asp:DropDownList ID="tipoCoche" runat="server"> 

              <asp:ListItem Text="--Select--" value="0"></asp:ListItem>
              <asp:ListItem Text="--Select--" value="1"></asp:ListItem>
              <asp:ListItem Text="--Select--" value="2"></asp:ListItem>  
            </asp:DropDownList>
            <br />
            Precio:
            <asp:TextBox ID="precioVehiculo" runat="server"> </asp:TextBox> <br /><br />
       </div>
        
       <div runat="server" id="propiedad" visible="false">
           <asp:RadioButtonList 
                ID="RadioButtonList2"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                <asp:ListItem>Alquiler</asp:ListItem>
                <asp:ListItem>Venta</asp:ListItem>
            </asp:RadioButtonList>


           <asp:label runat="server" ID="precioProp"></asp:label>
           <asp:TextBox ID="precio" runat="server" > </asp:TextBox> <br /><br />

           Numero Catastral:
           <asp:TextBox ID="numCatastral" runat="server"> </asp:TextBox> <br /><br />
           Tipo:
           <asp:DropDownList ID="TipoCasa" runat="server"> 

              <asp:ListItem Text="--Select--" value="0"></asp:ListItem>
              <asp:ListItem Text="--Select--" value="1"></asp:ListItem>
              <asp:ListItem Text="--Select--" value="2"></asp:ListItem>  
           </asp:DropDownList> 
           Direccion:
           <asp:TextBox ID="Direccion" runat="server"> </asp:TextBox> <br /><br />
           Superficie: 
           <asp:TextBox ID="Superficie" runat="server"> </asp:TextBox> <br /><br />
           Numero de baños:
           <asp:TextBox ID="NumBanyos" runat="server"> </asp:TextBox> <br /><br />
           Numero de habitaciones:
           <asp:TextBox ID="NumHabit" runat="server"> </asp:TextBox> <br /><br />

       </div>
    <asp:Label ID="mensaje" runat="server"></asp:Label><br />
        <br />
    <asp:Button ID="publicar" runat="server" Text="Publicar" onClick="PublicarClick"/>
    <asp:Button ID="inicio" runat="server" Text="Inicio" OnClick="InicioClick"/>
    </form>
</body>
</html>
