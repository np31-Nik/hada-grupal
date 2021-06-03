<%@ Page Title="Busqueda" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="UserInterface.Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="Stylesheet" type="text/css" href="css/Busqueda.css" />
    <asp:ScriptManager ID="ScriptManager2" runat="server" />
    <div class="container">
        <div class="row">
            <div class="col-2">
                <div class="panelIzquierdo" style=" background-color: #ffffff; color: black; width: 266px;">
                    <asp:UpdatePanel ID="UpdatePanel_IZQ" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BUSCAR" EventName="Click" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel runat="server" ID="panel1" DefaultButton="Buscar">
                                <asp:Label runat="server" Text="Tipo de articulo:"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="Elige un tipo de articulo" ControlToValidate="RB_Coche_Propiedad" Style="color: red" ValidationGroup="Buscar"
                                    EnableClientScript="false">*</asp:RequiredFieldValidator>
                                <asp:RadioButtonList
                                    class="RadioB"
                                    ID="RB_Coche_Propiedad"
                                    runat="server"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="RB_Coche_Propiedad_SelectedIndexChanged"
                                    Width="100%">
                                    <asp:ListItem Text="Coche"></asp:ListItem>
                                    <asp:ListItem Text="Propiedad"></asp:ListItem>
                                </asp:RadioButtonList>

                                <br />
                                <asp:Label runat="server" Text="Tipo de operacion: " Style="float: left;"></asp:Label>
                                <asp:DropDownList ID="TIPO_OPERACION" runat="server" Style="float: right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="TipoAnuncio_db" DataTextField="tipo" DataValueField="tipo">
                                    <asp:ListItem Text="Elige..." />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="Elige..."
                                    ErrorMessage="Elige un tipo de operacion" ControlToValidate="TIPO_OPERACION" Style="color: red; float: right;" ValidationGroup="Buscar"
                                    EnableClientScript="false">*</asp:RequiredFieldValidator>

                                <asp:SqlDataSource ID="TipoAnuncio_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>

                                <br />
                                <br />
                                <asp:Label runat="server" Text="Precio desde: " Style="float: left"></asp:Label>
                                <asp:TextBox runat="server" ID="PRECIO_DESDE" Style="float: right"></asp:TextBox>
                                <asp:RangeValidator runat="server" ControlToValidate="PRECIO_DESDE" ErrorMessage="'Precio desde' incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" Style="float: right">!</asp:RangeValidator>
                                <br />
                                <br />
                                <asp:Label runat="server" Text="Precio hasta: " Style="float: left"></asp:Label>
                                <asp:TextBox runat="server" ID="PRECIO_HASTA" Style="float: right"></asp:TextBox>
                                <asp:RangeValidator runat="server" ControlToValidate="PRECIO_HASTA" ErrorMessage="'Precio hasta' incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" Style="float: right">!</asp:RangeValidator>
                                <br />
                                <br />
                                <asp:Label runat="server" Text="Localidad: " Style="float: left;"></asp:Label>
                                <asp:DropDownList ID="LOCALIDAD" runat="server" Style="float: right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="Localidad_db" DataTextField="localidad" DataValueField="localidad">
                                    <asp:ListItem Text="Elige..." Value="" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Localidad_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [Localidad]"></asp:SqlDataSource>
                                <br />
                                <br />

                                <div id="IF_COCHE" runat="server" visible="false">
                                    <asp:Label runat="server" Text="Marca: " Style="float: left;"></asp:Label>
                                    <asp:DropDownList ID="MARCA" runat="server" Style="float: right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="Marca_db" DataTextField="marca" DataValueField="marca">
                                        <asp:ListItem Text="Elige..." Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Marca_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
                                    <br />
                                    <br />
                                    <asp:Label runat="server" Text="Tipo de coche: " Style="float: left;"></asp:Label>
                                    <asp:DropDownList ID="TIPO_COCHE" runat="server" Style="float: right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="TipoCoche_db" DataTextField="tipo" DataValueField="tipo">
                                        <asp:ListItem Text="Elige..." Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="TipoCoche_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
                                </div>

                                <div id="IF_PROPIEDAD" runat="server" visible="false">
                                    <asp:Label runat="server" Text="Tipo de propiedad: " Style="float: left;"></asp:Label>
                                    <asp:DropDownList ID="TIPO_PROPIEDAD" runat="server" Style="float: right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="TipoPropiedad_db" DataTextField="tipo" DataValueField="tipo">
                                        <asp:ListItem Text="Elige..." Value="" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="TipoPropiedad_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoPropiedad]"></asp:SqlDataSource>
                                    <br />
                                    <br />
                                    <asp:Label runat="server" Text="Dormitorios: " Style="float: left"></asp:Label>
                                    <asp:TextBox runat="server" ID="DORMITORIOS" Style="float: right"></asp:TextBox>
                                    <asp:RangeValidator runat="server" ControlToValidate="DORMITORIOS" ErrorMessage="Número de dormitorios incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" Style="float: right">!</asp:RangeValidator>

                                    <br />
                                    <br />
                                    <asp:Label runat="server" Text="Baños: " Style="float: left"></asp:Label>
                                    <asp:TextBox runat="server" ID="BANYOS" Style="float: right"></asp:TextBox>
                                    <asp:RangeValidator runat="server" ControlToValidate="BANYOS" ErrorMessage="Número de baños incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" Style="float: right">!</asp:RangeValidator>
                                </div>
                                <br />
                                <br />
                                <div class="BotonBusqueda" style="text-align: center">
                                    <asp:Button runat="server" ID="BUSCAR" Text="Buscar" Style="background-color: white; font-size: 20px" Height="50px" Width="110px"
                                        CausesValidation="true" ValidationGroup="Buscar" OnClick="BuscarAnuncios" />
                                </div>
                                <br />
                                <asp:ValidationSummary runat="server" DisplayMode="BulletList" EnableClientScript="false" ID="ValidationSummary_Buscar" ValidationGroup="Buscar"
                                    ForeColor="red" />
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            
            <div class="col-10">
                <div class="PanelBusqueda" style="background-color: #ffffff; color: black;">
                    <div class="ResultadosBusqueda">
                        <asp:Label runat="server" Text="Resultados de busqueda" Width="100%" Style="text-align: center; font-weight: bold;"></asp:Label>
                        <asp:UpdatePanel runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="DatosBusqueda" GroupItemCount="3" >
                                    <EmptyDataTemplate>
                                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; text-align: center; width: 100%">
                                            <tr>
                                                <td>No se ha encontrado ningún anuncio con esas características.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <EmptyItemTemplate>
                                        <td runat="server" />
                                    </EmptyItemTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>

                                    <ItemTemplate>
                                        <td runat="server" style="background-color: #DCDCDC; color: #000000; border: ridge; border-color: black">
                                            <asp:ImageButton ID="FOTO" runat="server" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' Width="250px" Height="200px"
                                                PostBackUrl='<%#"~/Anuncio.aspx?anuncio_id="+ Eval("id") %>' />
                                            <br />
                                            <asp:Label ID="tipoLabel" runat="server" Style="float: left" Text='<%# Eval("tipo") %>' />
                                            <asp:Label runat="server" Text="€" Style="float: right"></asp:Label>
                                            <asp:Label ID="precioLabel" runat="server" Style="float: right" Text='<%# Eval("precio") %>' />
                                            <br />
                                            <asp:Label ID="localidadLabel" runat="server" Style="float: right" Text='<%# Eval("localidad") %>' />
                                        </td>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td align="center">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <div id="groupPlaceholderContainer" runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                                    <span runat="server" id="groupPlaceholder" />
                                                                </div>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                    </LayoutTemplate>

                                </asp:ListView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio CROSS JOIN Foto WHERE (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="DatosBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Anuncio.id, Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio CROSS JOIN Foto WHERE (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource>
                                <br />


                            </ContentTemplate>
                        </asp:UpdatePanel>



                    </div>
                </div>
            </div>
        </div>
        <br />
        <div style="text-align: center; background-color: #f2f2f2; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="6">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                </Fields>
            </asp:DataPager>
        </div>
        <br />
        <br />
    </div>
    <br />

</asp:Content>
