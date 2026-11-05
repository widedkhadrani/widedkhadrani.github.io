// script.js

// Données pour l'exemple
var data = {
    labels: ["2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"],
    datasets: [
        {
            label: "Films Français",
            borderColor: "rgba(31,68,104,1)",
            backgroundColor: "rgba(31,68,104,1)",
            data: [9, 6, 11, 10, 5, 5, 11, 9, 8, 15],
        },
        {
            label: "Films Américains",
            borderColor: "rgba(206,226,255,1)",
            backgroundColor: "rgba(206,226,255,1)",
            data: [11, 12, 11, 15, 14, 8, 14, 3, 11, 7],
        },
        {
            label: "Films Européens",
            borderColor: "rgba(73,119,164,1)",
            backgroundColor: "rgba(73,119,164,1)",
            data: [7, 4, 5, 4, 9, 14, 16, 3, 11, 9],
        },
        {
            label: "Autres Nationalités",
            borderColor: "rgba(242,214,154,1)",
            backgroundColor: "rgba(242,214,154,1)",
            data: [6, 7, 7, 6, 8, 9, 11, 10, 8, 21],
        }
    ]
};

// Configuration du graphique
var options = {
    scales: {
        x:{
            display: true,
            scaleLabel: {
                display: true,
                labelString: 'Points'
            },
            ticks: {
                color: 'rgba(31, 68, 104, 1)', // Couleur du texte de l'axe des X
            }
        },
        y:{
                type: 'linear',
                display: true,
                position: 'left',
                scaleLabel: {
                    display: true,
                    labelString: 'Barre Y1'
                },
            ticks: {
                color: 'rgba(31, 68, 104, 1)', // Couleur du texte de l'axe des X
            },
            }
    },

    plugins: {
        title: {
            display: true,
            position: 'top',
            text: 'Nombre de films d’animation sortis en salle en France depuis 2013 selon le pays :',
            color: 'rgba(31, 68, 104, 1)', // Couleur du texte du titre du graphique
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

// Création du graphique
var ctx = document.getElementById('myLineChart').getContext('2d');
var myLineChart = new Chart(ctx, {
    type: 'line',
    data: data,
    options: options
});
