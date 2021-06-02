using library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserInterface
{
    public partial class Perfil: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["nif"] != null)
                {
                    Nif.Text = Session["nif"].ToString();
                    Nombre.Text = Session["nombre"].ToString();
                    Apellido.Text = Session["apellido"].ToString();
                    Telefono.Text = Session["telefono"].ToString();
                    Emali.Text = Session["email"].ToString();
                    Premium.Checked = bool.Parse(Session["premium"].ToString());
                }
                else
                {
                    Response.Redirect("~/Inicio.aspx");
                }
            }
        }
        protected void OffSession_Click(object sender, EventArgs e)
        {
            BorrarUser.Visible = false;
            ModPassword.Visible = false;
            ModPerfil.Visible = false;
            CancelarOff.Visible = true;
            SerrarOff.Visible = true;

        }
        protected void NoToOffSession_Click(object sender, EventArgs e)
        {
            BorrarUser.Visible = true;
            ModPassword.Visible = true;
            ModPerfil.Visible = true;
            CancelarOff.Visible = false;
            SerrarOff.Visible = false;
        }
        protected void YesToOffSession_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            //Session.Clear();
            Response.Redirect("~/Principal.aspx");
        }
        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            SessionOff.Visible = false;
            PasswordPanel.Visible = true;
            ModPassword.Visible = false;
            ModPerfil.Visible = false;
            CancelarDelete.Visible = true;
            Delete.Visible = true;
        }
        protected void YesToDeleteUser_Click(object sender, EventArgs e)
        {
            try
            {
                ENUsuario en = new ENUsuario();
                en.Nif = Nif.Text;
                if (en.deleteUsuario())
                {
                    Session.Abandon();
                    //Session.Clear();
                    Response.Redirect("~/Principal.aspx");
                }
                else
                {
                    LabelEstado.Text = "ERROR inesperado";
                }
            }
            catch (Exception)
            {
                LabelEstado.Text = "ERROR en ejecucion inesperado";
            }
        }
        protected void NoToDeleteUser_Click(object sender, EventArgs e)
        {
            PasswordPanel.Visible = false;
            ModPassword.Visible = true;
            ModPerfil.Visible = true;
            CancelarDelete.Visible = false;
            Delete.Visible = false;
            SessionOff.Visible = true;
        }

        protected void ModPassword_Click(object sender, EventArgs e)
        {
            LabelEstado.Text = "";
            CancelarPassword.Visible = true;
            UpdatePassword.Visible = true;
            PasswordPanel.Visible = true;
            newPasswordPanel.Visible = true;
            ModPerfil.Visible = false;
            BorrarUser.Visible = false;
            SessionOff.Visible = false;
        }
        protected void CncelarPassword_Click(object sender, EventArgs e)
        {
            LabelEstado.Text = "";
            LabelNewPassword.Text = "";
            CancelarPassword.Visible = false;
            UpdatePassword.Visible = false;
            PasswordPanel.Visible = false;
            newPasswordPanel.Visible = false;
            ModPerfil.Visible = true;
            BorrarUser.Visible = true;
            SessionOff.Visible = true;
        }
        protected void UpdatePassword_Click(object sender, EventArgs e)
        {
            if (newPasswordValidator1.IsValid && newPasswordValidator2.IsValid)
            {
                if (newPassword.Text.Equals(newPassword2.Text))
                {
                    ENUsuario us = new ENUsuario();
                    us.Nif = Nif.Text;
                    us.Contrasenya = Password.Text;
                    if (us.readUsuario())
                    {
                        us.Contrasenya = newPassword.Text;
                        if (us.updateUsuario())
                        {
                            Session["nombre"] = us.Nombre;
                            Session["apellido"] = us.Apellido;
                            Session["email"] = us.Email;
                            Session["telefono"] = us.Telefono;
                            LabelEstado.Text = "Exito";
                            LabelNewPassword.Text = "";
                            LabelPassword.Text = "";
                        }
                        else
                        {
                            Nombre.Text = Session["nombre"].ToString();
                            Apellido.Text = Session["apellido"].ToString();
                            Telefono.Text = Session["telefono"].ToString();
                            Emali.Text = Session["email"].ToString();
                            LabelEstado.Text = "ERROR inesperado";
                            LabelNewPassword.Text = "";
                            LabelPassword.Text = "";
                        }
                        CancelarPassword.Visible = false;
                        UpdatePassword.Visible = false;
                        PasswordPanel.Visible = false;
                        newPasswordPanel.Visible = false;
                        ModPerfil.Visible = true;
                    }
                    else
                    {
                        LabelPassword.Text = "Contrasenya incorrecta";
                    }
                }
                else
                {
                    LabelNewPassword.Text = "Las contrasenyas no coinciden";
                }
            }
        }
        protected void ModPerfil_Click(object sender, EventArgs e)
        {
            LabelEstado.Text = "";
            ModPassword.Visible = false;
            UpdatePerfil.Visible = true;
            PasswordPanel.Visible = true;
            CancelarUpdate.Visible = true;
            Nombre.Enabled = true;
            Apellido.Enabled = true;
            Emali.Enabled = true;
            Telefono.Enabled = true;
            Premium.Enabled = true;
            BorrarUser.Visible = false;
            SessionOff.Visible = false;

        }
        protected void Cancelar_Click(object sender, EventArgs e)
        {
            Nombre.Text = Session["nombre"].ToString();
            Apellido.Text = Session["apellido"].ToString();
            Telefono.Text = Session["telefono"].ToString();
            Emali.Text = Session["email"].ToString();
            Premium.Checked = bool.Parse(Session["premium"].ToString());
            ModPassword.Visible = true;
            UpdatePerfil.Visible = false;
            PasswordPanel.Visible = false;
            CancelarUpdate.Visible = false;
            Nombre.Enabled = false;
            Apellido.Enabled = false;
            Emali.Enabled = false;
            Telefono.Enabled = false;
            Premium.Enabled = false;
            SessionOff.Visible = true;
            BorrarUser.Visible = true;
            LabelEstado.Text = "";
            LabelPassword.Text = "";
        }
        protected void UpdatePerfil_Click(object sender, EventArgs e)
        {
            if (TelefonoValid1.IsValid && TelefonoValid2.IsValid &&
                EmailValid1.IsValid && EmailValid2.IsValid &&
                NombreValid1.IsValid && NombreValid2.IsValid &&
                Apellidoalid1.IsValid && Apellidoalid2.IsValid &&
                PasswordValid1.IsValid)
            {
                ENUsuario us = new ENUsuario();
                us.Nif = Nif.Text;
                us.Contrasenya = Password.Text;
                if (us.readUsuario())
                {
                    us.Nombre = Nombre.Text;
                    us.Apellido = Apellido.Text;
                    us.Email = Emali.Text;
                    us.Telefono = Telefono.Text;

                    if (Premium.Checked)
                    {
                        us.Premium = Premium.Checked;
                    }

                    if (us.updateUsuario())
                    {
                        Session["nombre"] = us.Nombre;
                        Session["apellido"] = us.Apellido;
                        Session["email"] = us.Email;
                        Session["telefono"] = us.Telefono;
                        Session["premium"] = us.Premium;
                        LabelEstado.Text = "Exito";
                        LabelPassword.Text = "";
                    }
                    else
                    {
                        Nombre.Text = Session["nombre"].ToString();
                        Apellido.Text = Session["apellido"].ToString();
                        Telefono.Text = Session["telefono"].ToString();
                        Emali.Text = Session["email"].ToString();
                        Premium.Checked = bool.Parse(Session["premium"].ToString());
                        LabelEstado.Text = "ERROR inesperado";
                        LabelPassword.Text = "";
                    }
                    ModPassword.Visible = true;
                    UpdatePerfil.Visible = false;
                    PasswordPanel.Visible = false;
                    CancelarUpdate.Visible = false;
                    Nombre.Enabled = false;
                    Apellido.Enabled = false;
                    Emali.Enabled = false;
                    Telefono.Enabled = false;
                    Premium.Enabled = false;
                }
                else
                {
                    LabelPassword.Text = "Contrasenya incorrecta";
                }
            }
        }
    }
}