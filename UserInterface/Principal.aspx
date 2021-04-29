<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="UserInterface.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div style="background-color: #151719; width: 100%; color:white; padding:10px;">
        ID: <asp:TextBox id="clave" TextMode="SingleLine" Columns="10" runat="server" />
        
        Nombre: <asp:TextBox id="nombre" TextMode="SingleLine" Columns="20" runat="server" />
        
        Precio Mínimo: <asp:TextBox ID="BoxNumeros" runat="server"/>
           
        Precio Límite: <asp:TextBox ID="BoxNumeros2" runat="server"/>
          
        <asp:DropDownList runat="server" ID="ALQoVENT" AutoPostBack="True">
            <asp:ListItem Selected="True" Value="Alquiler"> Alquiler </asp:ListItem>
            <asp:ListItem Value="Venta"> Venta </asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList runat="server" ID="CasaoCoche" AutoPostBack="True">
            <asp:ListItem Selected="True" Value="Propiedad"> Propiedad </asp:ListItem>
            <asp:ListItem Value="Coche"> Coche </asp:ListItem>
        </asp:DropDownList>
        CP: <asp:TextBox id="cp" TextMode="SingleLine" Columns="5" runat="server" />
        
        Localidad: <asp:TextBox id="local" TextMode="SingleLine" Columns="20" runat="server" />
    </div>
</asp:Content>
