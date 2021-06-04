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
						<table>
							<tr>
								<td>
									<div class="formularioContent3">
										<p style="height:30px;"></p>
										<asp:Table ID="BoxTable" runat="server" CellPadding="10">
											<asp:TableRow>
												<asp:TableCell>
													Marca:
												</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="Marca" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ID="MarcaValid1" ValidationGroup="Marca" EnableClientScript="false" runat="server" ControlToValidate="Marca" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="MarcaValid2" EnableClientScript="false" ValidationGroup="Marca" ControlToValidate="Marca" ValidationExpression="[A-Z](([a-z]+)|([A-Z]+))(([\s][A-Z]?[a-z]+))?" runat="server" ErrorMessage="ej: Marca o Marca marca" ForeColor="Red"></asp:RegularExpressionValidator>                                    
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow ID="HidenRow" Visible="false">
												<asp:TableCell>
													New Marca:
												</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="newMarca" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ID="newMarcaValid1" EnableClientScript="false" runat="server" ValidationGroup="Marca" ControlToValidate="newMarca" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="newMarcaValid2" EnableClientScript="false" ValidationGroup="Marca" ControlToValidate="newMarca" ValidationExpression="[A-Z](([a-z]+)|([A-Z]+))(([\s][A-Z]?[a-z]+))?" runat="server" ErrorMessage="ej: Marca o Marca marca" ForeColor="Red"></asp:RegularExpressionValidator>                                    
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<p style="height:20px;"></p>
										<asp:Table ID="ButtonTable1" runat="server" CellSpacing="10">
											<asp:TableRow ID="optionRow1">
												<asp:TableCell>
													<asp:Button ID="InsertarMarca" CausesValidation="true" ValidationGroup="Marca" runat="server" Text="Insertar" OnClick="InsertarMarca_Click" /> 
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="BorrarMarca" CausesValidation="true" ValidationGroup="Marca" runat="server" Text="Borrar" OnClick="BorrarMarca_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="ModificarMarca" CausesValidation="true" ValidationGroup="Marca" runat="server" Text="Modificar" OnClick="ModificarMarca_Click" />
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow ID="modRow1" Visible="false">
												<asp:TableCell>
													<asp:Button ID="Cancelar1" runat="server" Text="Cancelar" OnClick="CancelarModMarca_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="Update1" CausesValidation="true" ValidationGroup="Marca" runat="server" Text="Update" OnClick="UpdateModMarca_Click" />
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<p>
											<asp:Label ID="Label_Estado" runat="server" ForeColor="Red"></asp:Label>
										</p>
									</div>
								</td>
								<td>
									<div class="formularioTable">
									<asp:GridView ID="GridViewMarca" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="marca" ForeColor="#333333" GridLines="None" DataSourceID="SqlMarcaCoche" OnSelectedIndexChanged="GridViewMarca_SelectedIndexChanged" >
											<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
											<Columns>
												<asp:BoundField DataField="marca" ItemStyle-CssClass="itemStyle2" HeaderText="marca" ReadOnly="True" SortExpression="marca" />
											</Columns>
											<EditRowStyle BackColor="#999999" />
											<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
											<HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
								</td>
							</tr>
						</table>
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
						<table>
							<tr>
								<td>
									<div class="formularioContent3">
										<p style="height:30px;"></p>
									<asp:Table ID="BoxTable2" runat="server" CellPadding="10">
										<asp:TableRow>
											<asp:TableCell>
												Tipo:
											</asp:TableCell>
											<asp:TableCell>
												<asp:TextBox ID="Tipo" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="TipoValid1" EnableClientScript="false" runat="server" ControlToValidate="Tipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="TipoValid2" EnableClientScript="false" ControlToValidate="Tipo" ValidationExpression="[A-Z][a-z]+(([\s][A-Z]?[a-z]+))?" runat="server" ErrorMessage="ej: Tipo o Tipo tipo" ForeColor="Red"></asp:RegularExpressionValidator>																					
											</asp:TableCell>
										</asp:TableRow>
										<asp:TableRow ID="HidenRow2" Visible="false">
											<asp:TableCell>
												New Tipo:
											</asp:TableCell>
											<asp:TableCell>
												<asp:TextBox ID="TextBoxNewTipo" runat="server"></asp:TextBox>
												<asp:RequiredFieldValidator ID="newTipoValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxNewTipo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
												<asp:RegularExpressionValidator ID="newTipoValid2" EnableClientScript="false" ControlToValidate="TextBoxNewTipo" ValidationExpression="[A-Z][a-z]+(([\s][A-Z]?[a-z]+))?" runat="server" ErrorMessage="ej: Tipo o Tipo tipo" ForeColor="Red"></asp:RegularExpressionValidator>																
											</asp:TableCell>
										</asp:TableRow>
									</asp:Table>
									<p style="height:20px;"></p>
									<asp:Table ID="ButtonTable2" runat="server" CellSpacing="10">
										<asp:TableRow ID="optionRow2">
											<asp:TableCell>
												<asp:Button ID="InsertarTipo" runat="server" Text="Insertar" OnClick="InsertarTipo_Click" /> 
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="BorrarTipo" runat="server" Text="Borrar" OnClick="BorrarTipo_Click" />
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="ModificarTipo" runat="server" Text="Modificar" OnClick="ModificarTipo_Click" />
											</asp:TableCell>
										</asp:TableRow>
										<asp:TableRow ID="modRow2" Visible="false">
											<asp:TableCell>
												<asp:Button ID="Cancelar2" runat="server" Text="Cancelar" OnClick="CancelarModTipo_Click" />
											</asp:TableCell>
											<asp:TableCell>
												<asp:Button ID="Update2" runat="server" Text="Update" OnClick="UpdateModTipo_Click" />
											</asp:TableCell>
										</asp:TableRow>
									</asp:Table>
										<p>
											<asp:Label ID="Label_Estado2" runat="server" ForeColor="Red"></asp:Label>
										</p>
									</div>
								</td>
								<td>
									<div class="formularioTable">
										<asp:GridView ID="GridViewTipoCoche" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="tipo" ForeColor="#333333" GridLines="None" DataSourceID="SqlTipoCoche" OnSelectedIndexChanged="GridViewTipoCoche_SelectedIndexChanged" >
												<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
												<Columns>
													<asp:BoundField DataField="tipo" ItemStyle-CssClass="itemStyle2" HeaderText="tipo" ReadOnly="True" SortExpression="tipo" />
												</Columns>
												<EditRowStyle BackColor="#999999" />
												<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
												<HeaderStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
								</td>
							</tr>
						</table>
					</div>
				</ContentTemplate>
			</asp:UpdatePanel>
		</div>
	</div>
</asp:Content>
