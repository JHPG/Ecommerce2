function atualizar() {
    document.getElementById('captcha').src = 'wp-includes/captcha/captcha.php?l=150&a=50&tf=20&' + Math.random();
    this.blur();
    return false;
}

function check_step1() {
    if ($('#opcoes-planos').val() == 'extra')
        document.getElementById("radio-domain").style.display = "inline";
    else
    if ($('#opcoes-planos').val() == 'gratis'){
        document.getElementById("domain-availability").style.display = "none";
        document.getElementById("radio-domain").style.display = "none";
        $('#dominio_nao').prop( "checked", true );

    }
}

function check_step2() {
    var x = $('input[name=radio-dominio]:checked').val();
    if (x == '1')
        document.getElementById("domain-availability").style.display = "inline";
    else
        document.getElementById("domain-availability").style.display = "none";
    }

// Auto submit search for this domain when the user preses the enter key on his or her computer
$(document).ready(function ()
{
    //$("#suggested_names").Watermark("Enter a desired domain name here"); 


    //Search domain on pressing of the enter key on computer keyboard
    $('#suggested_names').live("keydown", function (vpb_event)
    {
        if (vpb_event.keyCode == 13 && vpb_event.shiftKey == 0)
        {
            vpb_check_this_domain();
        }
    });
});

//Search domain function
function vpb_check_this_domain()
{
    if ($('#suggested_names').val() == "" || $('#suggested_names').val() == "Enter a desired domain name here")
    {
        $("#vpb_search_status").html('<br clear="all"><br clear="all"><div class="info">Por favor insira um nome de domínio de sua escolha para procurar.</div><br clear="all"><br clear="all">');
        $('#suggested_names').focus();
        return false;
    }
    else
    {
        var dataString = 'domain=' + escape($('#suggested_names').val()) + escape($('#extesion-domain').val());

        $.ajax({
            type: "POST",
            url: "wp-includes/domain_checker/process.php",
            data: dataString,
            cache: false,
            beforeSend: function ()
            {
                $("#vpb_search_status").html('<br clear="all"><br clear="all"><font style="font-family:Verdana, Geneva, sans-serif; font-size:12px;">Verificando Disponibilidade...</font> <img src="wp-includes/domain_checker/images/loadings.gif" align="absmiddle" alt="Procurando..."><br clear="all"><br clear="all">');
            },
            success: function (response)
            {
                $('#vpb_search_status').html(unescape(response));
            }

        });
    }
}