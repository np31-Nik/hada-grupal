<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPage_perfil.master" AutoEventWireup="true" CodeBehind="Perfil_Hipoteca-Banco_Admin.aspx.cs" Inherits="UserInterface.Perfil_Hipoteca_Banco_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildPlaceHolder1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="formularioHead">
            <h2>Banco</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p>
                        Banco <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        Telefono <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        Email <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </p>
                    <p >
                        <asp:Button ID="Button1" runat="server" Text="Insertar" /> 
                        &nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Borrar" />
                        &nbsp;
                        <asp:Button ID="Button3" runat="server" Text="Modificar" />
                    </p>
                </div>
                <div class="formularioTable">
                    <asp:GridView ID="GridViewBanco" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="banco" ForeColor="#333333" GridLines="None" DataSourceID="sqlBanco" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="banco" ItemStyle-CssClass="itemStyle2"  HeaderText="banco" ReadOnly="True" SortExpression="banco" />
                                <asp:BoundField DataField="tel" ItemStyle-CssClass="itemStyle2" HeaderText="tel" SortExpression="tel" />
                                <asp:BoundField DataField="email" ItemStyle-CssClass="itemStyle2" HeaderText="email" SortExpression="email" />
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
                    <asp:SqlDataSource ID="sqlBanco" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [Banco]"></asp:SqlDataSource>
                </div>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div>
        <div class="formularioHead">
            <h2>Hipoteca</h2>
        </div>
        <div class="formularioContent">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <div class="formularioContent2">
                <div class="formularioContent3">
                    <p>
                        Banco <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </p>
                    <p>
                        Desde <asp:TextBox ID="TextBox5" runat="server" Width="40px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hasta <asp:TextBox ID="TextBox7" runat="server" Width="40px"></asp:TextBox>
                    </p>
                    <p>
                        Interes% <asp:TextBox ID="TextBox6" runat="server" Width="40px"></asp:TextBox>
                    </p>
                    <p >
                        <asp:Button ID="Button4" runat="server" Text="Insertar" /> 
                        &nbsp;
                        <asp:Button ID="Button5" runat="server" Text="Borrar" />
                        &nbsp;
                        <asp:Button ID="Button6" runat="server" Text="Modificar" />
                    </p>
                </div>
                <div class="formularioTable">
                    <asp:GridView ID="GridViewHipoteca" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" DataSourceID="SqlHipoteca" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="id" ItemStyle-CssClass="itemStyle2" HeaderText="id" ReadOnly="True" SortExpression="id" InsertVisible="False" />
                                <asp:BoundField DataField="banco" ItemStyle-CssClass="itemStyle2" HeaderText="banco" SortExpression="banco" />
                                <asp:BoundField DataField="desde" ItemStyle-CssClass="itemStyle2" HeaderText="desde" SortExpression="desde" />
                                <asp:BoundField DataField="hasta" ItemStyle-CssClass="itemStyle2" HeaderText="hasta" SortExpression="hasta" />
                                <asp:BoundField DataField="interes" ItemStyle-CssClass="itemStyle2" HeaderText="interes" SortExpression="interes" />
                                <asp:BoundField DataField="numSolicitudes" ItemStyle-CssClass="itemStyle2" HeaderText="numSolicitudes" SortExpression="numSolicitudes" />
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
                    <asp:SqlDataSource ID="SqlHipoteca" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConexion %>" SelectCommand="SELECT * FROM [Hipoteca]"></asp:SqlDataSource>
                </div>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
