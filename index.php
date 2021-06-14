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
                            
                            foreach ($training_data as $value) {
                                echo "<tr>";
                                    echo "<td>".$value['title']."</td>";
                                    echo "<td>".$value['date']."</td>";
                                    echo "<td>".$value['category']."</td>";
                                    echo "<td>".$value['portal']."</td>";
                                echo "</tr>";
                            }

                            if (count($training_data) > 0) {
                                // Query Expansion
                                $expansion_data = array();
                                $tfidf_score_accumulation = array();
                                $top_amount = 0;

                                if ($top_amount < 3) {
                                    $top_amount = count($training_data);
                                } else {
                                    $top_amount = 3;
                                }
                                

                                for($i = 0; $i < $top_amount; $i++) {
                                    $expansion_data[] = $training_data[$i]['title'];
                                }

                                $tf = new TokenCountVectorizer(new WhitespaceTokenizer());
                                $tf->fit($expansion_data);
                                $tf->transform($expansion_data);
                                $tfidf = new TfIdfTransformer($expansion_data);
                                $tfidf->transform($expansion_data);
                                $term_list = $tf->getVocabulary();

                                for($i = 0; $i < count($term_list); $i++) {
                                    $tfidf_score_accumulation[$i] = 0;
                                }

                                for($i = 0; $i < count($expansion_data); $i++) {
                                    for($j = 0; $j < count($term_list); $j++) {
                                        $tfidf_score_accumulation[$j] += $expansion_data[$i][$j];
                                    }
                                }

                                arsort($tfidf_score_accumulation);
                                $highest_index = array_keys($tfidf_score_accumulation, max($tfidf_score_accumulation));
                                $query_expasion_keyword = $term_list[$highest_index[0]];

                                echo $_POST['keyword']." ".$query_expasion_keyword;
                            }
                        }
                    ?>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>