<%@ Page Title="Anuncio" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anuncio.aspx.cs" Inherits="UserInterface.Anuncio" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="Stylesheet" type="text/css" href="css/Anuncio.css" />

    <div id="ArticuloContainer" >
                        <asp:ScriptManager ID="ScriptManager2" runat="server" />

        <div class="PanelTitulo" style="float:left;background-color:#ffffff;color:black;" >
            <asp:Table ID="TITULO_PRECIO" runat="server">
                <asp:TableRow runat="server">
                    <asp:TableCell ID="TITULO" Width=99% style="font-size:35px;font-weight: bold;"></asp:TableCell>
                    <asp:TableCell style="font-size: 20px;font-weight:bold;float:right;" Text="Precio: "></asp:TableCell>
                    <asp:TableCell ID="PRECIO" style="font-size: 20px;float:right"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Label runat="server" Text="REF: " style="font-weight:bold;"></asp:Label>
            <asp:Label ID="REF" runat="server"></asp:Label>
        </div>

        <div class="PanelDerecho" style="float:right; height: 600px;">


            <div class="PanelDetalles" style="background-color:#ffffff;color:black;">

                <asp:Label runat="server" Text="Contacto" style="font-size:25px;font-weight:bold;text-align:center" Width="100%"></asp:Label>
                <br />
                <asp:Label ID="PROPIETARIO" runat="server" style="text-align:center" Width="100%"></asp:Label>
                <br />
                <asp:Table ID="CONTACTO" runat="server" Width="100%">
                    <asp:TableRow runat="server" ID="T_DATOSCONTACTO">
                        <asp:TableCell ID="TELEFONO" Width="80%"></asp:TableCell>
                        <asp:TableCell ID="EMAIL" Width="80%"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>



            </div>

            <br />
            <br />

            <div class="PanelDetalles" style="background-color:#ffffff;color:black;">
                <asp:Label runat="server" Text="Detalles" style="font-size:25px;font-weight:bold;text-align:center" Width="100%"></asp:Label>

                <asp:Table ID="INFO_GENERAL" runat="server" Width="100%">
                    <asp:TableRow runat="server" ID="T_LOCALIDAD">
                        <asp:TableCell Text="Localidad: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="LOCALIDAD" style="float:right"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="INFO_PROPIEDAD" runat="server" Width="100%">
                    <asp:TableRow runat="server" ID="T_REF_CAT">
                        <asp:TableCell Text="Ref.Catastral: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="REF_CAT" style="float:right">-</asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_SUPERFICIE">
                        <asp:TableCell Text="Superficie: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="SUPERFICIE" style="float:right"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_DORMITORIOS">
                        <asp:TableCell Text="Dormitorios: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="DORMITORIOS" style="float:right"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_BANYOS">
                        <asp:TableCell Text="Baños: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="BANYOS" style="float:right"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_TIPO_PROPIEDAD">
                        <asp:TableCell Text="Tipo: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="TIPO_PROPIEDAD" style="float:right"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="INFO_COCHE" runat="server" Width="100%">
                    <asp:TableRow runat="server" ID="T_ANYO">
                        <asp:TableCell Text="Año: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="ANYO" style="float:right"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_MARCA">
                        <asp:TableCell Text="Marca: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="MARCA" style="float:right"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_TIPO_COCHE">
                        <asp:TableCell Text="Tipo: " Width="50%"></asp:TableCell>
                        <asp:TableCell ID="TIPO_COCHE" style="float:right"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            
            <br />
            <br />

            <div class="PanelHipoteca" style="background-color:#ffffff;color:black;">
            <asp:UpdatePanel runat="server" ID="UpdatePanel_Hipoteca" UpdateMode="Always">

                <ContentTemplate>
                     <asp:Label runat="server" Text="Calculador de hipoteca" style="font-size:25px;font-weight:bold;text-align:center;" Width="100%"></asp:Label>
                <br />
                <div style="float:left">
                    <asp:Label runat="server" Text="Importe:" ></asp:Label>
                </div>

                    <div style="float:right">
                    <asp:TextBox runat="server" ID="H_IMPORTE" ></asp:TextBox>
                </div>

                    <div style="float:right">
                        <asp:RangeValidator ID="RangeValidator1" runat ="server" ErrorMessage="Introduce un importe" ControlToValidate="H_IMPORTE"
                            Type="Integer" MinimumValue="1000" MaximumValue="100000000" Style="color:red" Display="Dynamic" ValidationGroup="Hipoteca"
                            EnableClientScript="false">*</asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Introduce un importe" 
                            ControlToValidate="H_IMPORTE" Style="color:red" Display="Dynamic" ValidationGroup="Hipoteca" 
                            EnableClientScript="false">*</asp:RequiredFieldValidator>
                    </div>
                <br />

                <div style="float:left">
                    <asp:Label runat="server" Text="Años:" ></asp:Label>
                </div>
                    <div style="float:right">
                    <asp:TextBox runat="server" ID="H_ANYOS"></asp:TextBox>
                </div>
                    <div style="float:right">
                        <asp:RangeValidator ID="RangeValidator2" runat ="server" ErrorMessage="Introduce una cantidad de años (1-40)" ControlToValidate="H_ANYOS"
                            Type="Integer" MinimumValue="1" MaximumValue="40" Style="color:red" Display="Dynamic" ValidationGroup="Hipoteca"
                            EnableClientScript="false">*</asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Introduce una cantidad de años(1-40)"
                            ControlToValidate="H_ANYOS" Style="color:red" Display="Dynamic" ValidationGroup="Hipoteca"
                            EnableClientScript="false">*</asp:RequiredFieldValidator>
                    </div>
                <br />
                <div style="float:left">
                    <asp:Label runat="server" Text="Banco:"></asp:Label>
                </div>
                   

                <div style="float:right">
                    <asp:DropDownList ID="BANCO" runat="server" style="float:right;" AppendDataBoundItems="True" Height="25px" Width="125px" DataSourceID="Banco_db" DataTextField="banco" DataValueField="banco">
                        <asp:ListItem Text="Elige..."/>   
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Banco_db" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [banco] FROM [Banco]"></asp:SqlDataSource>
                </div>

                     <div style="float:right">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="Elige..." 
                            ErrorMessage="Elige un Banco" ControlToValidate="BANCO" Style="color:red" ValidationGroup="Hipoteca"
                            EnableClientScript="false">*</asp:RequiredFieldValidator>
                    </div>
                <br />

                <div style="width:100%;text-align:center" >
                <asp:Button ID="H_CALCULAR" runat="server" Text="Calcular" OnClick="CalcularHipoteca" CausesValidation="true" ValidationGroup="Hipoteca" />
                </div>
                    <br />
                    <asp:ValidationSummary runat="server" DisplayMode="BulletList" EnableClientScript="false" ID="ValidationSummary_Hipoteca" ValidationGroup="Hipoteca"
                        Forecolor="red"/>
                    <asp:Label runat="server" ID="MensajeH" Visible="false" ForeColor="Red" Text="No se ha encontrado ninguna hipoteca disponible con este banco."></asp:Label>

                <div runat="server" id="H_RESULTADO" visible="false">
                    <br />
                    <asp:Label runat="server" Text="Resultados" style="font-size:20px;font-weight:bold;text-align:center;" Width="100%"></asp:Label>
                    <div style="float:left;">
                        <asp:Label runat="server" Text="Interés anual:"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label id="H_INTERES" runat="server"></asp:Label>
                    </div>
                    <br />
                    <br />
                    <div style="float:left">
                        <asp:Label runat="server" Text="Cuota mensual:"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label runat="server" id="H_CUOTAM"></asp:Label>
                    </div>
                    <br />
                    <div style="float:left;">
                        <asp:Label runat="server" Text="Tel. del banco:"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label id="TEL_BANCO" runat="server"></asp:Label>
                    </div>
                    <br />
                    <div style="float:left;">
                        <asp:Label runat="server" Text="Email del banco:"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label id="EMAIL_BANCO" runat="server"></asp:Label>
                    </div>
                    
                    <br />
                </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
        </div>
        
        <br />
        <br />
        <br />
        <br />
        <div class="PanelImagen" style="background-color:#ffffff;color:black;">
            <br />
            <asp:UpdatePanel runat="server" ID="UpdatePanel_Imagen" UpdateMode="Conditional">

                <ContentTemplate>
                    <asp:Panel runat="server" HorizontalAlign="Center">
                        <table width="100%">
   <tr>
     <td align="center">
       <table>
         <tr>
            <td>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="Imagenes" OnDataBound="ListView1_DataBound">
                            <EmptyDataTemplate>
                                <table runat="server">
                                    <tr>
                                        <td><asp:Image ID="IMAGE" runat="server" ImageUrl="~\imagenes\no-image.jpg"/></td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Image ID="foto" runat="server" Height="600px" Width="1000px" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div style="width:100%;position:center;text-align:center;">
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
                                            <asp:DataPager ID="DataPager1" runat="server" PageSize="1" >
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" PreviousPageImageUrl="~/imagenes/left-arrow.png"  ShowNextPageButton="false" ShowPreviousPageButton="true"
                                                        ButtonCssClass="BotonesIMG" ShowFirstPageButton="false" ShowLastPageButton="false" PreviousPageText="<"/>
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
                 </td>
         </tr>
       </table>
     </td>
   </tr>
