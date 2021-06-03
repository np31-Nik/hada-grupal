<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_MisAnuncios.aspx.cs" Inherits="UserInterface.Perfil_MisAnuncios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
                <div class="formularioHead">
                    <h2>Mis Anuncios</h2>
                </div>
                <div class="formularioContent">
                    <div class="formularioContent2">
                        <asp:GridView ID="AnuncioGridView" runat="server" CellSpacing="5" PageSize="6" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLAnuncio" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="AnuncioGridView_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                                <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                                <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                                <asp:BoundField DataField="localidad" HeaderText="localidad" SortExpression="localidad" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SQLAnuncio" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [id], [titulo], [tipo], [categoria], [precio], [localidad] FROM [Anuncio] WHERE ([usuario] = @usuario)">
                            <SelectParameters>
                                <asp:SessionParameter Name="usuario" SessionField="nif" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="formularioHead">
                    <h2>
                        <asp:TextBox ID="IdAnuncio" runat="server" Enabled="false" BorderStyle="None" Font-Size="Larger" ReadOnly="True"></asp:TextBox></h2>
                </div>
        <div class="formularioContent">
            <div class="formularioContent2">
                <table>
                    <tr>
                        <td>
                            <div class="formularioContent3">
                                <asp:UpdatePanel ID="UpdatePanelAnuncio" runat="server" Visible="false">
                                    <ContentTemplate>
                                            <asp:Table ID="AnuncioTitulo" runat="server" CellSpacing="1">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        <asp:TextBox ID="Titulo" runat="server" Font-Size="15" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="TituloValid" runat="server" EnableClientScript="false" ControlToValidate="Titulo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:Table ID="AnuncioTable" runat="server" CellSpacing="10">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Localidad:
													<asp:RequiredFieldValidator ID="LocalidadValid" runat="server" EnableClientScript="false" ControlToValidate="Localidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="Localidad" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>

                                                        <asp:DropDownList ID="LocalidadList" runat="server" OnSelectedIndexChanged="LocalidadList_SelectedIndexChanged" DataSourceID="SQLLocalidad" DataTextField="localidad" DataValueField="localidad" Visible="false"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SQLLocalidad" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [localidad] FROM [Localidad]"></asp:SqlDataSource>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Tipo de Anuncio:
													<asp:RequiredFieldValidator ID="TipoAnuncioValid" runat="server" EnableClientScript="false" ControlToValidate="TipoAnuncio" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="TipoAnuncio" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>

                                                        <asp:DropDownList ID="TipoAnuncioList" runat="server" OnSelectedIndexChanged="TipoAnuncioList_SelectedIndexChanged" DataSourceID="SQLTipoAnuncio" DataTextField="tipo" DataValueField="tipo" Visible="false"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SQLTipoAnuncio" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        Categoria:
													<asp:RequiredFieldValidator ID="CategoriaValid" runat="server" EnableClientScript="false" ControlToValidate="CategoriaAnuncio" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="CategoriaAnuncio" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Precio:
													<asp:RequiredFieldValidator ID="PrecioValid1" runat="server" EnableClientScript="false" ControlToValidate="PrecioAnuncio" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="PrecioValid2" EnableClientScript="false" ControlToValidate="PrecioAnuncio" ValidationExpression="\d+" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        <br />
                                                        <asp:TextBox ID="PrecioAnuncio" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:Table ID="CocheTable" runat="server" CellSpacing="10" Visible="false">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Anyo:
													<asp:RequiredFieldValidator ID="AnyoCocheValid1" runat="server" EnableClientScript="false" ControlToValidate="AnyoCoche" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RangeValidator ID="AnyoCocheValid2" runat="server" EnableClientScript="false" ControlToValidate="AnyoCoche" MinimumValue="0" MaximumValue="2021" ErrorMessage="0-2021" ForeColor="Red"></asp:RangeValidator>
                                                        <br />
                                                        <asp:TextBox ID="AnyoCoche" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Marca:
													<asp:RequiredFieldValidator ID="MarcaCocheValid" runat="server" EnableClientScript="false" ControlToValidate="MarcaCoche" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="MarcaCoche" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>

                                                        <asp:DropDownList ID="MarcaCocheList" runat="server" OnSelectedIndexChanged="MarcaCocheList_SelectedIndexChanged" DataSourceID="SQLMarcaCoche" DataTextField="marca" DataValueField="marca" Visible="false"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SQLMarcaCoche" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        Tipo:
													<asp:RequiredFieldValidator ID="TipoCocheValid" runat="server" EnableClientScript="false" ControlToValidate="TipoCoche" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="TipoCoche" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>

                                                        <asp:DropDownList ID="TipoCocheList" runat="server" OnSelectedIndexChanged="TipoCocheList_SelectedIndexChanged" DataSourceID="SQLTipoCoche" DataTextField="tipo" DataValueField="tipo" Visible="false"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SQLTipoCoche" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <asp:Table ID="PropiedadTable" runat="server" CellSpacing="10" Visible="false">
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Tipo:
													<asp:RequiredFieldValidator ID="TipoPropiedadValid" runat="server" EnableClientScript="false" ControlToValidate="TipoPropiedad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <asp:TextBox ID="TipoPropiedad" runat="server" BorderStyle="None" Enabled="false" ReadOnly="true"></asp:TextBox>
                                                        <asp:DropDownList ID="TipoPropiedadList" runat="server" OnSelectedIndexChanged="TipoPropiedadList_SelectedIndexChanged" DataSourceID="SQLTipoPropiedad" DataTextField="tipo" DataValueField="tipo" Visible="false"></asp:DropDownList>
                                                        <asp:SqlDataSource runat="server" ID="SQLTipoPropiedad" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [tipo] FROM [TipoPropiedad]"></asp:SqlDataSource>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        Superficie:
													<asp:RequiredFieldValidator ID="SuperficiValid1" runat="server" EnableClientScript="false" ControlToValidate="Superficie" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="SuperficiValid2" EnableClientScript="false" ControlToValidate="Superficie" ValidationExpression="\d+" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        <br />
                                                        <asp:TextBox ID="Superficie" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        NºCatastral:
													<br />
                                                        <asp:TextBox ID="Catastral" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow>
                                                    <asp:TableCell>
                                                        NºDorm.:
													<asp:RegularExpressionValidator ID="NdormValid1" EnableClientScript="false" ControlToValidate="Ndorm" ValidationExpression="\d*" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        <br />
                                                        <asp:TextBox ID="Ndorm" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        NºBanyo:
													<asp:RegularExpressionValidator ID="NbanyoValid1" EnableClientScript="false" ControlToValidate="Nbanyo" ValidationExpression="\d*" runat="server" ErrorMessage="min:0" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        <br />
                                                        <asp:TextBox ID="Nbanyo" runat="server" BorderStyle="None" Enabled="false"></asp:TextBox>
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <p>
                                                Descripcion:
											<asp:RequiredFieldValidator ID="DescripcionValid" runat="server" EnableClientScript="false" ControlToValidate="Descripcion" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="Descripcion" runat="server" Width="420" Height="80" TextMode="MultiLine" Enabled="false" BorderStyle="None"></asp:TextBox>
                                            </p>
                                            <asp:Table ID="ButtonTable1" runat="server" CellSpacing="10">
                                                <asp:TableRow ID="optionRow1">
                                                    <asp:TableCell>
                                                        <asp:Button ID="BorrarAnuncio" runat="server" Text="Borrar Anuncio" OnClick="BorrarAnuncio_Click" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button ID="ModificarAnuncio" runat="server" Text="Modificar Anuncio" OnClick="ModificarAnuncio_Click" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow ID="modRow1" Visible="false">
                                                    <asp:TableCell>
                                                        <asp:Button ID="Cancelar1" runat="server" Text="Cancelar" OnClick="CancelarModAnuncio_Click" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button ID="Update1" runat="server" Text="Update" OnClick="UpdateModAnuncio_Click" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                                <asp:TableRow ID="modRow2" Visible="false">
                                                    <asp:TableCell>
                                                        <asp:Button ID="Cancelar2" runat="server" Text="Cancelar" OnClick="Cancelar2ModAnuncio_Click" />
                                                    </asp:TableCell>
                                                    <asp:TableCell>
                                                        <asp:Button ID="Delete2" runat="server" Text="Delete" OnClick="DeleteModAnuncio_Click" />
                                                    </asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            <p>
                                                <asp:Label ID="Label_Estado" runat="server" ForeColor="Red"></asp:Label>
                                            </p>
                                        
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="Delete2" />
                                        <asp:PostBackTrigger ControlID="Update1" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                        <td>
                            <div class="formularioTable">
                                <asp:UpdatePanel ID="FotoUpdatePanel" runat="server" Visible="false">
                                    <ContentTemplate>
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SQLImage">
                                            <EmptyDataTemplate>
                                                <table runat="server">
                                                    <tr>
                                                        <td>
                                                            <asp:Image ID="IMAGE" runat="server" Height="200px" Width="400px" ImageUrl="~\imagenes\no-image.jpg" /></td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <ItemTemplate>
                                                <asp:HiddenField ID="imgID" runat="server" Value='<%# Eval("id") %>' />
                                                <tr style="">
                                                    <td>
                                                        <asp:Image ID="foto" runat="server" Height="200px" Width="400px" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <div style="width: 100%; position: center; text-align: center;">
                                                    <table runat="server">
                                                        <tr runat="server">
                                                            <td runat="server">
                                                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                                                    <tr runat="server" style="">
                                                                        <th runat="server"></th>
                                                                    </tr>
                                                                    <tr id="itemPlaceholder" runat="server">
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr runat="server">
                                                            <td runat="server">
                                                                <asp:DataPager ID="DataPager1" runat="server" PageSize="1">
                                                                    <Fields>
                                                                        <asp:NextPreviousPagerField ButtonType="Button" PreviousPageImageUrl="~/imagenes/left-arrow.png" ShowNextPageButton="false" ShowPreviousPageButton="true"
                                                                            ButtonCssClass="BotonesIMG" ShowFirstPageButton="false" ShowLastPageButton="false" PreviousPageText="<" />
                                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="false" NextPageText=">" ShowNextPageButton="true"
                                                                            NextPageImageUrl="~/imagenes/right-arrow.png" ButtonCssClass="BotonesIMG" ShowFirstPageButton="false" ShowLastPageButton="false" />
                                                                    </Fields>
                                                                </asp:DataPager>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <asp:SqlDataSource runat="server" ID="SQLImage" ConnectionString='<%$ ConnectionStrings:DatabaseConexion %>' SelectCommand="SELECT [id], [foto] FROM [Foto] WHERE ([anuncio] = @anuncio)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="IdAnuncio" PropertyName="Text" Name="anuncio" Type="Int32"></asp:ControlParameter>
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:Table ID="Table1" runat="server">
                                            <asp:TableRow ID="ImageUploadRow" Visible="false">
                                                <asp:TableCell>
                                                    <asp:FileUpload ID="ImageUpload" runat="server" AllowMultiple="false"/>
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="ImageValid"
                                                        EnableClientScript="false"
                                                        runat="server" ControlToValidate="ImageUpload"
                                                        ErrorMessage="Only .png .jpeg .jpg" ForeColor="Red"
                                                        ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg|.JPG|.GIF|.jpeg|.JPEG|.png|.PNG|.bmp|.BMP)$"
                                                        SetFocusOnError="true">
                                                    </asp:RegularExpressionValidator>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>
                                                    <asp:Table ID="ImageModButtons2" runat="server" CellSpacing="5">
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="150px">
                                                                <asp:Button ID="BorrarFoto" runat="server" OnClick="BorrarFoto_Click" Text="Borrar Imagen" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="NoBorrarFoto" runat="server" Text="Cancelar" OnClick="NoBorrarFoto_Click" Visible="false" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="YesBorrarFoto" runat="server" OnClick="YesBorrarFoto_Click" Text="Delete" Visible="false" />
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="150px">
                                                                <asp:Button ID="UploadFoto" runat="server" OnClick="UploadFoto_Click" Text="Subir Imagen" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="NoUploadFoto" runat="server" Text="Cancelar" OnClick="NoUploadFoto_Click" Visible="false" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="YesUploadFoto" runat="server" OnClick="YesUploadFoto_Click" Text="Upload" Visible="false" />
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                        <asp:TableRow>
                                                            <asp:TableCell Width="150px">
                                                                <asp:Button ID="ModFoto" runat="server" OnClick="ModFoto_Click" Text="Sustituir Imagen" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="NoModFoto" runat="server" Text="Cancelar" OnClick="NoModFoto_Click" Visible="false" />
                                                            </asp:TableCell>
                                                            <asp:TableCell>
                                                                <asp:Button ID="YesModFoto" runat="server" OnClick="YesModFoto_Click" Text="Change" Visible="false" />
                                                            </asp:TableCell>
                                                        </asp:TableRow>
                                                    </asp:Table>
                                                    <p>
                                                        <asp:Label ID="Label_Estado2" runat="server" ForeColor="Red"></asp:Label>
                                                    </p>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="YesUploadFoto" />
                                        <asp:PostBackTrigger ControlID="YesModFoto" />
                                         <asp:PostBackTrigger ControlID="ModFoto" />
                                         <asp:PostBackTrigger ControlID="UploadFoto" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
