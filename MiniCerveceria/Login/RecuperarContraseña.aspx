<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="MiniCerveceria.Login.RecuperarContraseña" %>

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
            height: 40vh;
            background: rgba(0, 0, 0, 0.53);
            border: 5px solid #333;
            border-radius: 10px;
            transition: .5s;
        }

        .wrapper:hover {
            border: 5px solid #fff;
            box-shadow: 0 0 20px #fff, inset 0 0 20px #fff
        }

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

        .hide {
            display: none !important;
        }

        body{
            background-image: url(https://somoscerveza.com/wp-content/uploads/2020/07/beer-concept-1024x682.jpg)  !important;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>
<body>
    <a id="btnBackButton" href="/Default"> 
        <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="45"> 
    </a>
    <div class="wrapper">
        <form runat="server" id="recuperar">
            <h2 id="titleModal">Recuperar contraseña</h2>
            <div id="codigoRecuperacion" class="hide">
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox id="txtCodigoRecuperacion" ClientIDMode="Static" placeholder="Codigo de recuperacion" required="required" runat="server"/>
                </div>
                <button id="btnVerificarCodigo" type="button">Continuar</button>
            </div>
            <div id="cambioContrasñea" class="hide">
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox id="txtNuevaContraseña" ClientIDMode="Static" placeholder="Nueva contraseña"  type="password" required="required" runat="server"/>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <asp:TextBox id="txtConfirmNuevaContraseña" ClientIDMode="Static" placeholder="Confirmar nueva contraseña"  type="password" required="required" runat="server"/>
                </div>
                <button id="btnCambiarContrasenia" type="button">Cambiar contraseña</button>
            </div>
            <div id="RecuperarContraseña">
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <asp:TextBox id="txtEmail" ClientIDMode="Static" placeholder="Email" required="required" runat="server" />
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
                <p><a href="/Login/Login.aspx">Volver al login</a></p>
            </div>
        </form>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        //toastr.options = {
        //    "closeButton": true,
        //    "debug": true,
        //    "newestOnTop": false,
        //    "progressBar": true,
        //    "positionClass": "toast-top-right",
        //    "preventDuplicates": false,
        //    "showDuration": "300",
        //    "hideDuration": "100",
        //    "timeOut": "5000",
        //    "extendedTimeOut": "1000",
        //    "showEasing": "swing",
        //    "hideEasing": "linear",
        //    "showMethod": "fadeIn",
        //    "hideMethod": "fadeOut"
        //}
        var CodigoRecuperacion = "";
        var emai = "";
        
        $(document).ready(function () {
            $("#txtCodigoRecuperacion").val('');
            $("#txtNuevaContraseña").val('');
            $("#txtConfirmNuevaContraseña").val('');
            
            $("#btnRecuperar").click(function () {
                email = $('#txtEmail').val().trim();
    
                if (validarCorreo(email)) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Login/RecuperarContraseña.aspx/ValidarCorreoIngresado") %>',
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        dataType: 'json',
                        data: JSON.stringify({ 'email': email }),
                        success: function (data) {
                            if (data.d) {
                                $.ajax({
                                    type: 'POST',
                                    cache: false,
                                    url: '<%= ResolveUrl("/Login/RecuperarContraseña.aspx/EnviarCorreo") %>',
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
                                        alert("Algo ha salido mal!!!");
                                    }
                                });

                            }
                            else {
                                console.log("el correo ingresado no existe en los registros")
                            }
                        },
                        error: function (data) {
                            alert("Algo ha salido mal!!!");
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
                var NevaPass  =  $("#txtNuevaContraseña").val();
                var VerifNevaPass =  $("#txtConfirmNuevaContraseña").val();

                if (NevaPass == VerifNevaPass) {
                    $.ajax({
                        type: 'POST',
                        cache: false,
                        url: '<%= ResolveUrl("/Login/RecuperarContraseña.aspx/CambiarContraseña") %>',
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
                            alert("Algo ha salido mal!!!");
                        }
                    });
                }
                else {
                    console.log("Las contraseñas no son iguales")
                }
            });

            


        });

        function validarCorreo(correo) {
            var expresion = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return expresion.test(correo);
        }
        
    </script>
</body>
</html>
