<%@ Page Title="Anuncio" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anuncio.aspx.cs" Inherits="UserInterface.Anuncio" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="Stylesheet" type="text/css" href="css/Anuncio.css" />

    <div id="ArticuloContainer" >
                        <asp:ScriptManager ID="ScriptManager2" runat="server" />

        <div class="PanelTitulo" style="float:left;background-color:#ffffff;color:black;" >
            <asp:Table ID="TITULO_PRECIO" runat="server">
                <asp:TableRow runat="server">
                    <asp:TableCell ID="TITULO" Width=100% style="font-size:35px;font-weight: bold;"></asp:TableCell>
                    <asp:TableCell style="font-size: 20px;font-weight:bold;" Text="Precio: "></asp:TableCell>
                    <asp:TableCell ID="PRECIO" style="font-size: 20px;"></asp:TableCell>
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
                        <asp:TableCell Text="Localidad: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="LOCALIDAD"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_CODPOSTAL">
                        <asp:TableCell Text="Cod.Postal: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="COD_POSTAL"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="INFO_PROPIEDAD" runat="server" Width="100%">
                    <asp:TableRow runat="server" ID="T_REF_CAT">
                        <asp:TableCell Text="Ref.Catastral: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="REF_CAT"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_SUPERFICIE">
                        <asp:TableCell Text="Superficie: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="SUPERFICIE"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_DORMITORIOS">
                        <asp:TableCell Text="Dormitorios: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="DORMITORIOS"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_BANYOS">
                        <asp:TableCell Text="Baños: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="BANYOS"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_TIPO_PROPIEDAD">
                        <asp:TableCell Text="Tipo: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="TIPO_PROPIEDAD"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="INFO_COCHE" runat="server" Width="100%">
                    <asp:TableRow runat="server" ID="T_ANYO">
                        <asp:TableCell Text="Año: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="ANYO"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_MARCA">
                        <asp:TableCell Text="Marca: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="MARCA"></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow runat="server" ID="T_TIPO_COCHE">
                        <asp:TableCell Text="Tipo: " Width="80%"></asp:TableCell>
                        <asp:TableCell ID="TIPO_COCHE"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
            
            <br />
            <br />

            <div class="PanelHipoteca" style="background-color:#ffffff;color:black;">
            <asp:UpdatePanel runat="server" ID="UpdatePanel_Hipoteca" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="H_CALCULAR" EventName="Click" />
                </Triggers>
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
                    <br />

                <asp:Panel runat="server" id="H_RESULTADOS" visible="false" style="margin-bottom: 1px">
                    <br />
                    <asp:Label runat="server" Text="Resultados" style="font-size:20px;font-weight:bold;text-align:center;" Width="100%"></asp:Label>
                    <div style="float:left;width:50%;">
                        <asp:Label runat="server" Text="Interés anual (%):"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label id="H_INTERES" runat="server"></asp:Label>
                    </div>

                    <br />
                    <br />

                    <div style="float:left;width:50%;">
                        <asp:Label runat="server" Text="Importe a financiar:"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label runat="server" id="H_FINANCIAR"></asp:Label>
                    </div>

                    <br />

                    <div style="float:left;width:50%;">
                        <asp:Label runat="server" Text="Cuota mensual:"></asp:Label>
                    </div>

                    <div style="float:right;">
                        <asp:Label runat="server" id="H_CUOTAM"></asp:Label>
                    </div>
                </asp:Panel>
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
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="IZQ" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="DER" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <asp:Panel runat="server" HorizontalAlign="Center">
                        <asp:Image ID="IMAGE" runat="server" ImageUrl="~/imagenes/no-image.jpg"/>
                        <br />
                        <asp:ImageButton ID="IZQ" runat="server" ImageUrl="~/imagenes/left-arrow.png" style="width:40px;height:40px;" OnClick="PrevImage"/>
                        <asp:ImageButton ID="DER" runat="server" ImageUrl="~/imagenes/right-arrow.png" style="width:40px;height:40px;" OnClick="NextImage"/>
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
                <asp:UpdatePanel runat="server" ID="UpdatePanel_Comentario" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="PublicarComentario" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="Comentario">
                            <asp:TextBox runat="server" ID="ComentarioUsuario" style="width:100%;height:100px" placeholder="Escribe tu comentario aqui..." textmode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:Button runat="server" ID="PublicarComentario" Text="Publicar comentario" OnClick="Comentar" />
                        </div>
                        
                    </ContentTemplate>
                </asp:UpdatePanel>
                    
                <div>
                    <asp:ListView runat="server" ID="ListaComentarios" DataSourceID="Database" >
                        <AlternatingItemTemplate>
                            <span style="background-color: #FAFAD2;color: #284775;">coment:
                            <asp:DynamicControl runat="server" DataField="coment" Mode="ReadOnly" />
                            <br />
                            fecha:
                            <asp:DynamicControl runat="server" DataField="fecha" Mode="ReadOnly" />
                            <br />
                            usuario:
                            <asp:DynamicControl runat="server" DataField="usuario" Mode="ReadOnly" />
