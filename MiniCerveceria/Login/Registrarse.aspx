<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="MiniCerveceria.Login.Registrarse" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>MiniCerveceria</title>
    <link href="~/Imagenes/Iconos/CervezaIcono.png" rel="shortcut icon" type="image/x-icon" />
    <link href="../Scripts/noty.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
        .noty_effects_open {
          opacity: 0;
          transform: translate(50%);
          animation: noty_anim_in 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        .noty_effects_close {
          animation: noty_anim_out 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        @keyframes noty_anim_in {
          100% {
            transform: translate(0);
            opacity: 1;
          }
        }

        @keyframes noty_anim_out {
          100% {
            transform: translate(50%);
            opacity: 0;
          }
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
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
            width: 450px;
            height: 550px;
            background: transparent;
            border: 5px solid #333;
            border-radius: 10px;
            transition: .5s;
        }

        .wrapper:hover {
            border: 5px solid rgb(255, 216, 0);
            box-shadow: 0 0 20px rgb(255, 216, 0), inset 0 0 20px rgb(255, 216, 0);
        }

        h2 {
            font-size: 2em;
            text-align: center;
            color: #fff;
            transition: .5s;
        }

        .wrapper:hover h2 {
            color: rgb(255, 216, 0);
        }

        .input-box {
            position: relative;
            width: 320px;
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
            border: 2px solid rgb(255, 216, 0);
            box-shadow: 0 0 10px rgb(255, 216, 0), inset 0 0 10px rgb(255, 216, 0);
        }

        .input-box input::placeholder {
            color: rgba(255, 255, 255, .3);
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
            color: rgb(255, 216, 0);
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
            background: rgb(255, 216, 0);
            color: #000;
            box-shadow: 0 0 10px rgb(255, 216, 0);
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
            color: #333;
            text-decoration: none;
            font-weight: 600;
            transition: .5s;
        }

        .wrapper:hover .register-link p a {
            color: rgb(255, 216, 0);
        }

        .register-link p a:hover {
            text-decoration: underline;
        }

        #btnBackButton{
            position: absolute;
            left: 20px;
            top: 20px;
        }
    </style>
</head>
<body>
    <a id="btnBackButton" href="/Default"> 
        <img id="imgButtonBack" src="/Imagenes/Iconos/BackButtonWithe.png" height="45"> 
    </a>
    <div class="wrapper">
        <form id="registro" runat="server">
            <h2>Registrarse</h2>
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <asp:TextBox id="txtUsuario" ClientIDMode="Static" placeholder="Ingrese Usuario" required="required" runat="server" />
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="mail"></ion-icon></span>
                <asp:TextBox id="txtCorreo" ClientIDMode="Static" placeholder="Ingrese Correo Electrónico" required="required" runat="server" />
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <asp:TextBox id="txtContrasena" ClientIDMode="Static" placeholder="Ingrese Contraseña" type="password" required="required" runat="server" />
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <asp:TextBox id="txtConfirmarContrasena" ClientIDMode="Static" type="password" placeholder="Confirme Contraseña" required="required" runat="server" />
            </div>
            <button id="btnRegistrar" type="submit">Registrarse</button>
            <div class="register-link">
                <p>Ya tienes una cuenta registrada?<a href="/Login/Login.aspx">Inicia Sesión Ahora!</a></p>
            </div>
        </form>
    </div>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-3.4.1.js"></script>
    <script src="/Scripts/noty.js" type="text/javascript"></script>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#btnRegistrar").on('click', function (e) {
            var confirmarContrasena = $('#txtConfirmarContrasena').val().trim();
            var contrasena = $("#txtContrasena").val().trim();
            var n = new Noty({
                text: "Website under construction",
                type: 'alert',
                layout: 'center',
                theme: 'bootstrap-v4',
                modal: 'true',
                buttons: [
                    Noty.button("Probar notificación", "btn btn-primary", function () {
                        noti.show();
                        location.reload();
                    }),
                    Noty.button("No", "btn btn-primary ml-3", function () {
                        checkAvailability = true;
                        n.close();
                    })],
                animation: {
                    open: 'animated fadeIn faster',
                    close: 'animated fadeOut faster'
                }
            });
            new Noty({
                text: "Website under construction"
            }).show();
            var noti = new Noty({
                text: 'Some notification text'
            });

            if (contrasena != confirmarContrasena) {
                $('#txtConfirmarContrasena').val("");
                $("#txtContrasena").val("");
                n.show();
                return false;
                e.preventDefault();
            };
        });
    });
</script>