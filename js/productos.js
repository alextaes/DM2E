var map, geocoder;


$('ul a').each(function() {
    if ($(this).attr('class') == 'js-product-request') {
        var level = $(this).attr('level');
        var categoria = $(this).text();
        $(this).attr('href', "products.html?level=" + level + "&categoria=" + categoria);
        //console.log(this);
    }
});



    $(document).ready(function() {
        var nivel = param("level");
        var nomCategoria = param("categoria");
        
        console.log(nivel, nomCategoria);
        

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var data = JSON.parse(this.responseText);
                console.log(data)
                $.each(data, function(key, value) {
                    productGrid(value.nombre, value.marca, value.img, value.categoria, value.precio, value.tienda);
                    productList(value.nombre, value.marca, value.categoria, value.tienda, value.precio);
                    productMap(value.tienda, value.la, value.lo);
                });
            }
        };
        xhttp.open("GET","php/product.php?"+"nivel="+nivel+"&categoria="+nomCategoria, true);
        xhttp.send();


    });

   

    function param(name) {
        return decodeURIComponent((location.search.split(name + '=')[1] || '').split('&')[0]);
    }



    function productGrid(nombre, marca, img, cate, precio, tienda) {
        $('#view-grid').append('<div class="col-lg-3 col-md-6">\
                                        <div class="caja">'+ 
                                            '<img class="img_caja" src="' + img + '" alt="IMG-PRODUCT""/>'+  
                                            '<div class="card-body">'+
                                                '<h4 class="card-title">'+marca+' '+nombre+'</h4>\
                                                <p class="card-text"><b>Categoría: </b>'+cate+'<br/><b>Tienda: </b>'+tienda+'<br/><b>Precio: </b>'+precio+' €</p>\
                                            </div>\
                                        </div>\
                                </div>'
        );
    }

    function productList(nombre, marca, cate, tienda, precio) {
        $('#view-list').append(
            '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 m-b-30">\
                    <div class="lista"><b>'+marca+' '+nombre+'</b> <i>Categoría: </i>'+cate+' <i>Tienda: </i>'+tienda+' <i>Precio: </i>'+precio+' €\
                    </div>\
            </div>'
        );
    }



    
function productMap(tienda, la, lo) {
    console.log(tienda, la, lo);
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(la, lo),
        title: tienda
    });
    marker.setMap(map);
}

/*funcion cargar mapa */
function initMapProduct() {

    var latlng = new google.maps.LatLng(40.0000000, -4.0000000);


    var mapOptions = {
        zoom: 6.3,
        center: latlng,
        zoomControl: true,
        disableDoubleClickZoom: false,
        scrollwheel: 0,
        navigationControl: true,
        mapTypeControl: false,
        scaleControl: false,
        draggable: 1,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("product-map"), mapOptions);
    // llama a la funcion
    geocoder = new google.maps.Geocoder();

};