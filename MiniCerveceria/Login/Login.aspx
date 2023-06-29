<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MiniCerveceria.Login.Login" %>

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
        <form runat="server" id="inicioSesion">
            <h2>Iniciar Sesión</h2>
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <asp:TextBox id="txtEmail" ClientIDMode="Static" placeholder="Email" required="required" runat="server" />
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <asp:TextBox id="txtContrasena" ClientIDMode="Static" placeholder="Contraseña"  type="password" required="required" runat="server"/>
            </div>
            <div class="forgot-pass">
                <a href="/Login/RecuperarContraseña.aspx">¿Olvidaste tu contraseña?</a>
            </div>
            <button id="btnIniciarSesion" type="button">Iniciar Sesión</button>
            <asp:Button id="btnLoginHide" CssClass="hide" ClientIDMode="Static" Text="Registrarse" runat="server" OnClick="IniciarSesion"/>
            <div class="register-link">
                <p>No tienes una cuenta registrada?<a href="/Login/Registrarse.aspx">Registrate Ahora!</a></p>
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
        $(document).ready(function () {
            $("#btnIniciarSesion").click(function () {
                var email = $('#txtEmail').val().trim();
                var contrasena = $("#txtContrasena").val().trim();

                if (email != "" && contrasena != "") {
                    $("#btnLoginHide").trigger("click");
                }
            });
        });
    </script>
</body>
</html>
