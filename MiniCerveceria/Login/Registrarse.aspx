<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="MiniCerveceria.Login.Registrarse" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>MiniCerveceria</title>
    <link href="~/Imagenes/Iconos/CervezaIcono.png" rel="shortcut icon" type="image/x-icon" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .hide {
            display: none !important;
        }
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #000;
        }

        .wrapper {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 50vh;
            height: 85vh;
            background: rgba(0, 0, 0, 0.53);
            border: 5px solid #333;
            border-radius: 10px;
            transition: .5s;
        }

/*        .wrapper:hover {
            border: 5px solid #fff;
            box-shadow: 0 0 20px #fff, inset 0 0 20px #fff
        }*/

        h2 {
            font-size: 2em;
            text-align: center;
            color: #fff;
            transition: .5s;
        }

        .wrapper:hover h2 {
            color: #fff;
        }

        .input-box {
            position: relative;
            width: 40vh;
            margin: 30px 0;
        }

        .input-box input {
            width: 100%;
            height: 50px;
            background: transparent;
            border: 2px solid #333;
            outline: none;
            border-radius: 5px;
            align-content: center;
            font-size: 1em;
            color: #fff;
            padding: 0 10px 0 35px;
            transition: .5s;
        }

        .wrapper:hover .input-box input {
            border: 2px solid #fff;
            box-shadow: 0 0 10px #fff, inset 0 0 10px #fff;
        }

        .input-box input::placeholder {
            color: #fff;
        }

        .input-box .icon {
            position: absolute;
            left: 10px;
            color: #fff;
            font-size: 1.2em;
            line-height: 55px;
            transition: .5s;
        }

        .wrapper:hover .input-box .icon {
            color: #fff;
        }

        .forgot-pass {
            margin: -15px 0 15px;
        }

        .forgot-pass a {
            color: #fff;
            font-size: .9em;
            text-decoration: none;
        }

        .forgot-pass a:hover {
            text-decoration: underline;
        }

        button {
            position: relative;
            width: 100%;
            height: 45px;
            background: #333;
            border: none;
            outline: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            color: #fff;
            font-weight: 500;
            transition: .5s;
        }

        .wrapper:hover button {
            background: #fff;
            color: #000000;
            box-shadow: 0 0 10px #fff;
        }

        .register-link {
            font-size: .9em;
            text-align: center;
            margin: 25px 0;
        }

        .register-link p {
            color: #fff;
        }

        .register-link p a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            transition: .5s;
        }

        .wrapper:hover .register-link p a {
            color: #fff;
        }

        .register-link p a:hover {
            text-decoration: underline;
        }

        #btnBackButton{
            position: absolute;
            left: 20px;
            top: 20px;
        }

        body{
            background-image: url(https://somoscerveza.com/wp-content/uploads/2020/07/beer-concept-1024x682.jpg)  !important;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        .hide {
            display: none !important;
        }

    </style>
</head>
<body>
    <a id="btnBackButton" href="/Default"> 
        <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="45"> 
    </a>
    <div class="wrapper">
        <form id="registro" runat="server">
            <div id="Formulariorregistro">
                <h2>Registrarse</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <asp:TextBox id="txtNombre" ClientIDMode="Static" placeholder="Ingrese Nombre" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <asp:TextBox id="txtApellido" ClientIDMode="Static" placeholder="Ingrese Apellido" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="home"></ion-icon></span>
                    <asp:TextBox id="txtDireccion" ClientIDMode="Static" placeholder="Ingrese Dirección" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="call"></ion-icon></span>
                    <asp:TextBox id="txtTelefono" ClientIDMode="Static" CssClass="isNumero" MaxLength="9" placeholder="Ingrese Número Teléfono (ej:912345678)" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <asp:TextBox id="txtFechaNacimiento" type="date" ClientIDMode="Static" placeholder="Ingrese Fecha Nacimiento (ej: 27-05-2001)" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <asp:TextBox id="txtEmail" ClientIDMode="Static" placeholder="Ingrese Correo Electrónico" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox id="txtContrasena" ClientIDMode="Static" placeholder="Ingrese Contraseña" type="password" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox id="txtConfirmarContrasena" ClientIDMode="Static" type="password" placeholder="Confirme Contraseña" required="required" runat="server" />
                </div>
                <button id="btnRegistrar">Registrarse</button>
                <div class="register-link">
                    <p>Ya tienes una cuenta registrada? <a href="/Login/Login.aspx">Inicia Sesión Ahora!</a></p>
                </div>
            </div>
            <div id="ConfirmacionCorreo" class="hide">
                <h2>Validacion de cuenta</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox id="txtCodigoRecuperacion" ClientIDMode="Static" placeholder="Codigo de verificacion" required="required" runat="server"/>
                </div>
                <button id="btnValidar">Verificar cuenta</button>
            </div>
            <asp:Button id="hdnBtnRegistrar" CssClass="hide" ClientIDMode="Static" Text="Registrarse" runat="server" OnClick="GuardarUsuario"/>
        </form>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-3.6.0.js"></script>
    <script type="text/javascript"></script>
    <%--<script src="/Scripts/toastr.min.js"></script>--%>
</body>
</html>
<script type="text/javascript">
    //toastr.options = {
    //    "closeButton": true,
    //    "debug": true,
    //    "newestOnTop": false,
    //    "progressBar": true,
    //    "positionClass": "toast-top-right",
    //    "preventDuplicates": false,
    //    "showDuration": "300",
    //    "hideDuration": "1000",
    //    "timeOut": "5000",
    //    "extendedTimeOut": "1000",
    //    "showEasing": "swing",
    //    "hideEasing": "linear",
    //    "showMethod": "fadeIn",
    //    "hideMethod": "fadeOut"
    //}
    $(document).ready(function () {
        var CodigoVerificacin = "";

        $("#btnRegistrar").click(function () {
            var confirmarContrasena = $('#txtConfirmarContrasena').val().trim();
            var contrasena = $("#txtContrasena").val().trim();
            var email = $("#txtEmail").val().trim();

            if (validarCorreo(email)) {
                if (contrasena == confirmarContrasena) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Login/RecuperarContraseña.aspx/ValidarCorreoIngresado") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'email': email }),
                        success: function (data) {
                            if (!data.d) {
                                $.ajax({
                                    type: 'POST',
                                    cache: false,
                                    url: '<%= ResolveUrl("/Login/Registrarse.aspx/EnviarCorreo") %>',
                                    contentType: 'application/json; charset=utf-8',
                                    async: false,
                                    dataType: 'json',
                                    data: JSON.stringify({ 'emailReceptor': email }),
                                    success: function (data) {

                                        if (data.d  !=  "") {
                                            CodigoVerificacin = data.d
                                            $('.wrapper').css("height", "40vh");
                                            $('#Formulariorregistro').addClass('hide');
                                            $('#ConfirmacionCorreo').removeClass('hide');

                                            console.log("Se ha enviado el codigo de verificacion al correo ingresado")
                                        } else { 
                                            console.log("el correo ingresado no existe")
                                        }
                                    },
                                    error: function (data) {
                                        alert("Algo ha salido mal!!!");
                                    }
                                });

                            }
                            else {
                                console.log("el correo ingresado ya existe en los registros")
                            }
                        },
                        error: function (data) {
                            alert("Algo ha salido mal!!!");
                        }
                    });
                }
                else {
                    $('#txtConfirmarContrasena').val("");
                    $("#txtContrasena").val("");
                };
            }
            else {
                console.log("formato de correo invalido")
            }
        });

        $('#btnValidar').click(function () {
            var codigo = $('#txtCodigoRecuperacion').val().trim();

            if (codigo == CodigoVerificacin) {
                $("#hdnBtnRegistrar").trigger("click");
            }
            else {
                console.log("Codigo de recuperacion invalido")
            }
            
        })

        $(document).on('keydown', '.isNumero', function (e) {
            // Permitir: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Permitir: Ctrl+A, Command+A
                (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                //permitir Ctrl + V
                (e.keyCode === 86 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Permitir: home, end, izq., der., abajo, arriba
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                if ((e.keyCode === 110 || e.keyCode === 190) && $(this).val().indexOf(".") > -1) {
                    e.preventDefault();
                }
                else if (e.keyCode === 110 || e.keyCode === 190) {
                    let len = $.trim($(this).val().replace("-", "")).length;
                    if (len == 0) {
                        $(this).val("0.");
                        e.preventDefault();
                    }
                }
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }

        });
    });

    function validarCorreo(correo) {
        var expresion = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return expresion.test(correo);
    }
</script>