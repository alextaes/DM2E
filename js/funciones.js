


function showHint(str) {
    if (str.length == 0) { 
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            document.getElementById("txtHint").innerHTML = this.responseText;
        }
        };
        xmlhttp.open("GET", "php/hints.php?q=" + str, true);
        xmlhttp.send();
    }
}

$('ul a').each(function() {
    if ($(this).attr('class') == 'js-product-request') {
        var level = $(this).attr('level');
        var categoria = $(this).text();
        $(this).attr('href', "products.html?level=" + level + "&categoria=" + categoria);
        //console.log(this);
    }
});


function buscarCategoria(cat){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var myJSON = JSON.parse(this.responseText);
            console.log(myJSON);

        }
    };
    var categoria=cat;
    xhttp.open("GET","php/producto.php?"+"categoria="+categoria, true);
    xhttp.send();			
}


function envio() {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var txt = this.responseText;
            alert(txt);
            document.getElementById('name').value = "";
            mail = document.getElementById('correo').value = "";
            tel = document.getElementById('telefono').value = "";
            mensaje = document.getElementById('mensaje').value = "";
        }
    };
    var nombre = document.getElementById('name').value;
    var mail = document.getElementById('correo').value;
    var tel = document.getElementById('telefono').value;
    var mensaje = document.getElementById('mensaje').value;
    xhttp.open("GET", "php/insert.php?" + "nombre=" + nombre + "&mail=" + mail + "&tel=" + tel + "&mensaje=" + mensaje, true);
    xhttp.send();
}




