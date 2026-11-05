// Données de test
var data = {
    labels: ['La Reine des neiges 2 - Disney', 'Super Mario Bros. le film - Illumination', 'Les Indestructibles 2 - Pixar', 'Shrek 2 - Dreamworks', 'Spider-Man : Across the Spider-Verse - Sony', 'Le Voyage de Chihiro- Ghibli'],
    datasets: [
        {
            label: 'Budget en millions de $',
            backgroundColor: 'rgba(242, 214, 154, 1)',
            borderColor: 'rgba(242, 214, 154, 1)',
            borderWidth: 1,
            borderRadius: 10, // Définir la bordure arrondie
            data: [150, 100, 150, 150, 100, 19]
        },
        {
            label: 'Recettes en millions de $',
            backgroundColor: 'rgba(31, 68, 104, 1)',
            borderColor: 'rgba(31, 68, 104, 1)',
            borderWidth: 1,
            borderRadius: 10, // Définir la bordure arrondie
            data: [1453, 1358, 1243, 929, 687, 356]
        }
    ]
};

// Options du graphique
var options = {
    scales: {
        x: { // L'axe des X
            beginAtZero: true,
            grid: {
                color: 'rgba(0, 0, 0, 0.1)', // Couleur de la grille de l'axe des X
            },
            ticks: {
                color: 'rgba(31, 68, 104, 1)', // Couleur du texte de l'axe des X
            }
        },
        y: { // L'axe des Y
            beginAtZero: true,
            grid: {
                color: 'rgba(0, 0, 0, 0.1)', // Couleur de la grille de l'axe des Y
            },
            ticks: {
                color: 'rgba(31, 68, 104, 1)', // Couleur du texte de l'axe des Y
            }
        }
    },
    plugins: {
        title: {
            display: true,
            position: 'top',
            text: 'Films d’animation ayant le plus rapporté de recettes au box-office mondial selon le studio d’animation :',
            color: 'rgba(31, 68, 104, 1)' // Couleur du texte du titre du graphique
        },
        legend: {
            display: true,
            position: 'bottom', // Position de la légende (peut être 'top', 'bottom', 'left', 'right')
            labels: {
                color: 'rgba(31, 68, 104, 1)', // Couleur du texte de la légende
            },
        },
    }
};

// Configuration du graphique
var config = {
    type: 'bar',
    data: data,
    options: options
};

// Créer le graphique
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, config);
