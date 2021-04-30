<%@ Page Title="Busqueda" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="UserInterface.Busqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link rel="Stylesheet" type="text/css" href="css/Busqueda.css" />
    
    <div class="panelIzquierdo" style="float:left;background-color:#ffffff;color:black; width: 291px;">
        <asp:Label runat="server" Text="Tipo de articulo:"  Width="100%" style="text-align:center"></asp:Label>

        <asp:RadioButtonList runat="server"  Width="100%">
            <asp:ListItem Text="Coche"></asp:ListItem>
            <asp:ListItem Text="Propiedad"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label runat="server" Text="Tipo de operacion: "  style="float:left;"></asp:Label>
        <asp:DropDownList runat="server" style="float:right;" AppendDataBoundItems="true" Height="25px">
                <asp:ListItem Text="Elige..." Value="" />   
        </asp:DropDownList>
    </div>

    <div class="PanelBusqueda" style="float:right;background-color:#ffffff;color:black;">
        <asp:Label runat="server" Text="Resultados de busqueda" Width="100%" style="text-align:center;font-weight:bold;"></asp:Label>

    </div>


</asp:Content>
