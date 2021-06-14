<?php
    use Phpml\FeatureExtraction\TokenCountVectorizer;
    use Phpml\Tokenization\WhitespaceTokenizer;
    use Phpml\FeatureExtraction\TfIdfTransformer;
    use Phpml\Math\Distance\Minkowski;
?>

<!DOCTYPE html>
<html>
<head>
	<title>God E | Home</title>
    <link rel="stylesheet" href="main.css">
	<style type="text/css">
		body {
			background-color: #3C3F58;
		}

		main {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			text-align: center;
			min-height: 30vh;
		}

		p {
			margin: 0;
		}

		h1 {
			text-align: center;
			color: #3BBA9C;
			font-size: 50px;
		}

		span {
			font-size: 25px;
			color: #3BBA9C; 
		}

		.navbar {
			text-decoration: none;
			color: #3BBA9C; 
		}

		.keyword {
			margin-top: 5%;
		}

		#keyword {
			color: #3BBA9C;
			font-size: 20px;
		}

		.result {
			width: 75%;
			margin: auto;
			color: #3BBA9C;
			font-size: 20px;
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
	</style>
</head>
<body>
	<main>
		<p>
			<h1>Welcome To God Eye</h1>
		</p>

		<p>
			<span><a href="#" class="navbar"><b>Home</b></a> | 
			<a href="crawl.php" class="navbar">Crawling</a> | 
			<a href="classification.php" class="navbar">Classification</a> | 
			<a href="evaluation.php" class="navbar">Evaluation</a>
		</p>

		<div class="main keyword">
            <form action="" method="post">
                <label id="keyword">Keyword :</label> 
                <input type="text" name="keyword">
                <button type="submit" name="submit">Find</button>
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
                            require_once __DIR__ . '/vendor/autoload.php';
                            $mysqli = new mysqli("localhost", "root", "", "db_godeye");
                            
                            $training_data = array();
                            $data_title = array();
                            $keyword = "%".$_POST['keyword']."%";

                            $sql = "SELECT * FROM training_data WHERE title LIKE ?";
                            $stmt = $mysqli->prepare($sql);
                            $stmt->bind_param("s", $keyword);
                            $stmt->execute();
                            $res = $stmt->get_result();

                            while($row = $res->fetch_assoc()) {
                                array_push($data_title, $row['title']);
                                $temp = array("title" => $row['title'], "date" => $row['date'], "category" => $row['category'], "portal" => $row['portal']);
                                $training_data[] = $temp;
                            }

                            // Similarity
                            $tf = new TokenCountVectorizer(new WhitespaceTokenizer());
                            $tf->fit($data_title);
                            $tf->transform($data_title);
                            $tfidf = new TfIdfTransformer($data_title);
                            $tfidf->transform($data_title);

                            $terms_amount = count($tf->getVocabulary());
                            $data_title_amount = count($data_title) - 1;
                            
                            $minkowski = new Minkowski($terms_amount - 1);
                            for ($i = 0; $i <= $data_title_amount; $i++) {
                                $training_data[$i]['similarity'] = $minkowski->distance($data_title[$i], $data_title[$data_title_amount]);
                            }

                            $similarity_list = array_column($training_data, 'similarity');
                            array_multisort($similarity_list, SORT_DESC, $training_data);
                            // $i = 0;
                            foreach ($training_data as $value) {
                                echo "<tr>";
                                    echo "<td>".$value['title']."</td>";
                                    echo "<td>".$value['date']."</td>";
                                    echo "<td>".$value['category']."</td>";
                                    echo "<td>".$value['portal']."</td>";
                                echo "</tr>";
                                // $i++;
                                // if ($i >= 3) {
                                //     break;
                                // }
                            }

                            // Query Expansion
                        }
                    ?>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>