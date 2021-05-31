<?php 
	use Phpml\FeatureExtraction\TokenCountVectorizer;
	use Phpml\Tokenization\WhitespaceTokenizer;
	use Phpml\FeatureExtraction\TfIdfTransformer;
	use Phpml\Classification\KNearestNeighbors;
?>

<!DOCTYPE html>
<html>
<head>
	<title>God Eye | Classification</title>
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

		.keyword {
			margin-top: 10px;
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

		select, option {
			margin-bottom: 10px;
			height: 30px;
			width: 300px;
			border: 1px solid #3BBA9C;
			font-size: 15px;
			outline: none;
			color: #3C3F58;
			padding: 5px 10px;
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
			<a href="crawl.php" class="navbar">Crawling</a> | 
			<a href="#" class="navbar"><b>Classification</b></a> | 
			<a href="evaluation.php" class="navbar">Evaluation</a>
		</div>
	</header>

	<main>
		<div class="main title">
			<h3>Classification Data From Indozone and IDN Times</h3>
		</div>
		
		<form method="post" action="">
			<div class="main cbnews">
				<select name="newsportal">
					<option value="">-- Choose News Portal --</option>
					<option value="idz">Indozone</option>
					<option value="idn">IDN Times</option>
				</select>
			</div>

			<div class="main keyword">
				Keyword : 
				<input type="text" name="keyword">
				<button type="submit"name="submit">Find</button>
			</div>
		</form>

		<div class="main result">
			<table class='table'>
				<thead>
					<tr>
						<td>TITLE</td>
						<td>DATE</td>
						<td>ORIGINAL CATEGORY</td>
						<td>SYSTEM CLASSIFICATION</td>
					</tr>
				</thead>

				<tbody>
					<?php
						if (isset($_POST['submit'])) {
							if ($_POST['newsportal'] == "") {
								echo "<br>Please Choose News Portal!!";
							} else if ($_POST['keyword'] == "") {
								echo "<br>Please Input Keyword!!";
							}  else {
								require_once __DIR__ . '/vendor/autoload.php';
								include_once('simple_html_dom.php');

								$mysqli = new mysqli("localhost", "root", "", "db_godeye");
								
								$keyword = $_POST['keyword'];
								$news_portal = $_POST['newsportal'];
								$arr_crawling_result = array();

								if($news_portal == "idz") {
									$html_1 = file_get_html("https://www.indozone.id/search?q=".$keyword."&s=true");

									$counter = 1;
									foreach($html_1 -> find("li[data-content]") as $berita){
										$newsTitle = $berita -> find('h3 a', 0) -> innertext;
										$newsDate = explode(" ", $berita -> find('div[class="info"]', 0) -> innertext);
										$newsDate = $newsDate[26]." ".$newsDate[27]." ".$newsDate[28];
										$newsCategory = $berita -> find('div.category a', 0) -> innertext;
										$newsPortal = "Indozone";

										$temp = array("title" => $newsTitle, "date" => $newsDate, "category" => $newsCategory, "classification" => "");
										$arr_crawling_result[] = $temp;

										$counter++;
										if ($counter > 3) { break; }
									}
								} else {
									$html_2 = file_get_html("https://www.idntimes.com/search?keyword=".$keyword."&type=all&page=1");

									$counter = 1;
									foreach($html_2 -> find("li.box-latest") as $berita){
										$newsTitle = $berita -> find('h2.title-text', 0) -> innertext;
										$newsDate = $berita -> find('div.date-cat time.date', 0) -> innertext;
										$newsCategory = $berita -> find('span.category', 0) -> innertext;
										$newsPortal = "IDN Times";

										$temp = array("title" => $newsTitle, "date" => $newsDate, "category" => $newsCategory, "classification" => "");
										$arr_crawling_result[] = $temp;
										
										$counter++;
										if ($counter > 3) { break; }
									}
								}

								// KNN Process Here
								$counters = 0;
								foreach($arr_crawling_result as $key => $value) {
									$sql = "SELECT * FROM training_data";
									$res = $mysqli->query($sql);

									$sample_data_title = array();
									$sample_data_category = array();

									while($row = $res->fetch_assoc()) {
										array_push($sample_data_title, $row['title']);
										array_push($sample_data_category, $row['category']);
									}

									$count_data = count($sample_data_category)/2;
									array_push($sample_data_title, $value['title']);

									echo "<tr>";
										echo "<td>".$value['title']."</td>";
										echo "<td>".$value['date']."</td>";
										echo "<td>".$value['category']."</td>";

									$tf = new TokenCountVectorizer(new WhitespaceTokenizer());
									$tf->fit($sample_data_title);
									$tf->transform($sample_data_title);
									$tfidf = new TfIdfTransformer($sample_data_title);
									$tfidf->transform($sample_data_title);
									
									foreach($sample_data_title[(count($sample_data_title) - 1)] as $key => $value) {
										$new_data[] = $value;
									}
									array_pop($sample_data_title);

									// Do KNN Classification Method
									$classifier = new KNearestNeighbors($count_data);
									$classifier->train($sample_data_title, $sample_data_category);
									$result = $classifier->predict($new_data);

									$new_data = [];
									$arr_crawling_result[$counters]["classification"] = $result;

										echo "<td>".$result."</td>";
									echo "</tr>";

									$counters++;
								}

								$sql = "SELECT max(queue) AS 'max' FROM testing_data";
								$res = $mysqli->query($sql);
								$row = $res-> fetch_assoc();

								$data = 0;

								if ($row['max'] == null) {
									$data = 1;
								} else {
									$data = $row['max'] + 1;
								}

								// Query Insert
								foreach($arr_crawling_result as $key => $value) {
									$sql = "INSERT INTO testing_data (title, date, original_category, system_classification, queue) VALUES (?,?,?,?,?)";
									$stmt = $mysqli->prepare($sql);
									$stmt->bind_param("ssssi", $value['title'], $value['date'], $value['category'], $value['classification'], $data);
									$stmt->execute();
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