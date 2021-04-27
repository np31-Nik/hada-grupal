<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anuncio.aspx.cs" Inherits="UserInterface.Anuncio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="Stylesheet" type="text/css" href="css/Anuncio.css" />

    <div id="ArticuloContainer">
        <div class="PanelTitulo" style="float:left;">
        <asp:Table ID="TITULO_PRECIO" runat="server">
            <asp:TableRow runat="server">
                <asp:TableCell ID="TITULO" Width=100% style="font-size:35px;font-weight: bold; color: black"></asp:TableCell>
                <asp:TableCell style="font-size: 20px;font-weight:bold;color:black" Text="Precio: "></asp:TableCell>
                <asp:TableCell ID="PRECIO" style="font-size: 20px;color:black"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="_REF" runat="server" Text="REF: " style="font-weight:bold;color:black"></asp:Label>
        <asp:Label ID="REF" runat="server" style="color:black"></asp:Label>

            </div>

        <div class="PanelDetalles" style="float:right;">
        <asp:Table ID="INFO_GENERAL" runat="server">
            <asp:TableRow runat="server">
                
                <asp:TableCell style="font-size:25px;font-weight:bold;" Text="Detalles"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_LOCALIDAD">
                <asp:TableCell Text="Localidad: "></asp:TableCell>
                <asp:TableCell ID="LOCALIDAD"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_CODPOSTAL">
                <asp:TableCell Text="Cod.Postal: "></asp:TableCell>
                <asp:TableCell ID="COD_POSTAL"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Table ID="INFO_PROPIEDAD" runat="server">
            <asp:TableRow runat="server" ID="T_REF_CAT">
                <asp:TableCell Text="Ref.Catastral: "></asp:TableCell>
                <asp:TableCell ID="REF_CAT"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_SUPERFICIE">
                <asp:TableCell Text="Superficie: "></asp:TableCell>
                <asp:TableCell ID="SUPERFICIE"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_DORMITORIOS">
                <asp:TableCell Text="Dormitorios: "></asp:TableCell>
                <asp:TableCell ID="DORMITORIOS"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_BANYOS">
                <asp:TableCell Text="Baños: "></asp:TableCell>
                <asp:TableCell ID="BANYOS"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_TIPO_PROPIEDAD">
                <asp:TableCell Text="Tipo: "></asp:TableCell>
                <asp:TableCell ID="TIPO_PROPIEDAD"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <asp:Table ID="INFO_COCHE" runat="server">
            <asp:TableRow runat="server" ID="T_ANYO">
                <asp:TableCell Text="Año: "></asp:TableCell>
                <asp:TableCell ID="ANYO"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_MARCA">
                <asp:TableCell Text="Marca: "></asp:TableCell>
                <asp:TableCell ID="MARCA"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" ID="T_TIPO_COCHE">
                <asp:TableCell Text="Tipo: "></asp:TableCell>
                <asp:TableCell ID="TIPO_COCHE"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        </div>
        <br />
        <div class="PanelImagen">
            <asp:Panel runat="server" HorizontalAlign="Center">
                 <asp:Image ID="IMAGE" runat="server" ImageUrl="~/imagenes/no-image.jpg"/>
                 <br />
                <asp:ImageButton ID="IZQ" runat="server" ImageUrl="~/imagenes/left-arrow.png" style="width:40px;height:40px;"/>
                <asp:ImageButton ID="DER" runat="server" ImageUrl="~/imagenes/right-arrow.png" style="width:40px;height:40px;"/>
            </asp:Panel>
        </div>
        <div>
                 <asp:Label ID="TIT_DESCRIPCION" runat="server" Text="Descripción:" style="font-size:20px;font-weight:bold;color:black"></asp:Label>
        </div>
        <br />
        <asp:Label ID="DESCRIPCION" runat="server" Text="*DESCRIPCION AQUI*"></asp:Label>
        <br />
    </div>
</asp:Content>
