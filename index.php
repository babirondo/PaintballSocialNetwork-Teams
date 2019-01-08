<?php
namespace raiz;
//error_reporting(E_ALL ^ E_DEPRECATED);
header('Access-Control-Allow-Origin: *');
//ggggggggggggg
use Slim\Views\PhpRenderer;

include "vendor/autoload.php";


$app = new \Slim\App(['settings' => ['displayErrorDetails' => true]]);

$container = $app->getContainer();
$container['renderer'] = new PhpRenderer("./templates");




$app->post('/Team/ImageProcessed', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->Alterar_Time($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );



$app->get('/healthcheck/', function ($request, $response, $args)  use ($app )   {
    require_once("healthcheck/healthcheck.php");

    $HealthCheck = new HealthCheck();

    $retorno = $HealthCheck->check($response, $request->getParsedBody() );
    return $retorno;
}  );


$app->get('/{idusuario}/MySquads/', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->getMyTeams($request, $response, $args  );

    return $retorno;

}  );

$app->post('/{idusuario}/Teams/', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->Adicionar_time($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );
$app->put('/{idusuario}/Teams/', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->Alterar_Time($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );


$app->post('/Teams', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->Adicionar_time($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );



// BUSCAR DADOS DE UM TIME, POR GET, ROTA OU POST
$app->get('/Teams/{pesquisa}', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->getTimes($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );
$app->get('/Teams', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->getTimes($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );

$app->post('/SearchTeams/', function ($request, $response, $args)  use ($app )   {
    require_once("include/class_Teams.php");

    $cTeam = new Teams();
    $retorno = $cTeam->getTimes($request, $response, $args, $request->getParsedBody() );

    return $retorno;
}  );



$app->run();
