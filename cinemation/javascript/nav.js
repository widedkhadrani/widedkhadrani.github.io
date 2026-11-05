document.addEventListener("DOMContentLoaded", function () {
    // Sélectionnez tous les liens du menu
    var navLinks = document.querySelectorAll('.navbar-nav a');

    // Fonction pour mettre à jour la classe "active" sur le lien approprié
    function updateActiveLink() {
        var currentSectionId = null;

        // Parcourez les sections de la page
        document.querySelectorAll('section').forEach(function (section) {
            var boundingBox = section.getBoundingClientRect();

            // Vérifiez si la section est actuellement visible sur l'écran
            if (
                boundingBox.top <= window.innerHeight / 2 &&
                boundingBox.bottom >= window.innerHeight / 2
            ) {
                currentSectionId = section.id;
            }
        });

        // Mettez à jour la classe "active" sur le lien approprié
        navLinks.forEach(function (link) {
            var sectionId = link.getAttribute('href').substring(1);

            if (sectionId === currentSectionId) {
                link.classList.add('active');
            } else {
                link.classList.remove('active');
            }
        });
    }

    // Attachez la fonction au défilement de la page
    window.addEventListener('scroll', updateActiveLink);

    // Appelez la fonction une fois au chargement de la page pour gérer l'état initial
    updateActiveLink();
});