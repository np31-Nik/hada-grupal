<%@ Page Title="Busqueda" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="UserInterface.Busqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link rel="Stylesheet" type="text/css" href="css/Busqueda.css" />
    <div>
    <div class="panelIzquierdo" style="float:left;background-color:#ffffff;color:black; width: 291px;">
        <asp:Label runat="server" Text="Tipo de articulo:"></asp:Label>

        <asp:RadioButtonList 
            class="RadioB"
            ID="RB_Coche_Propiedad"
            runat="server"
            AutoPostBack="true"
            OnSelectedIndexChanged="RB_Coche_Propiedad_SelectedIndexChanged"  
            Width="100%"
                    >
            <asp:ListItem Text="Coche"></asp:ListItem>
            <asp:ListItem Text="Propiedad"></asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label runat="server" Text="Tipo de operacion: "  style="float:left;"></asp:Label>
        <asp:DropDownList ID="TIPO_OPERACION" runat="server" style="float:right;" AppendDataBoundItems="true" Height="25px" Width="100px">
                <asp:ListItem Text="Elige..." Value="" />   
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label runat="server" Text="Precio desde: " style="float:left"></asp:Label>
        <asp:TextBox runat="server" ID="PRECIO_DESDE" style="float:right"></asp:TextBox>
        <br />
        <br />
        <asp:Label runat="server" Text="Precio hasta: " style="float:left"></asp:Label>
        <asp:TextBox runat="server" ID="PRECIO_HASTA" style="float:right"></asp:TextBox>
        <br />
        <br />
        <asp:Label runat="server" Text="Localidad: "  style="float:left;"></asp:Label>
        <asp:DropDownList ID="LOCALIDAD" runat="server" style="float:right;" AppendDataBoundItems="true" Height="25px" Width="100px">
                <asp:ListItem Text="Elige..." Value="" />   
        </asp:DropDownList>
        <br />
        <br />

        <div id="IF_COCHE" runat="server" visible="false">
            <asp:Label runat="server" Text="Marca: "  style="float:left;"></asp:Label>
            <asp:DropDownList ID="MARCA" runat="server" style="float:right;" AppendDataBoundItems="true" Height="25px" Width="100px">
                    <asp:ListItem Text="Elige..." Value="" />   
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label runat="server" Text="Tipo de coche: "  style="float:left;"></asp:Label>
            <asp:DropDownList ID="TIPO_COCHE" runat="server" style="float:right;" AppendDataBoundItems="true" Height="25px" Width="100px">
                    <asp:ListItem Text="Elige..." Value="" />   
            </asp:DropDownList>
        </div>
        
        <div id="IF_PROPIEDAD" runat="server" visible="false">
            <asp:Label runat="server" Text="Tipo de propiedad: "  style="float:left;"></asp:Label>
            <asp:DropDownList ID="TIPO_PROPIEDAD" runat="server" style="float:right;" AppendDataBoundItems="true" Height="25px" Width="100px">
                    <asp:ListItem Text="Elige..." Value="" />   
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label runat="server" Text="Dormitorios: " style="float:left"></asp:Label>
            <asp:TextBox runat="server" ID="DORMITORIOS" style="float:right"></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Text="Baños: " style="float:left"></asp:Label>
            <asp:TextBox runat="server" ID="BANYOS" style="float:right"></asp:TextBox>
        </div>
        <br />
        <br />
        <div class="BotonBusqueda" style="text-align:center">
            <asp:Button runat="server" ID="BUSCAR" Text="Buscar" style="background-color:white;font-size:20px" Height="50px" Width="110px"/>
        </div>
        <br />
        <asp:Label runat="server" ID="MENSAJE" style="color:red" Visible="false"></asp:Label>
    </div>

    <div class="PanelBusqueda" style="background-color:#ffffff;color:black;">
        <asp:Label runat="server" Text="Resultados de busqueda" Width="100%" style="text-align:center;font-weight:bold;"></asp:Label>
        <div class="ResultadosBusqueda">

        </div>
    </div>
        <br />
        <br />
    </div>

</asp:Content>
