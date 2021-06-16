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
			margin-top: 3%;
			width: 100%;
            margin-bottom: 3%;
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

        .new-keyword {
            width: auto;
            height: auto;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            background: #3BBA9C;
            color: white;
            text-shadow: 1px 1px black;
            margin: 0.5%;
            border: 0;
            outline: 0;
            cursor: pointer;
            transition: 0.3s;
        }

        .new-keyword:hover {
            background: #1EA688;
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
                        if (isset($_POST['keyword'])) {
                            require_once __DIR__ . '/vendor/autoload.php';
                            $mysqli = new mysqli("localhost", "root", "", "db_godeye");
                            $training_data = array();
                            $data_title = array();
                            $keyword = "%".$_POST['keyword']."%";
                            echo "<br>Result for: ".$_POST['keyword']."<br><br>";

                            // Menyiapkan SQL untuk mengambil data dari database
                            $sql = "SELECT * FROM training_data WHERE title LIKE ?";
                            $stmt = $mysqli->prepare($sql);
                            $stmt->bind_param("s", $keyword);
                            $stmt->execute();
                            $res = $stmt->get_result();

                            // Mendapatkan data dari hasil query database
                            while($row = $res->fetch_assoc()) {
                                array_push($data_title, $row['title']);
                                $temp = array("title" => $row['title'], "date" => $row['date'], "category" => $row['category'], "portal" => $row['portal']);
                                $training_data[] = $temp;
                            }

                            // TF IDF Process
                            $tf = new TokenCountVectorizer(new WhitespaceTokenizer());
                            $tf->fit($data_title);
                            $tf->transform($data_title);
                            $tfidf = new TfIdfTransformer($data_title);
                            $tfidf->transform($data_title);

                            // Mendapatkan jumlah terms untuk dilakukannya kalkulasi Minkowski Similarity dan mendapatkan jumlah dari isi array data_title setelah tfidf
                            $terms_amount = count($tf->getVocabulary());
                            $data_title_amount = count($data_title) - 1;
                            
                            // Lakukan Minkowski Similarity
                            $minkowski = new Minkowski($terms_amount - 1);
                            for ($i = 0; $i <= $data_title_amount; $i++) {
                                $training_data[$i]['similarity'] = $minkowski->distance($data_title[$i], $data_title[$data_title_amount]);
                            }

                            // Mengurutkan hasil yang dicari berdasarkan similarity terbesar
                            $similarity_list = array_column($training_data, 'similarity');
                            array_multisort($similarity_list, SORT_DESC, $training_data);

                            // Jika tidak ada data yang ditemukan, tidak perlu melakukan query expansion
                            if (count($training_data) > 0) {
                                $expansion_data = array();
                                $tfidf_score_accumulation = array();
                                $top_k_retrieved = 0;

                                // Menentukan Nilai Top K Retrieved
                                if ($top_k_retrieved < 3) {
                                    $top_k_retrieved = count($training_data);
                                } else {
                                    $top_k_retrieved = 3;
                                }
                                
                                // Mengisi array expansion_data dengan 3 title teratas
                                for($i = 0; $i < $top_k_retrieved; $i++) {
                                    $expansion_data[] = $training_data[$i]['title'];
                                }

                                // TF IDF
                                $tf = new TokenCountVectorizer(new WhitespaceTokenizer());
                                $tf->fit($expansion_data);
                                $tf->transform($expansion_data);
                                $tfidf = new TfIdfTransformer($expansion_data);
                                $tfidf->transform($expansion_data);
                                $term_list = $tf->getVocabulary();

                                // Deklarasi bahwa isi array 1D ini dengan 0 sebanyak jumlah term yang tersedia
                                for($i = 0; $i < count($term_list); $i++) {
                                    $tfidf_score_accumulation[$i] = 0;
                                }

                                // Lakukan akumulasi weight tiap terms nya
                                for($i = 0; $i < count($expansion_data); $i++) {
                                    for($j = 0; $j < count($term_list); $j++) {
                                        $tfidf_score_accumulation[$j] += $expansion_data[$i][$j];
                                    }
                                }

                                // Lakukan pengurutan
                                arsort($tfidf_score_accumulation);

                                $get_max_based_index = 0;
                                foreach ($tfidf_score_accumulation as $key => $value) {
                                    // Memastikan query expansion tidak sama dengan yang di search user
                                    if (strtolower($_POST['keyword']) != strtolower($term_list[$key])) {
                                        $query_expansion[] = $term_list[$key];
                                        break;
                                    }
                                }

                                // Menampilkan keyword tambahan berdasarkan query expansion
                                echo "<form action='' method='post'>";
                                echo "Related keywords: ";
                                $explode_keyword = explode(" ", $_POST['keyword']);
                                for($i = 0; $i <= count($explode_keyword); $i++) {
                                    $temp = $explode_keyword;
                                    array_splice($temp, $i, 0, $query_expansion);
                                    $new_keyword = implode(" ", $temp);
                                    echo "<input type='submit' name='keyword' class='new-keyword' value='".$new_keyword."'>";
                                }
                                echo "</form>";

                                // Menampilkan hasil pada tabel secara terurut
                                foreach ($training_data as $value) {
                                    echo "<tr>";
                                        echo "<td>".$value['title']."</td>";
                                        echo "<td>".$value['date']."</td>";
                                        echo "<td>".$value['category']."</td>";
                                        echo "<td>".$value['portal']."</td>";
                                    echo "</tr>";
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