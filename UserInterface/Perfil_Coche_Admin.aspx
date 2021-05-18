<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Coche_Admin.aspx.cs" Inherits="UserInterface.Perfil_Coche_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="formularioHead">
            <h2>Marca de Coche</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="formularioContent2">
                <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Marca <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
                    <asp:GridView ID="GridViewMarca" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="marca" ForeColor="#333333" GridLines="None" DataSourceID="SqlMarcaCoche" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="marca" ItemStyle-CssClass="itemStyle2" HeaderText="marca" ReadOnly="True" SortExpression="marca" />
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
                    <asp:SqlDataSource ID="SqlMarcaCoche" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [marca] FROM [MarcaCoche]"></asp:SqlDataSource>
                </div>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div>
        <div class="formularioHead">
            <h2>Tipo de Coche</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p style="margin-top:30px">
                        Tipo <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
                    <asp:GridView ID="GridViewTipoCoche" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" DataSourceID="SqlTipoCoche" >
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
                    <asp:SqlDataSource ID="SqlTipoCoche" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT [tipo] FROM [TipoCoche]"></asp:SqlDataSource>
                </div>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
