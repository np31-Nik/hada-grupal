<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anuncio.aspx.cs" Inherits="UserInterface.Anuncio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="TITULO" runat="server" Text="*TITULO AQUI*"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="PRECIO" runat="server" Text="Precio: "></asp:Label>
    <br />
    <asp:Label ID="REF" runat="server" Text="REF: "></asp:Label>
    <br />
    <br />
    <asp:Label ID="LOCALIDAD" runat="server" Text="Localidad: "></asp:Label>
    <br />
    <asp:Label ID="CODPOSTAL" runat="server" Text="Cod. Postal: "></asp:Label>
    <br />
    <asp:Table ID="INFO_PROPIEDAD" runat="server">
        <asp:TableRow runat="server" ID="NUM_CAT">
            <asp:TableCell>Nº Catastral:</asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" ID="SUPERFICIE">
            <asp:TableCell>Superficie: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" ID="DORMITORIOS">
            <asp:TableCell>Dormitorios: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" ID="BANYOS">
            <asp:TableCell>Baños: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" ID="TIPO_PROPIEDAD">
            <asp:TableCell>Tipo: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Table ID="INFO_COCHE" runat="server">
        <asp:TableRow runat="server" ID="ANYO">
            <asp:TableCell>Año: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" ID="MARCA">
            <asp:TableCell>Marca: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server" ID="TIPO_COCHE">
            <asp:TableCell>Tipo: </asp:TableCell>
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Label ID="TIT_DESCRIPCION" runat="server" Text="Descripcion:"></asp:Label>
    <br />
    <asp:Label ID="DESCRIPCION" runat="server" Text="*DESCRIPCION AQUI*"></asp:Label>
    <br />
</asp:Content>
