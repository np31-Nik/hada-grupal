<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="UserInterface.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div style="background-color: #151719; width: 100%; color:white; padding:10px; text-align:center ">
          
        <asp:DropDownList runat="server" ID="CasaoCoche" AutoPostBack="True" Height="25px" Width="200px">
            <asp:ListItem Selected="True" Value="Propiedad"> Propiedad </asp:ListItem>
            <asp:ListItem Value="Coche"> Coche </asp:ListItem>
        </asp:DropDownList>

        <asp:DropDownList runat="server" ID="ALQoVENT" AutoPostBack="True" Height="25px" Width="200px">
            <asp:ListItem Selected="True" Value="Alquiler"> Alquiler </asp:ListItem>
            <asp:ListItem Value="Venta"> Venta </asp:ListItem>
        </asp:DropDownList>
        
        <asp:DropDownList runat="server" ID="localidades" AutoPostBack="True" Height="25px" Width="200px">
            <asp:ListItem Selected="True" Value="Localidad"> Localidad </asp:ListItem>
            <asp:ListItem Value="Alicante"> Alicante </asp:ListItem>
        </asp:DropDownList>

        Precio Mínimo: <asp:TextBox ID="BoxNumeros" runat="server" Height="25px" Width="200px" />
           
        Precio Límite: <asp:TextBox ID="BoxNumeros2" runat="server" Height="25px" Width="200px"/>

        <asp:ImageButton ID="LupaBuscar" runat="server" ImageUrl="~/imagenes/455-4559731_icono-de-lupa-para-legal-design-thinking-lupa.png"  Width="30px" ImageAlign="Middle" Height="30px"/>
        
    </div>
    <div>
        <br /><br /><br /><br /><br /><br /><br />
    </div>
</asp:Content>
