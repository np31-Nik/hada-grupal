<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anuncio.aspx.cs" Inherits="UserInterface.Anuncio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="Stylesheet" type="text/css" href="css/Anuncio.css" />

    <div id="ArticuloContainer">

        <div class="PanelTitulo" style="float:left;" >
            <asp:Table ID="TITULO_PRECIO" runat="server" BorderStyle="Groove" BorderColor="LightGray" BorderWidth="2px" >
                <asp:TableRow runat="server">
                    <asp:TableCell ID="TITULO" Width=100% style="font-size:35px;font-weight: bold; color: black"></asp:TableCell>
                    <asp:TableCell style="font-size: 20px;font-weight:bold;color:black" Text="Precio: "></asp:TableCell>
                    <asp:TableCell ID="PRECIO" style="font-size: 20px;color:black"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Label runat="server" Text="REF: " style="font-weight:bold;color:black"></asp:Label>
            <asp:Label ID="REF" runat="server" style="color:black"></asp:Label>
        </div>

        <div class="PanelDerecho" style="float:right; height: 600px;">
            <div class="PanelDetalles" style="border:outset">
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

            <div class="PanelHipoteca" style="border:outset">
                <asp:Label runat="server" Text="Calculador de hipoteca" style="font-size:25px;font-weight:bold;text-align:center;" Width="100%"></asp:Label>
                <br />
                <div style="float:left;width:50%;">
                    <asp:Label runat="server" Text="Importe:" ></asp:Label>
                </div>

                <div style="float:right">
                    <asp:TextBox runat="server" ID="H_IMPORTE" ></asp:TextBox>
                </div>

                <br />

                <div style="float:left;width:50%;">
                    <asp:Label runat="server" Text="Años:" ></asp:Label>
                </div>

                <div style="float:right">
                    <asp:TextBox runat="server" ID="H_ANYOS"></asp:TextBox>
                </div>

                <br />

                <div style="float:left;width:50%;">
                    <asp:Label runat="server" Text="Banco:"></asp:Label>
                </div>

                <div style="float:right">
                    <asp:DropDownList ID="H_BANCOS" runat="server"  ></asp:DropDownList>
                </div>

                <br />

                <div style="width:100%;text-align:center" >
                <asp:Button ID="H_CALCULAR" runat="server" Text="Calcular" />
                </div>

                <asp:Label runat="server" id="H_MENSAJE" style="color:red" Text=""></asp:Label>

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
            </div>
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

        <br />

        <div class="PanelDescripcion" style="border:outset">
            <div>
               <asp:Label runat="server" Text="Descripción:" style="font-size:20px;font-weight:bold;color:black;text-align:center" Width="100%"></asp:Label>
            </div>

            <br />

            <asp:Label ID="DESCRIPCION" runat="server" Width="100%" Text="*DESCRIPCION AQUI*"></asp:Label>
            <br />
        </div>

        <br />
        <br />

        <div class="PanelSimilares" style="border-style: outset; border-color: inherit; border-width: medium; height: 332px;">

            <asp:Label runat="server" Text="Articulos similares:" style="font-size:20px;font-weight:bold;color:black;text-align:center" Width="100%"></asp:Label>
             <br /><br />
            <div class="ListaSimilares" style="text-align:center;">
                <div class="Similar" id="Similar1" style="float:left;" >
                    <asp:ImageButton ImageUrl="~/imagenes/no-image.jpg" Height="225px" Width="300px" runat="server" />
                    <br />
                    <div style="text-align:center;width:80%;margin:auto;">
                        <div style="float:left;">
                            <asp:Label ID="Sim1_Localidad" Text="Alicante" runat="server"></asp:Label>
                        </div>

                        <div style="float:right">
                            <asp:Label ID="Sim1_Precio" Text="250000" runat="server"></asp:Label>
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
