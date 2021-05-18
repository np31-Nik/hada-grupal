<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Propiedad_Admin.aspx.cs" Inherits="UserInterface.Perfil_Propiedad_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="formularioHead">
            <h2>Tipo de Propiedad</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Tipo <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
                    <asp:GridView ID="GridViewTipoPropiedad" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" Width="100px" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" DataSourceID="SqlTipoPropiedad" >
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
                    <asp:SqlDataSource ID="SqlTipoPropiedad" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [TipoPropiedad]"></asp:SqlDataSource>
                </div>
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
