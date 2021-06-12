<!DOCTYPE html>
<html>
<head>
	<title>God Eye | Crawling</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="main.css">
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

		input {
			height: 20px;
			width: 400px;
			border: 1px solid #3BBA9C;
			border-radius: 10px;
			font-size: 18px;
			padding: 7px 10px;
			outline: none;
			color: #3C3F58;
		}

		button {
			margin-left: 5px;
			width: 100px;
			height: 25px;
			border-radius: 5px;
			outline: none;
			border: 1px solid #3BBA9C;
			background-color: #3C3F58;
			color: #3BBA9C;
			font-size: 15px;
		}

		button:hover {
			background-color: #3BBA9C;
			color: #3C3F58;
			cursor: pointer;
			border: 1px solid white;
		}

		p {
			margin: 0;
			font-size: 15px;
			font-weight: bold;
		}

		.result {
			width: 75%;
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
	</style>
</head>
<body>
	<header>
		<div id="nav">
			<a href="index.php" class="navbar">Home</a> | 
			<a href="#" class="navbar"><b>Crawling</b></a> | 
			<a href="classification.php" class="navbar">Classification</a> | 
			<a href="evaluation.php" class="navbar">Evaluation</a>
		</div>
	</header>

	<main>
		<div class="main title">
			<h3>Crawling Data</h3>
		</div>

		<div class="main keyword">
			<form method="post" action="">
				Keyword : 
				<input type="text" name="keyword">
				<button type="submit"name="submit">Find</button>

				<p>
					Source : Indozone and IDN Times
				</p>
			</form>
		</div>

		<div class="main result">
			<table class='table'>
				<thead>
					<tr>
						<td>TITLE</td>
						<td>DATE</td>
						<td>CATEGORY</td>
						<td>NEWS PORTAL</td>
					</tr>
				</thead>

				<tbody>
					<?php
						if (isset($_POST['submit'])) {
							if ($_POST['keyword'] == "") {
								echo "<br>Please Input Keyword!!";
							} else {
								$mysqli = new mysqli("localhost", "root", "", "db_godeye");
								include_once('simple_html_dom.php');
								
								$keyword = $_POST['keyword'];

								$html_1 = file_get_html("https://www.indozone.id/search?q=".$keyword."&s=true");
								$html_2 = file_get_html("https://www.idntimes.com/search?keyword=".$keyword."&type=all&page=1");

								// Indozone
								$counter = 1;
								foreach($html_1 -> find("li[data-content]") as $berita){
									$newsTitle = $berita -> find('h3 a', 0) -> innertext;
									$newsDate = explode(" ", $berita -> find('div[class="info"]', 0) -> innertext);
									$newsDate = $newsDate[26]." ".$newsDate[27]." ".$newsDate[28];
									$newsCategory = $berita -> find('div.category a', 0) -> innertext;
									$newsPortal = "Indozone";

									echo "<tr>";
										echo "<td>".$newsTitle."</td>";
										echo "<td>".$newsDate."</td>";
										echo "<td>".$newsCategory."</td>";
										echo "<td>".$newsPortal."</td>";
									echo "</tr>";

									// $sql = "INSERT INTO training_data (title, date, category, portal) VALUES (?,?,?,?)";
									// $stmt = $mysqli->prepare($sql);
									// $stmt->bind_param("ssss", $newsTitle, $newsDate, $newsCategory, $newsPortal);
									// $stmt->execute();

									$counter++;
									if ($counter > 8) { break; }
								}

								// IdnTimes
								$counter = 1;
								foreach($html_2 -> find("li.box-latest") as $berita){
									$newsTitle = $berita -> find('h2.title-text', 0) -> innertext;
									$newsDate = $berita -> find('div.date-cat time.date', 0) -> innertext;
									$newsCategory = $berita -> find('span.category', 0) -> innertext;
									$newsPortal = "IDN Times";

									echo "<tr>";
										echo "<td>".$newsTitle."</td>";
										echo "<td>".$newsDate."</td>";
										echo "<td>".$newsCategory."</td>";
										echo "<td>".$newsPortal."</td>";
									echo "</tr>";

									// $sql = "INSERT INTO training_data (title, date, category, portal) VALUES (?,?,?,?)";
									// $stmt = $mysqli->prepare($sql);
									// $stmt->bind_param("ssss", $newsTitle, $newsDate, $newsCategory, $newsPortal);
									// $stmt->execute();

									$counter++;
									if ($counter > 8) { break; }
								}
							}
						}
					?>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>