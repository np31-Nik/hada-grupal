<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_TipoAnuncio_Admin.aspx.cs" Inherits="UserInterface.Perfil_TipoAnuncio_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <div class="formularioHead">
            <h2>Tipos de Anuncios</h2>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="formularioContent2">
                    <div class="formularioContent3">
                        <p style="margin-top:30px">
                            Tipo <asp:TextBox ID="Tipo" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="TipoValid1" EnableClientScript="false" runat="server" ControlToValidate="Tipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="TipoValid2" EnableClientScript="false" ControlToValidate="Tipo" ValidationExpression="[a-z]*" runat="server" ErrorMessage="Solo se permiten caracteres" ForeColor="Red"></asp:RegularExpressionValidator>
                        </p>
                        <p style="margin-top:40px">
                            <asp:Button ID="InsertarTipoA" runat="server" Text="Insertar" OnClick="InsertarTipoA_Click" /> 
                            &nbsp;
                            <asp:Button ID="BorrarTipoA" runat="server" Text="Borrar" OnClick="BorrarTipoA_Click" />
                            &nbsp;
                            <asp:Button ID="ModificarTipoA" runat="server" Text="Modificar" OnClick="ModificarTipoA_Click" />
                        </p>
                    </div>

                    <div class="formularioTable"> 
                        <asp:GridView ID="GridViewTipoAnuncio" runat="server" EmptyDataText="La tabla esta vacia" AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewTipoAnuncio_SelectedIndexChanged" DataSourceID="SqlTipoAnuncio" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="tipo" ItemStyle-CssClass="itemStyle2" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle  BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlTipoAnuncio" runat="server"  ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>
                    </div>
                </div>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
     </div>
    <div>
        <div class="formularioHead">
            <h2>Localidades</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                <div class="formularioContent2">
                    <div class="formularioContent3">
                        <p style="margin-top:30px">
                            Localidad <asp:TextBox ID="Localidad" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="LocalidadValid1" EnableClientScript="false" runat="server" ControlToValidate="Localidad" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="LocalidadValid2" EnableClientScript="false" ControlToValidate="Localidad" ValidationExpression="[a-z]*" runat="server" ErrorMessage="Solo se permiten caracteres" ForeColor="Red"></asp:RegularExpressionValidator>
                        </p>
                        <p style="margin-top:40px">
                            <asp:Button ID="InsertarLocalidad" runat="server" Text="Insertar" OnClick="InsertarLocalidad_Click" /> 
                            &nbsp;
                            <asp:Button ID="BorrarLocalidad" runat="server" Text="Borrar" OnClick="BorrarLocalidad_Click" />
                            &nbsp;
                            <asp:Button ID="ModificarLocalidad" runat="server" Text="Modificar" OnClick="ModificarLocalidad_Click" />
                        </p>
                    </div>
                    <div class="formularioTable">
                        <asp:GridView ID="GridViewLocalidad" runat="server" EmptyDataText="La tabla esta vacia" AutoGenerateColumns="False" AllowPaging="True" PageSize="4" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="localidad" DataSourceID="sqlLocalidad">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="localidad" ItemStyle-CssClass="itemStyle2" HeaderText="localidad" ReadOnly="True" SortExpression="localidad" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2"  />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="sqlLocalidad" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [localidad] FROM [Localidad]"></asp:SqlDataSource>
                    </div>
                </div>
                </ContentTemplate>
            </asp:UpdatePanel> 
        </div>
     </div>

</asp:Content>
