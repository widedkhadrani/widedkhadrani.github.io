window.addEventListener("load", function () {


    /* Ajouter la classe 'scrolled' au header quand on scrolle dans la page */
    let header = document.getElementById("header");

    document.addEventListener('scroll', function () {
        console.log("scroll : " + window.scrollY);
        if (window.scrollY > 50) {
            header.classList.add("scrolled");
        } else {
            header.classList.remove("scrolled");
        }
    });


});