<br />
                            <br />
                            </span>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <span style="background-color: #FFCC66;color: #000080;">coment:
                            <asp:DynamicControl runat="server" DataField="coment" Mode="Edit" />
                            <br />
                            fecha:
                            <asp:DynamicControl runat="server" DataField="fecha" Mode="Edit" />
                            <br />
                            usuario:
                            <asp:DynamicControl runat="server" DataField="usuario" Mode="Edit" />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br /><br /></span>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <span>Este anuncio no tiene comentarios.</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">coment:
                            <asp:DynamicControl runat="server" DataField="coment" Mode="Insert" ValidationGroup="Insert" />
                            <br />
                            fecha:
                            <asp:DynamicControl runat="server" DataField="fecha" Mode="Insert" ValidationGroup="Insert" />
                            <br />
                            usuario:
                            <asp:DynamicControl runat="server" DataField="usuario" Mode="Insert" ValidationGroup="Insert" />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            <br /><br /></span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <span style="background-color: #FFFBD6;color: #333333;">coment:
                            <asp:DynamicControl runat="server" DataField="coment" Mode="ReadOnly" />
                            <br />
                            fecha:
                            <asp:DynamicControl runat="server" DataField="fecha" Mode="ReadOnly" />
                            <br />
                            usuario:
                            <asp:DynamicControl runat="server" DataField="usuario" Mode="ReadOnly" />
<br />
                            <br />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">coment:
                            <asp:DynamicControl runat="server" DataField="coment" Mode="ReadOnly" />
                            <br />
                            fecha:
                            <asp:DynamicControl runat="server" DataField="fecha" Mode="ReadOnly" />
                            <br />
                            usuario:
                            <asp:DynamicControl runat="server" DataField="usuario" Mode="ReadOnly" />
<br />
                            <br />
                            </span>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="Database" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [coment], [fecha], [usuario] FROM [Comentario] WHERE ([anuncio] = @anuncio)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="anuncio" QueryStringField="anuncio_id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <br />

        </div>

        <br />
        <br />

        <div class="PanelSimilares" style="background-color:#ffffff;color:black;";height: 332px;">

            <asp:Label runat="server" Text="Articulos similares:" style="font-size:20px;font-weight:bold;text-align:center" Width="100%"></asp:Label>
             <br /><br />
            <div class="ListaSimilares" style="text-align:center; height: 277px;">

                <div class="Similar" id="Similar1" style="float:left;">
                    <asp:ImageButton ImageUrl="~/imagenes/no-image.jpg" Height="225px" Width="300px" runat="server" />
                    <br />
                    <div style="text-align:center;width:80%;margin:auto;">
                        <div style="float:left;">
                            <asp:Label ID="Sim1_Localidad" runat="server"></asp:Label>
                        </div>

                        <div style="float:right">
                            <asp:Label ID="Sim1_Precio" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="Similar" id="Similar2" style="float:left">
                    <asp:ImageButton ImageUrl="~/imagenes/no-image.jpg" Height="225px" Width="300px" runat="server" />
                    <br />
                    <div style="text-align:center;width:80%;margin:auto;">
                        <div style="float:left">
                            <asp:Label ID="Sim2_Localidad" runat="server"></asp:Label>
                        </div>
                        <div style="float:right">
                            <asp:Label ID="Sim2_Precio" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="Similar" id="Similar3" style="float:left">
                    <asp:ImageButton ImageUrl="~/imagenes/no-image.jpg" Height="225px" Width="300px" runat="server" />
                    <br />
                    <div style="text-align:center;width:80%;margin:auto;">
                        <div style="float:left">
                            <asp:Label ID="Sim3_Localidad" runat="server"></asp:Label>
                        </div>
                        <div style="float:right">
                            <asp:Label ID="Sim3_Precio" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="Similar" id="Similar4" style="float:left">
                    <asp:ImageButton ImageUrl="~/imagenes/no-image.jpg" Height="225px" Width="300px" runat="server" />
                    <br />
                    <div style="text-align:center;width:80%;margin:auto;">
                        <div style="float:left">
                            <asp:Label ID="Sim4_Localidad" runat="server"></asp:Label>
                        </div>
                        <div style="float:right">
                            <asp:Label ID="Sim4_Precio" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="Similar" id="Similar5" style="float:left">
                    <asp:ImageButton ImageUrl="~/imagenes/no-image.jpg" Height="225px" Width="300px" runat="server" />
                    <br />
                    <div style="text-align:center;width:80%;margin:auto;">
                        <div style="float:left">
                            <asp:Label ID="Sim5_Localidad" runat="server"></asp:Label>
                        </div>
                        <div style="float:right">
                            <asp:Label ID="Sim5_Precio" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
