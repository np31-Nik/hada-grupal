<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_TipoAnuncio_Admin.aspx.cs" Inherits="UserInterface.Perfil_TipoAnuncio_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <div class="formularioHead">
            <h2>Tipos de Anuncios</h2>
        </div>
        <div class="formularioContent">
                <div class="formularioContent2">
                    <div class="formularioContent3">
                        <p style="margin-top:30px">
                            Tipo <asp:TextBox ID="Tipo" runat="server"></asp:TextBox>
                        </p>
                        <p style="margin-top:40px">
                            <asp:Button ID="Button1" runat="server" Text="Insertar" /> 
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Borrar" />
                            &nbsp;
                            <asp:Button ID="Button3" runat="server" Text="Modificar" />
                        </p>
                    </div>
                    <div class="formularioTable">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" Width="100px" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="TipoAnuncio" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="tipo" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
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
                        <asp:SqlDataSource ID="TipoAnuncio" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoAnuncio]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
     </div>
    <div>
        <div class="formularioHead">
            <h2>Localidades</h2>
        </div>
        <div class="formularioContent">
                <div class="formularioContent2">
                    <div class="formularioContent3">
                        <p style="margin-top:30px">
                            Localidad <asp:TextBox ID="Localidad" runat="server"></asp:TextBox>
                        </p>
                        <p style="margin-top:40px">
                            <asp:Button ID="Button4" runat="server" Text="Insertar" /> 
                            &nbsp;
                            <asp:Button ID="Button5" runat="server" Text="Borrar" />
                            &nbsp;
                            <asp:Button ID="Button6" runat="server" Text="Modificar" />
                        </p>
                    </div>
                    <div class="formularioTable">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                    </div>
                </div>
            </div>
     </div>

</asp:Content>
