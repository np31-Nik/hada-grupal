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
						<table>
							<tr>
								<td>
									<div class="formularioContent3">
										<asp:Table ID="Table3" runat="server">
											<asp:TableRow>
												<asp:TableCell>Banco:</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="TextBoxBanco" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ID="BancoValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxBanco" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="BancoValid" EnableClientScript="false" ControlToValidate="TextBoxBanco" ValidationExpression="[A-Z][a-z]+" runat="server" ErrorMessage="ej:Banco" ForeColor="Red"></asp:RegularExpressionValidator>

												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>Telefono:</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="TextBoxTelefono" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ID="TelefonoValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxTelefono" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="TelefonoValid2" EnableClientScript="false" ControlToValidate="TextBoxTelefono" ValidationExpression="([+]|\d)\d+" runat="server" ErrorMessage="ej: 000000 o +00000" ForeColor="Red"></asp:RegularExpressionValidator>

												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>Email:</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
													<asp:RequiredFieldValidator ID="EmailValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="EmailValid2" EnableClientScript="false" ControlToValidate="TextBoxEmail" ValidationExpression="\w+[@]\w+[.]\w+" runat="server" ErrorMessage="ej: algo@algo.algo" ForeColor="Red"></asp:RegularExpressionValidator>

												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										
										<asp:Table ID="ButtonTable1" runat="server" CellSpacing="10">
											<asp:TableRow ID="optionRow1">
												<asp:TableCell>
													<asp:Button ID="InsertarBanco" runat="server" Text="Insertar" OnClick="InsertarBanco_Click" /> 
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="BorrarBanco" runat="server" Text="Borrar" OnClick="BorrarBanco_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="ModificarBanco" runat="server" Text="Modificar" OnClick="ModificarBanco_Click"  />
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow ID="modRow1" Visible="false">
												<asp:TableCell>
													<asp:Button ID="Cancelar1" runat="server" Text="Cancelar" OnClick="CancelarModBanco_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="Update1" runat="server" Text="Update" OnClick="UpdateModBanco_Click" />
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
										<asp:GridView ID="GridViewBanco" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="banco" ForeColor="#333333" GridLines="None" DataSourceID="sqlBanco" OnSelectedIndexChanged="GridViewBanco_SelectedIndexChanged" >
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
			<h2>Hipoteca</h2>
		</div>
		<div class="formularioContent">
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
				<ContentTemplate>
					<div class="formularioContent2">
						<table>
							<tr>
								<td>
									<div class="formularioContent3">
										<asp:Table ID="Table1" runat="server">
											<asp:TableRow>
												<asp:TableCell Width="76px">ID:</asp:TableCell>
												<asp:TableCell><asp:TextBox ID="TextBoxId" runat="server" Enabled="false" Width="25"></asp:TextBox></asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>Banco:</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="TextBoxBancoH" runat="server" Width="145px"></asp:TextBox>
													<asp:RequiredFieldValidator ID="BancoHValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxBancoH" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RegularExpressionValidator ID="BancoHValid2" EnableClientScript="false" ControlToValidate="TextBoxBancoH" ValidationExpression="[A-Z][a-z]+" runat="server" ErrorMessage="ej:Banco" ForeColor="Red"></asp:RegularExpressionValidator>

												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<asp:Table ID="Table2" runat="server">
											<asp:TableRow>
												<asp:TableCell Width="76px">Desde:</asp:TableCell>
												<asp:TableCell Width="100px">
													<asp:TextBox ID="TextBoxDesde" runat="server" Width="40px"></asp:TextBox>
													<asp:RequiredFieldValidator ID="DesdeValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxDesde" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RangeValidator ID="DesdeValid2" runat="server" EnableClientScript="false" ControlToValidate="TextBoxDesde" MinimumValue="1" MaximumValue="10" ErrorMessage="1-10" ForeColor="Red"></asp:RangeValidator>
												</asp:TableCell>
												<asp:TableCell>Hasta:</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="TextBoxHasta" runat="server" Width="40px"></asp:TextBox>
													<asp:RequiredFieldValidator ID="HastaValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxHasta" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RangeValidator ID="HastaValid2" runat="server" EnableClientScript="false" ControlToValidate="TextBoxHasta" MinimumValue="2" MaximumValue="20" ErrorMessage="2-20" ForeColor="Red"></asp:RangeValidator>
										
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow>
												<asp:TableCell>Interes%:</asp:TableCell>
												<asp:TableCell>
													<asp:TextBox ID="TextBoxInteres" runat="server" Width="40px" ></asp:TextBox>
													<asp:RequiredFieldValidator ID="InteresValid1" EnableClientScript="false" runat="server" ControlToValidate="TextBoxInteres" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
													<asp:RangeValidator ID="InteresValid2" runat="server" EnableClientScript="false" ControlToValidate="TextBoxInteres" MinimumValue="1" MaximumValue="20" ErrorMessage="1-20" ForeColor="Red"></asp:RangeValidator>
												</asp:TableCell>
											</asp:TableRow>
										</asp:Table>
										<asp:Table ID="Table4" runat="server" CellSpacing="10">
											<asp:TableRow ID="optionRow2">
												<asp:TableCell>
													<asp:Button ID="InsertarHipoteca" runat="server" Text="Insertar" OnClick="InsertarHipoteca_Click" /> 
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="BorrarHipoteca" runat="server" Text="Borrar" OnClick="BorrarHipoteca_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="ModificarHipoteca" runat="server" Text="Modificar" OnClick="ModificarHipoteca_Click" />				
												</asp:TableCell>
											</asp:TableRow>
											<asp:TableRow ID="modRow2" Visible="false">
												<asp:TableCell>
													<asp:Button ID="Cancelar2" runat="server" Text="Cancelar" OnClick="CancelarModHipoteca_Click" />
												</asp:TableCell>
												<asp:TableCell>
													<asp:Button ID="Update2" runat="server" Text="Update" OnClick="UpdateModHipoteca_Click" />
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
										<asp:GridView ID="GridViewHipoteca" runat="server" EmptyDataText="La tabla esta vacia"  AutoGenerateSelectButton="True" AllowPaging="True" PageSize="4" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None" DataSourceID="SqlHipoteca" OnSelectedIndexChanged="GridViewHipoteca_SelectedIndexChanged" >
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
								</td>
							</tr>
						</table>
					</div>
				</ContentTemplate>
			</asp:UpdatePanel>
		</div>
	</div>
</asp:Content>