</table>
                        <asp:SqlDataSource ID="Imagenes" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Anuncio.id, Foto.foto FROM Anuncio CROSS JOIN Foto WHERE Foto.anuncio = Anuncio.id AND Anuncio.id = @id">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="id" QueryStringField="anuncio_id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>

        <br />

        <div class="PanelDescripcion" style="background-color:#ffffff;color:black;">
            <div>
               <asp:Label runat="server" Text="Descripción:" style="font-size:20px;font-weight:bold;text-align:center" Width="100%"></asp:Label>
            </div>

            <br />

            <asp:Label ID="DESCRIPCION" runat="server" Width="100%" ></asp:Label>
            <br />
        </div>

        <br />
        <br />

        <div class="PanelDescripcion" ID="Panel_Comentarios" style="background-color:#ffffff;color:black;">
            <div>
               <asp:Label runat="server" Text="Comentarios de otros usuarios:" style="font-size:20px;font-weight:bold;text-align:center" Width="100%"></asp:Label>
                <asp:UpdatePanel runat="server" ID="UpdatePanel_Comentario" UpdateMode="Always">

                    <ContentTemplate>
                        <asp:Label runat="server" ID="Mensaje_comentario" Visible="false" Text="Debes iniciar sesión para poder escribir comentarios." style="text-align:center" Width="100%"></asp:Label>
                        <asp:Panel runat="server" CssClass="Comentario" id="PanelComentarioUsuario" Visible="false">
                            <asp:TextBox runat="server" ID="ComentarioUsuario" style="width:100%;height:100px" placeholder="Escribe tu comentario aqui..." textmode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:Button runat="server" ID="PublicarComentario" Text="Publicar comentario" OnClick="Comentar" />
                        </asp:Panel>
                        
                
                    
                <div>
                    <asp:ListView runat="server" ID="ListaComentarios" DataSourceID="Database" >
                        
                        <EmptyDataTemplate>
                            <span>No hay comentarios.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <td runat="server" style="background-color:#DCDCDC;color: #000000;border:ridge;border-color:black">
                            [<asp:Label ID="fechaLabel" runat="server" Text='<%# Eval("fecha","{0:dd/mm/yyyy}") %>' />]
                            <br />
                            [<asp:Label ID="usuarioLabel" runat="server" Text='<%# Eval("nombre") %>' />]
                            <br />
                            ><asp:Label ID="comentLabel" runat="server" Text='<%# Eval("coment") %>' />
                            <br />
                                </td>
                            <br />
                        </ItemTemplate>
                        <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                        <LayoutTemplate>
                            <div id="groupPlaceholderContainer" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;" >
                                <span runat="server" id="groupPlaceholder" />
                            </div>
                            <div style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                       
                    </asp:ListView>
                    <asp:SqlDataSource ID="Database" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Comentario.fecha, Comentario.usuario, Comentario.coment, Usuario.nombre FROM [Comentario] ,[Usuario] WHERE ([anuncio] = @anuncio) AND Usuario.nif = Comentario.usuario">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="anuncio" QueryStringField="anuncio_id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 </ContentTemplate>
                    </asp:UpdatePanel>
            </div>

            <br />

        </div>

        <br />
        <br />

        <div class="PanelSimilares" style="background-color:#ffffff;color:black;";height: 332px;">
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
            <asp:Label runat="server" Text="Articulos similares:" style="font-size:20px;font-weight:bold;text-align:center" Width="100%"></asp:Label>
             <br /><br />
            <div class="ListaSimilares" style="text-align:center; height: 277px;">
                                    <table width="100%">
   <tr>
     <td align="center">
       <table>
         <tr>
            <td>
                <asp:ListView ID="ListViewSimilares" runat="server" GroupItemCount="5" DataSourceID="DatosBusqueda">
                    
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No se han encontrado articulos similares.</td>
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
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;border:ridge;border-color:black">
                            <asp:ImageButton ID="FOTObtn" runat="server" ImageUrl='<%#"data:Image/jpb;base64,"+Convert.ToBase64String((byte[])Eval("foto")) %>' Width="300px" Height="200px"
                                  OnClick="AnuncioSimilar" CommandArgument='<%# Eval("id") %>' />
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
                                    <table id="groupPlaceholderContainer" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="5">

                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    
                </asp:ListView>
                <asp:SqlDataSource ID="DatosBusqueda" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT Anuncio.id, Anuncio.precio, Anuncio.tipo, Anuncio.localidad, Foto.foto FROM Anuncio CROSS JOIN Foto WHERE (Foto.id = (SELECT MIN(id) AS Expr1 FROM Foto AS Foto_1 WHERE (anuncio = Anuncio.id))) AND (Anuncio.id &lt;&gt; @id) AND (Anuncio.categoria = @categoria) AND (Anuncio.tipo = @tipo) AND (Anuncio.localidad = @localidad)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="anuncio_id" />
                        <asp:ControlParameter ControlID="CATEGORIA" Name="categoria" PropertyName="Value" />
                        <asp:ControlParameter ControlID="TIPO_ANUNCIO" Name="tipo" PropertyName="Value" />
                        <asp:ControlParameter ControlID="LOCALIDADH" Name="localidad" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                </td>
         </tr>
       </table>
     </td>
   </tr>
</table>
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
     <asp:HiddenField ID="CATEGORIAH" runat="server"/>
         <asp:HiddenField ID="CATEGORIA" runat="server"/>

     <asp:HiddenField ID="TIPO_ANUNCIO" runat="server"/>
     <asp:HiddenField ID="LOCALIDADH" runat="server"/>

</asp:Content>
