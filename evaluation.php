<!DOCTYPE html>
<html>
    <head>
        <title>God Eye | Evaluation</title>
        <style type="text/css">
            body {
                background-color: #3C3F58;
            }
            
            header {
                padding-right: 5px;
                padding-top: 5px;
                text-align: right;
            }

            #nav {
                font-size: 20px;
                color: #3BBA9C; 
            }

            .navbar {
                text-decoration: none;
                color: #3BBA9C; 
            }

            .main {
                text-align: center;
                color: #3BBA9C;
                font-size: 20px;
            }

            .title {
                margin-top: 5%;
                font-size: 25px;
            }

            .result {
                width: 80%;
                margin: auto;
            }

            .table {
                margin-top: 5%;
                width: 100%;
            }

            table, tr, td {
                border: 2px solid #3BBA9C;
                border-collapse: collapse;
            }

            thead {
                font-weight: bold;
            }

            #donutchart{
                width: 700px; 
                height: 400px; 
                margin-left: auto; 
                margin-right: auto;
            }
        </style>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <header>
            <div id="nav">
                <a href="index.php" class="navbar">Home</a> | 
                <a href="crawl.php" class="navbar">Crawling</a> | 
                <a href="classification.php" class="navbar">Classification</a> | 
                <a href="#" class="navbar"><b>Evaluation</b></a>
            </div>
        </header>

        <main>
            <div class="main title">
                <h3>Evaluation Result</h3>
            </div>

            <div class="main result">
                <table class='table'>
                    <thead>
                        <tr>
                            <td>TITLE</td>
                            <td>ORIGINAL CATEGORY</td>
                            <td>SYSTEM CLASSIFICATION</td>
                            <td>RESULT</td>
                        </tr>
                    </thead>

                    <tbody>
                        
                    </tbody>
                </table>
            </div>

            <div class="main title">
                <h3>Accuracy</h3>
            </div>

            <div class="main">
                <script type="text/javascript">
                    google.charts.load("current", {packages:["corechart"]});
                    google.charts.setOnLoadCallback(drawChart);
                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Type', 'Percentage'],
                            ['Correct Classification', 75],
                            ['Wrong Classification', 25]
                        ]);

                        var options = {
                            title: 'My Daily Activities',
                            pieHole: 0.6,
                        };

                        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                        chart.draw(data, options);
                    }
                </script>
                <div id="donutchart" style=""></div>
            </div>
        </main>
    </body>
</html>