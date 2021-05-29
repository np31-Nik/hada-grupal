<%@ Page Title="Busqueda" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="UserInterface.Busqueda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link rel="Stylesheet" type="text/css" href="css/Busqueda.css" />
                        <asp:ScriptManager ID="ScriptManager2" runat="server" />
    <div>
    <div class="panelIzquierdo" style="float:left;background-color:#ffffff;color:black; width: 291px;">
        <asp:UpdatePanel ID="UpdatePanel_IZQ" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BUSCAR" EventName="Click" />
            </Triggers>
            <ContentTemplate>
<asp:Label runat="server" Text="Tipo de articulo:"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="Elige un tipo de articulo" ControlToValidate="RB_Coche_Propiedad" Style="color:red" ValidationGroup="Buscar"
                            EnableClientScript="false">*</asp:RequiredFieldValidator>
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
        <asp:DropDownList ID="TIPO_OPERACION" runat="server" style="float:right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="TipoAnuncio_db" DataTextField="tipo" DataValueField="tipo">
                <asp:ListItem Text="Elige..."/>   
        </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="Elige..." 
                            ErrorMessage="Elige un tipo de operacion" ControlToValidate="TIPO_OPERACION" Style="color:red;float:right;" ValidationGroup="Buscar"
                            EnableClientScript="false" >*</asp:RequiredFieldValidator>

                <asp:SqlDataSource ID="TipoAnuncio_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>

        <br />
        <br />
        <asp:Label runat="server" Text="Precio desde: " style="float:left"></asp:Label>
        <asp:TextBox runat="server" ID="PRECIO_DESDE" style="float:right"></asp:TextBox>
        <asp:RangeValidator runat="server" ControlToValidate="PRECIO_DESDE" ErrorMessage="'Precio desde' incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" style="float:right">!</asp:RangeValidator>
        <br />
        <br />
        <asp:Label runat="server" Text="Precio hasta: " style="float:left"></asp:Label>
        <asp:TextBox runat="server" ID="PRECIO_HASTA" style="float:right"></asp:TextBox>
        <asp:RangeValidator runat="server" ControlToValidate="PRECIO_HASTA" ErrorMessage="'Precio hasta' incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" style="float:right">!</asp:RangeValidator>
        <br />
        <br />
        <asp:Label runat="server" Text="Localidad: "  style="float:left;"></asp:Label>
        <asp:DropDownList ID="LOCALIDAD" runat="server" style="float:right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="Localidad_db" DataTextField="localidad" DataValueField="localidad">
                <asp:ListItem Text="Elige..." Value="" />   
        </asp:DropDownList>
                <asp:SqlDataSource ID="Localidad_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [Localidad]"></asp:SqlDataSource>
        <br />
        <br />

        <div id="IF_COCHE" runat="server" visible="false">
            <asp:Label runat="server" Text="Marca: "  style="float:left;"></asp:Label>
            <asp:DropDownList ID="MARCA" runat="server" style="float:right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="Marca_db" DataTextField="marca" DataValueField="marca">
                    <asp:ListItem Text="Elige..." Value="" />   
            </asp:DropDownList>
            <asp:SqlDataSource ID="Marca_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label runat="server" Text="Tipo de coche: "  style="float:left;"></asp:Label>
            <asp:DropDownList ID="TIPO_COCHE" runat="server" style="float:right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="TipoCoche_db" DataTextField="tipo" DataValueField="tipo">
                    <asp:ListItem Text="Elige..." Value="" />   
            </asp:DropDownList>
            <asp:SqlDataSource ID="TipoCoche_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
        </div>
        
        <div id="IF_PROPIEDAD" runat="server" visible="false">
            <asp:Label runat="server" Text="Tipo de propiedad: "  style="float:left;"></asp:Label>
            <asp:DropDownList ID="TIPO_PROPIEDAD" runat="server" style="float:right;" AppendDataBoundItems="True" Height="25px" Width="100px" DataSourceID="TipoPropiedad_db" DataTextField="tipo" DataValueField="tipo">
                    <asp:ListItem Text="Elige..." Value="" />   
            </asp:DropDownList>
            <asp:SqlDataSource ID="TipoPropiedad_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoPropiedad]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Label runat="server" Text="Dormitorios: " style="float:left"></asp:Label>
            <asp:TextBox runat="server" ID="DORMITORIOS" style="float:right"></asp:TextBox>
            <asp:RangeValidator runat="server" ControlToValidate="DORMITORIOS" ErrorMessage="Número de dormitorios incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" style="float:right">!</asp:RangeValidator>

            <br />
            <br />
            <asp:Label runat="server" Text="Baños: " style="float:left"></asp:Label>
            <asp:TextBox runat="server" ID="BANYOS" style="float:right"></asp:TextBox>
            <asp:RangeValidator runat="server" ControlToValidate="BANYOS" ErrorMessage="Número de baños incorrecto." MaximumValue="999999999" MinimumValue="1" EnableClientScript="false" ForeColor="Red" ValidationGroup="Buscar" style="float:right">!</asp:RangeValidator>
        </div>
        <br />
        <br />
        <div class="BotonBusqueda" style="text-align:center">
            <asp:Button runat="server" ID="BUSCAR" Text="Buscar" style="background-color:white;font-size:20px" Height="50px" Width="110px"
                causesValidation="true" ValidationGroup="Buscar" OnClientClick="if(Page_ClientValidate()) return BuscarAnuncios();"/>
        </div>
        <br />
        <asp:ValidationSummary runat="server" DisplayMode="BulletList" EnableClientScript="false" ID="ValidationSummary_Buscar" ValidationGroup="Buscar"
                        Forecolor="red"/>
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>

    <div class="PanelBusqueda" style="background-color:#ffffff;color:black;">
        <asp:Label runat="server" Text="Resultados de busqueda" Width="100%" style="text-align:center;font-weight:bold;"></asp:Label>
        <div class="ResultadosBusqueda">
         
                    <table width="100%">
   <tr>
     <td align="center">
       <table>
         <tr>
            <td>
            
            
                <asp:ListView ID="ListView1" runat="server" DataSourceID="DatosBusqueda" GroupItemCount="3">
                    <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">precio:
                            <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                            <br />tipo:
                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                            <br />localidad:
                            <asp:Label ID="localidadLabel" runat="server" Text='<%# Eval("localidad") %>' />
                            <br />foto:
                            <asp:Label ID="fotoLabel" runat="server" Text='<%# Eval("foto") %>' />
                            <br /></td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">precio:
                            <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                            <br />tipo:
                            <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                            <br />localidad:
                            <asp:TextBox ID="localidadTextBox" runat="server" Text='<%# Bind("localidad") %>' />
                            <br />foto:
                            <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br /></td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No data was returned.</td>
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
                    <InsertItemTemplate>
                        <td runat="server" style="">precio:
                            <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                            <br />tipo:
                            <asp:TextBox ID="tipoTextBox" runat="server" Text='<%# Bind("tipo") %>' />
                            <br />localidad:
                            <asp:TextBox ID="localidadTextBox" runat="server" Text='<%# Bind("localidad") %>' />
                            <br />foto:
                            <asp:TextBox ID="fotoTextBox" runat="server" Text='<%# Bind("foto") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            <br /></td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                            <asp:ImageButton ID="FOTO" runat="server" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' Width="300px" Height="200px" />
                            <br />
                            <asp:Label ID="tipoLabel" runat="server" style="float:left" Text='<%# Eval("tipo") %>' />
                            <asp:Label runat="server" Text="€" style="float:right"></asp:Label>
                            <asp:Label ID="precioLabel" runat="server" style="float:right" Text='<%# Eval("precio") %>' />
                            <br />
                            <asp:Label ID="localidadLabel" runat="server" style="float:right" Text='<%# Eval("localidad") %>' />
                            </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">precio:
                            <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                            <br />tipo:
                            <asp:Label ID="tipoLabel" runat="server" Text='<%# Eval("tipo") %>' />
                            <br />localidad:
                            <asp:Label ID="localidadLabel" runat="server" Text='<%# Eval("localidad") %>' />
                            <br />foto:
                            <asp:Label ID="fotoLabel" runat="server" Text='<%# Eval("foto") %>' />
                            <br /></td>
                    </SelectedItemTemplate>
                </asp:ListView>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio CROSS JOIN Foto WHERE (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DatosBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio CROSS JOIN Foto WHERE (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id)))"></asp:SqlDataSource>
            
            
                </td>
         </tr>
       </table>
     </td>
   </tr>
</table>

            
        </div>
    </div>
        <br />
        <br />
    </div>

</asp:Content>
