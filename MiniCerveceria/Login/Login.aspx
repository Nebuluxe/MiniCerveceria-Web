<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MiniCerveceria.Login.Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
            height: 60vh;
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

        .input-box .ComboBox {
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

        option{
            color: #000;
        }

        .wrapper:hover .ComboBox {
            border: 2px solid #fff;
            box-shadow: 0 0 10px #fff, inset 0 0 10px #fff;
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


        #btnBackButton {
            position: absolute;
            left: 20px;
            top: 20px;
        }

        .hide {
            display: none !important;
        }

        body {
            background-image: url(https://somoscerveza.com/wp-content/uploads/2020/07/beer-concept-1024x682.jpg) !important;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        .alert {
            background: rgb(255, 0, 0, .5);
            padding: 20px;
            position: relative;
            right: -20px;
            top: auto
        }
    </style>
</head>
<body>
    <a id="btnBackButton" href="/Default">
        <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="45">
    </a>

    <div class="wrapper">
        <div id="formLogin">
            <form runat="server" id="inicioSesion">
                <h2>Iniciar Sesión</h2>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="mail"></ion-icon>
                    </span>
                    <asp:TextBox ID="txtEmailLogin" placeholder="Email" required="required" runat="server" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <asp:TextBox ID="txtContrasenaLogin" placeholder="Contraseña" type="password" required="required" runat="server" />
                </div>
                <div class="forgot-pass">
                    <a class="abrirRecuperarContraseña" style="cursor: pointer">¿Olvidaste tu contraseña?</a>
                </div>
                <button id="btnIniciarSesion" type="button">Iniciar Sesión</button>

                <asp:Button ID="btnLoginHide" CssClass="hide" ClientIDMode="Static" Text="Registrarse" runat="server" OnClick="IniciarSesion" />
            </form>
            <div class="register-link">
                <p>No tienes una cuenta registrada?<a class="AbrirRegistrar" style="cursor: pointer">Registrate Ahora!</a></p>
            </div>
        </div>
        <div id="formRegistrarse" class="hide">
            <div id="Formulariorregistro">
                <h2>Registrarse</h2>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="person"></ion-icon>
                    </span>
                    <input id="txtNombre" placeholder="Ingrese Nombre" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="person"></ion-icon>
                    </span>
                    <input id="txtApellido" placeholder="Ingrese Apellido" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="home"></ion-icon>
                    </span>
                    <input id="txtDireccion" placeholder="Ingrese Dirección" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="home"></ion-icon>
                    </span>
                    <select name="select" class="ComboBox"  id="cboComuna" required="required">

                    </select>
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="call"></ion-icon>
                    </span>
                    <input id="txtTelefono" cssclass="isNumero" maxlength="9" placeholder="Ingrese Número Teléfono (ej:912345678)" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="calendar-outline"></ion-icon>
                    </span>
                    <input id="txtFechaNacimiento" type="date" placeholder="Ingrese Fecha Nacimiento (ej: 27-05-2001)" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="mail"></ion-icon>
                    </span>
                    <input id="txtEmailRegistro" placeholder="Ingrese Correo Electrónico" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="txtContrasenaRegistro" placeholder="Ingrese Contraseña" type="password" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="txtConfirmarContrasena" type="password" placeholder="Confirme Contraseña" required="required" />
                </div>
                <button id="btnRegistrar">Registrarse</button>
                <div class="register-link">
                    <p>Ya tienes una cuenta registrada? <a class="abrirLogin" style="cursor: pointer">Inicia Sesión Ahora!</a></p>
                </div>
            </div>
            <div id="VerificacionCorreo" class="hide">
                <h2>Validacion de cuenta</h2>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="txtCodigoVerificacion" placeholder="Codigo de verificacion" required="required" />
                </div>
                <button id="btnValidar">Verificar cuenta</button>
            </div>
            <div align="center" id="RegistroExitoso" class="hide">
                <img src="/Imagenes/Iconos/logoCerveza8.png" height="160">
                <div class="register-link">
                    <p>Su cuenta ha sido creada exitosamente!!</p>
                </div>
                <div class="register-link">
                    <p><a class="abrirLogin" style="cursor: pointer">Volver al login</a></p>
                </div>
            </div>
        </div>
        <div id="formRecuperarContraseña" class="hide">
            <h2 id="titleModal">Recuperar contraseña</h2>
            <div id="codigoRecuperacion" class="hide">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="txtCodigoRecuperacion" placeholder="Codigo de recuperacion" required="required" />
                </div>
                <button id="btnVerificarCodigo" type="button">Continuar</button>
            </div>
            <div id="cambioContrasñea" class="hide">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="txtNuevaContraseña" placeholder="Nueva contraseña" type="password" required="required" />
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input id="txtConfirmNuevaContraseña" placeholder="Confirmar nueva contraseña" type="password" required="required" />
                </div>
                <button id="btnCambiarContrasenia" type="button">Cambiar contraseña</button>
            </div>
            <div id="RecuperarContraseña">
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="mail"></ion-icon>
                    </span>
                    <input id="txtEmailRecuperacion" placeholder="Email" required="required" />
                </div>
                <button id="btnRecuperar" type="button">Recuperar contraseña</button>
            </div>
            <div align="center" id="ConfirmarCambio" class="hide">
                <img src="/Imagenes/Iconos/logoCerveza8.png" height="160">
                <div class="register-link">
                    <p>Su contraseña ha sido cambiada con exito!!</p>
                </div>
            </div>
            <div class="register-link">
                <p><a class="abrirLogin" style="cursor: pointer">Ir al login</a></p>
            </div>
        </div>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-3.6.0.js"></script>

    <link href="/Content/toastr.css" rel="stylesheet" />
    <script type="text/javascript" src="/Scripts/toastr.js"></script>

    <script type="text/javascript">
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }

        $(document).ready(function () {

            CargarComuna()

            $('.AbrirRegistrar').on('click', function () {

                if (!$('#formLogin').hasClass("hide")) {
                    $('#formLogin').addClass("hide");
                }

                if (!$('#formRecuperarContraseña').hasClass("hide")) {
                    $('#formRecuperarContraseña').addClass("hide");
                }

                $("#formRegistrarse").removeClass('hide');

                if (!$('#RegistroExitoso').hasClass("hide")) {
                    $('.wrapper').css("height", "40vh");
                }
                else {
                    $('.wrapper').css("height", "90vh");
                }


            })

            $('.abrirLogin').on('click', function () {

                if (!$('#formRegistrarse').hasClass("hide")) {
                    $('#formRegistrarse').addClass("hide");
                }

                if (!$('#formRecuperarContraseña').hasClass("hide")) {
                    $('#formRecuperarContraseña').addClass("hide");
                }

                $("#formLogin").removeClass("hide");

                $('.wrapper').css("height", "40vh");
            })

            $('.abrirRecuperarContraseña').on('click', function () {

                if (!$('#formRegistrarse').hasClass("hide")) {
                    $('#formRegistrarse').addClass("hide");
                }

                if (!$('#formLogin').hasClass("hide")) {
                    $('#formLogin').addClass("hide");
                }

                $("#formRecuperarContraseña").removeClass("hide");

                $('.wrapper').css("height", "40vh");
            })

            //Iniciar sesion

            $("#btnIniciarSesion").click(function () {
                var email = $('#txtEmailLogin').val().trim();
                var contrasena = $("#txtContrasenaLogin").val().trim();

                if (email == "") {
                    Command: toastr["warning"]("Debe ingresar un correo electronico")
                    return;
                }

                if (contrasena == "") {
                    Command: toastr["warning"]("Debe ingresar una contraseña")
                    return;
                }

                if (email != "" && contrasena != "") {
                    if (validarCorreoFormato(email)) {
                        $.ajax({
                            type: 'POST',
                            cache: false,
                            url: '<%= ResolveUrl("/Login/Login.aspx/ValidarCorreoIngresado") %>',
                            contentType: 'application/json; charset=utf-8',
                            async: true,
                            dataType: 'json',
                            data: JSON.stringify({ 'email': email }),
                            success: function (data) {
                                if (data.d) {
                                    $("#btnLoginHide").trigger('click');
                                }
                                else {
                                    Command: toastr["warning"]("El correo ingresado no existe en los registros")
                                }
                            },
                            error: function (data) {
                                Command: toastr["error"]("Algo ha salido mal!!!")
                            }
                        });
                    }
                    else {
                        Command: toastr["warning"]("Formato de correo invalido")
                    }
                }
            });

            //Registro usuario

            var CodigoVerificacin = "";

            $("#btnRegistrar").click(function () {
                var confirmarContrasena = $('#txtConfirmarContrasena').val()
                var contrasena = $("#txtContrasenaRegistro").val()
                var email = $("#txtEmailRegistro").val()

                if (validarCorreoFormato(email)) {
                    if (contrasena == confirmarContrasena) {
                        $.ajax({
                            type: 'POST',
                            cache: false,
                            url: '<%= ResolveUrl("/Login/Login.aspx/ValidarCorreoIngresado") %>',
                            contentType: 'application/json; charset=utf-8',
                            async: false,
                            dataType: 'json',
                            data: JSON.stringify({ 'email': email }),
                            success: function (data) {
                                if (!data.d) {
                                    $.ajax({
                                        type: 'POST',
                                        cache: false,
                                        url: '<%= ResolveUrl("/Login/Login.aspx/EnviarCorreoVerificacion") %>',
                                        contentType: 'application/json; charset=utf-8',
                                        async: false,
                                        dataType: 'json',
                                        data: JSON.stringify({ 'emailReceptor': email }),
                                        success: function (data) {

                                            if (data.d != "") {
                                                CodigoVerificacin = data.d
                                                $('.wrapper').css("height", "40vh");
                                                $('#Formulariorregistro').addClass('hide');
                                                $('#VerificacionCorreo').removeClass('hide');

                                                Command: toastr["success"]("Se ha enviado el codigo de verificacion al correo ingresado")
                                            } else {
                                                Command: toastr["error"]("El correo ingresado no existe")
                                            }
                                        },
                                        error: function (data) {
                                            Command: toastr["error"]("Algo ha salido mal!!!")
                                        }
                                    });

                                }
                                else {
                                    Command: toastr["warning"]("El correo ingresado ya existe en los registros")

                                }
                            },
                            error: function (data) {
                                Command: toastr["error"]("Algo ha salido mal!!!")
                            }
                        });
                    }
                    else {
                        $('#txtConfirmarContrasena').val("");
                    };
                }
                else {
                    Command: toastr["error"]("Formato de correo invalido")
                }
            });

            $('#btnValidar').click(function () {
                var codigo = $('#txtCodigoVerificacion').val().trim();

                var nombre = $('#txtNombre').val()
                var apellido = $('#txtApellido').val()
                var direccion = $('#txtDireccion').val()
                var telefono = $('#txtTelefono').val()
                var fehcaNacimineto = $('#txtFechaNacimiento').val()
                var email = $('#txtEmailRegistro').val()
                var pass = $('#txtConfirmarContrasena').val()
                var comuna = $('#cboComuna').val() 

                if (codigo.trim() == CodigoVerificacin.trim()) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Login/Login.aspx/GuardarUsuario") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'nombre': nombre, 'apellido': apellido, 'direccion': direccion, 'comuna': comuna, 'telefono': telefono, 'fehcaNacimineto': fehcaNacimineto, 'email': email, 'pass': pass, }),
                        success: function (data) {
                            if (data.d) {
                                $('#VerificacionCorreo').addClass('hide');
                                $('#RegistroExitoso').removeClass('hide');
                            }
                            else {
                                Command: toastr["error"]("El correo ingresado no existe en los registros")
                            }
                        },
                        error: function (data) {
                            Command: toastr["error"]("Algo ha salido mal!!!")
                        }
                    });
                }
                else {
                    Command: toastr["error"]("El codigo de verificacion es invalido")
                }

            });

            //Recuperar pass

            var CodigoRecuperacion = "";
            var email = "";

            $("#btnRecuperar").click(function () {

                $("#txtCodigoRecuperacion").val('');
                $("#txtNuevaContraseña").val('');
                $("#txtConfirmNuevaContraseña").val('');

                email = $('#txtEmailRecuperacion').val().trim();

                if (validarCorreoFormato(email)) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Login/Login.aspx/ValidarCorreoIngresado") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'email': email }),
                        success: function (data) {
                            if (data.d) {
                                $.ajax({
                                    type: 'POST',
                                    cache: false,
                                    url: '<%= ResolveUrl("/Login/Login.aspx/EnviarCorreoRecuperacion") %>',
                                    contentType: 'application/json; charset=utf-8',
                                    async: false,
                                    dataType: 'json',
                                    data: JSON.stringify({ 'emailReceptor': email }),
                                    success: function (data) {
                                        CodigoRecuperacion = data.d

                                        $('#RecuperarContraseña').addClass('hide');
                                        $('#codigoRecuperacion').removeClass('hide');

                                        console.log("Se ha enviado el codigo de verificacion al correo ingresado")
                                    },
                                    error: function (data) {
                                        Command: toastr["error"]("Algo ha salido mal!!!")
                                    }
                                });

                            }
                            else {
                                console.log("el correo ingresado no existe en los registros")
                            }
                        },
                        error: function (data) {
                            Command: toastr["error"]("Algo ha salido mal!!!")
                        }
                    });
                } else {
                    console.log("Formato de correo invalido")
                }
            });

            $("#btnVerificarCodigo").click(function () {
                var codigo = $('#txtCodigoRecuperacion').val().trim();

                if (codigo == CodigoRecuperacion) {
                    $('#codigoRecuperacion').addClass('hide');
                    $('#cambioContrasñea').removeClass('hide');
                }
                else {
                    console.log("Codigo de recuperacion invalido")
                }
            });

            $("#btnCambiarContrasenia").click(function () {
                var NevaPass = $("#txtNuevaContraseña").val();
                var VerifNevaPass = $("#txtConfirmNuevaContraseña").val();

                if (NevaPass == VerifNevaPass) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Login/Login.aspx/CambiarContraseña") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'email': email, 'pass': NevaPass }),
                        success: function (data) {
                            if (data.d) {
                                $('#titleModal').addClass('hide');
                                $('#cambioContrasñea').addClass('hide');
                                $('#ConfirmarCambio').removeClass('hide');
                            }
                        },
                        error: function (data) {
                            Command: toastr["error"]("Algo ha salido mal!!!")
                        }
                    });
                }
                else {
                    console.log("Las contraseñas no son iguales")
                }
            });

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

        function CargarComuna(){
            $.ajax({
                type: 'POST',
                cache: false,
                url: '<%= ResolveUrl("/Login/Login.aspx/ObtenerComunas") %>',
                contentType: 'application/json; charset=utf-8',
                async: false,
                dataType: 'json',
                success: function (data) {

                    var html = "";

                    if (data.d != null) {
                        html += "<option value='0'>Seleccione...</option>";
                        $.each(data.d, function (i, val) {
                            html += "<option value='" + val.id_comuna + "'>" + val.nombre_comuna + ", " + val.nombre_region + "</option>";
                        });

                        $('#cboComuna').html(html);
                    }
                },
                error: function (data) {
                    Command: toastr["error"]("Algo ha salido mal!!!")
                }
            });
        }

        function validarCorreoFormato(correo) {
            var expresion = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return expresion.test(correo);
        }
    </script>
</body>
</html>
