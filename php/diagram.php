<?php include 'config.php';
require_once '../jpgraph/src/jpgraph.php';
require_once '../jpgraph/src/jpgraph_pie.php';
error_reporting( E_ALL );
ini_set( 'display_errors', 1 );
$sql = "SELECT recipe.recipe_name AS 'recipe', COUNT(user_recipe.user_id) AS 'count' FROM recipe JOIN user_recipe ON recipe.recipe_id = user_recipe.recipe_id GROUP BY user_recipe.recipe_id";
$query = $con->query($sql);
$arr = [];
while($r = $query->fetch_array()) {
    $arr[$r['recipe']] = $r['count'];
}
$data = array_values($arr);
$lbl = array_keys($arr);

$graph = new PieGraph(750,750);
$graph->title->Set("Выбор пользователей");
$graph->legend->SetFillColor('#ffffff');
$p1 = new PiePlot($data);
$p1->SetSize(0.35);
$p1->SetLegends($lbl);
$p1->SetCenter(0.4);
$p1->SetLabelPos(0.6);
$p1->SetLabelType (PIE_VALUE_ADJPERCENTAGE);

$graph->Add($p1);
$graph->SetMargin(1,1,40,1);
$graph->SetMarginColor('#ffffff');
$graph->SetShadow(false);

$p1->ShowBorder();
$p1->SetColor('black');
$p1->SetSliceColors(array('#fbc605','#e66327','#ba69b9','#11a4cd','#91be1c', '#009687'));
$graph->Stroke();
?>