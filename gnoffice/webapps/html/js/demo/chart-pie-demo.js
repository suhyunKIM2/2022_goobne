// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("stats_01");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [55, 45],
      backgroundColor: ['#a5e4d7', '#4e9e8e'],
      hoverBackgroundColor: ['#d1fcf3', '#1d8f78'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});

var ctx = document.getElementById("stats_02");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [25, 75],
      backgroundColor: ['#a5e4d7', '#4e9e8e'],
      hoverBackgroundColor: ['#d1fcf3', '#1d8f78'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});

var ctx = document.getElementById("stats_03");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#a5e4d7', '#4e9e8e'],
      hoverBackgroundColor: ['#d1fcf3', '#1d8f78'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});

var ctx = document.getElementById("stats_04");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [55, 45],
      backgroundColor: ['#a5e4d7', '#4e9e8e'],
      hoverBackgroundColor: ['#d1fcf3', '#1d8f78'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});

var ctx = document.getElementById("stats_05");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#a5e4d7', '#4e9e8e'],
      hoverBackgroundColor: ['#d1fcf3', '#1d8f78'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});



/*S: 모바일*/
var ctx = document.getElementById("m_stats_01");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#ffe3c8', '#f78312'],
      hoverBackgroundColor: ['#f7e7d7', '#e57100'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});
var ctx = document.getElementById("m_stats_02");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#ffe3c8', '#f78312'],
      hoverBackgroundColor: ['#f7e7d7', '#e57100'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});
var ctx = document.getElementById("m_stats_03");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#ffe3c8', '#f78312'],
      hoverBackgroundColor: ['#f7e7d7', '#e57100'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});
var ctx = document.getElementById("m_stats_04");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#ffe3c8', '#f78312'],
      hoverBackgroundColor: ['#f7e7d7', '#e57100'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});
var ctx = document.getElementById("m_stats_05");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["포장", "배달"],
    datasets: [{
      data: [45, 55],
      backgroundColor: ['#ffe3c8', '#f78312'],
      hoverBackgroundColor: ['#f7e7d7', '#e57100'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding:15,
      yPadding: 15,
      displayColors: false,
      caretPadding:1,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 90,
  },
});
