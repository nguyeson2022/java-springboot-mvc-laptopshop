document.addEventListener('DOMContentLoaded', function () {
    const revenueCtx = document.getElementById('revenueChart');
    const statusCtx = document.getElementById('orderStatusChart');

    if (revenueCtx) {
        fetch('/api/dashboard/revenue')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(result => {
                new Chart(revenueCtx, {
                    type: 'line',
                    data: {
                        labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
                        datasets: [{
                            label: 'Doanh thu (triệu VNĐ)',
                            data: result.data || [],
                            borderColor: 'rgb(75, 192, 192)',
                            tension: 0.1,
                            fill: false
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: 'Tháng',
                                    font: {
                                        weight: 'bold' // Thêm thuộc tính này để làm đậm chữ
                                    }
                                }
                            },
                            y: {
                                title: {
                                    display: true,
                                    text: 'Doanh thu (triệu VNĐ)',
                                    font: {
                                        weight: 'bold' // Thêm thuộc tính này để làm đậm chữ
                                    }
                                },
                                beginAtZero: true
                            }
                        },
                        plugins: {
                            legend: {

                                labels: {
                                    padding: 20,
                                    font: {
                                        weight: 'bold' // Thêm thuộc tính này để làm đậm chữ
                                    }
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Revenue chart error:', error));
    }

    if (statusCtx) {
        fetch('/api/dashboard/orders/status')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(result => {
                new Chart(statusCtx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Chưa giải quyết', 'Vận chuyển', 'Hoàn thành', 'Hủy bỏ'],
                        datasets: [{
                            data: result.data || [],
                            backgroundColor: [
                                '#f6c23e', // warning - yellow
                                '#4e73df', // primary - blue
                                '#1cc88a', // success - green
                                '#e74a3b'  // danger - red
                            ]
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'bottom',
                                labels: {
                                    padding: 20,
                                    font: {
                                        weight: 'bold' // Thêm thuộc tính này để làm đậm chữ
                                    }
                                }
                            }
                        }
                    }
                });
            })
            .catch(error => console.error('Status chart error:', error));
    }
});