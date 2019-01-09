<?php
namespace raiz;
class Teams{
    function __construct( ){
      require_once 'vendor/autoload.php'; // Autoload files using Composer autoload
      require_once("include/globais.php");
      $this->Globais = new Globais();
      $this->con = new \babirondo\classbd\db();
      $this->con->conecta( $this->Globais->banco ,
                            $this->Globais->localhost,
                            $this->Globais->db,
                            $this->Globais->username,
                            $this->Globais->password,
                            $this->Globais->port);
    $this->API = new \babirondo\REST\RESTCall();
    }
    function getTimes(  $request, $response, $args , $jsonRAW){
        if (!$this->con->conectado){
            $data =   array(	"resultado" =>  "ERRO",
                "erro" => "nao conectado - ".$this->con->erro );
            return $response->withStatus(500)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
        $filtros = null;
//        var_dump($args );
        if ($jsonRAW["idtimes"]) $filtros[] = " id IN (".$jsonRAW["idtimes"].")";
        if ($jsonRAW["idtime"]) $filtros[] = " id = ".$jsonRAW["idtime"]."";
        if ($args["pesquisa"]) $filtros[] = " time ilike '%".$args["pesquisa"]."%'";
        if ($jsonRAW["time"]) $filtros[] = " time ilike '%".$jsonRAW["time"]."%'";
        if ($jsonRAW["localtreino"]) $filtros[] = " localtreino ilike '%".$jsonRAW["localtreino"]."%'";
        if ($jsonRAW["nivelcompeticao"]) $filtros[] = " nivelcompeticao ilike '%".$jsonRAW["nivelcompeticao"]."%'";
        if ($jsonRAW["treino"]["Segunda"]) $filtros[] = " treino_segunda ilike '%".$jsonRAW["treino"]["Segunda"]."%'";
        if ($jsonRAW["treino"]["Terca"]) $filtros[] = " treino_terca ilike '%".$jsonRAW["treino"]["Terca"]."%'";
        if ($jsonRAW["treino"]["Quarta"]) $filtros[] = " treino_quarta ilike '%".$jsonRAW["treino"]["Quarta"]."%'";
        if ($jsonRAW["treino"]["Quinta"]) $filtros[] = " treino_quinta ilike '%".$jsonRAW["treino"]["Quinta"]."%'";
        if ($jsonRAW["treino"]["Sexta"]) $filtros[] = " treino_sexta ilike '%".$jsonRAW["treino"]["Sexta"]."%'";
        if ($jsonRAW["treino"]["Sabado"]) $filtros[] = " treino_sabado ilike '%".$jsonRAW["treino"]["Sabado"]."%'";
        if ($jsonRAW["treino"]["Domingo"]) $filtros[] = " treino_domingo ilike '%".$jsonRAW["treino"]["Domingo"]."%'";
        if ($jsonRAW["procurando"]["Snake"]) $filtros[] = " procurando_snake ilike '%".$jsonRAW["procurando"]["Snake"]."%'";
        if ($jsonRAW["procurando"]["SnakeCorner"]) $filtros[] = " procurando_snakecorner ilike '%".$jsonRAW["procurando"]["SnakeCorner"]."%'";
        if ($jsonRAW["procurando"]["BackCenter"]) $filtros[] = " procurando_backcenter ilike '%".$jsonRAW["procurando"]["BackCenter"]."%'";
        if ($jsonRAW["procurando"]["Doritos"]) $filtros[] = " procurando_doritos ilike '%".$jsonRAW["procurando"]["Doritos"]."%'";
        if ($jsonRAW["procurando"]["DoritosCorner"]) $filtros[] = " procurando_doritoscorner ilike '%".$jsonRAW["procurando"]["DoritosCorner"]."%'";
        if ($jsonRAW["procurando"]["Coach"]) $filtros[] = " procurando_coach ilike '%".$jsonRAW["procurando"]["Coach"]."%'";

        $sql = "SELECT * FROM times ".((is_array($filtros))?" WHERE ".implode( " or ",$filtros) :""). " ORDER By status_imagem_profile DESC" ;
        $this->con->executa($sql);

        if ( $this->con->nrw > 0 ){
            $contador = 0;
            $data_inicio =   array(	"resultado" =>  "SUCESSO" );
            while ($this->con->navega(0)){
                $contador++;
                $data=null;
                $data["nome"]  = $this->con->dados["time"];
                $data["id"]  = $this->con->dados["id"];
                $data["idowner"]  = $this->con->dados["idowner"];
                $data["localtreino"]  = $this->con->dados["localtreino"];
                $data["logo"]  = $this->con->dados["status_imagem_profile"];
                $data["nivelcompeticao"]  = $this->con->dados["nivelcompeticao"];
                $data["treino_segunda"]  = $this->con->dados["treino_segunda"];
                $data["treino_terca"]  = $this->con->dados["treino_terca"];
                $data["treino_quarta"]  = $this->con->dados["treino_quarta"];
                $data["treino_quinta"]  = $this->con->dados["treino_quinta"];
                $data["treino_sexta"]  = $this->con->dados["treino_sexta"];
                $data["treino_sabado"]  = $this->con->dados["treino_sabado"];
                $data["treino_domingo"]  = $this->con->dados["treino_domingo"];
                $data["procurando_snake"]  = $this->con->dados["procurando_snake"];
                $data["procurando_snakecorner"]  = $this->con->dados["procurando_snakecorner"];
                $data["procurando_backcenter"]  = $this->con->dados["procurando_backcenter"];
                $data["procurando_doritos"]  = $this->con->dados["procurando_doritos"];
                $data["procurando_doritoscorner"]  = $this->con->dados["procurando_doritoscorner"];
                $data["procurando_coach"]  = $this->con->dados["procurando_coach"];
                $data["qtde_jogadores"]  = 4;
                $output["TIMES"][$this->con->dados["id"]] = $data;

                $times_encontrados[$this->con->dados["id"]] = $this->con->dados["id"];
            }

/*
            $query_API = array();

            $parameters['IDTIMES_ARRAY'] = $times_encontrados;
            $query_API = $this->API->CallAPI("POST",   $this->Globais->GetTeamsImages  , json_encode($parameters)); //,'SEMPRE'


            foreach ($query_API["hits"] as $imagem){
              $output["TIMES"][  $imagem["IDTIME"] ]["logotime"] = $imagem["imagem"];

            }
*/

            return $response->withJson(array_merge($data_inicio, $output), 200)->withHeader('Content-Type', 'application/json');
        }
        else {
            // nao encontrado
            $data =    array(	"resultado" =>  "ERRO",
                "erro" => "Nenhum time encontrado");
            return $response->withStatus(200)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
    }
    function getMyTeams(  $request, $response, $args ){
        if (!$this->con->conectado){
            $data =   array(	"resultado" =>  "ERRO",
                "erro" => "nao conectado - ".$this->con->erro );
            return $response->withStatus(203)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }

        $query_API = array();

        $parameters['id_jogador'] = $args['idusuario'];
        $query_API = $this->API->CallAPI("POST",   $this->Globais->ProcurarJogadores  , json_encode($parameters));//,'SEMPRE'
        //var_dump($query_API);

        if (is_array($query_API["TIMES"])){
            $comp = "OR id IN (".implode(",",$query_API["TIMES"]).")";
        }

        $sql = "SELECT * FROM times  WHERE (idowner = '".$args['idusuario']."' $comp ) ";
      //  $data["debug"] =  $sql;
        $this->con->executa($sql);

        if ( $this->con->nrw > 0 ){
            $contador = 0;
            $data[	"resultado" ] =  "SUCESSO" ;
            while ($this->con->navega(0)){
                $contador++;
                $data["TIMES"][$this->con->dados["id"]]["time"] = $this->con->dados["time"];
                $data["TIMES"][$this->con->dados["id"]]["owner"] = $this->con->dados["idowner"];
                $data["TIMES"][$this->con->dados["id"]]["logo"] = $this->con->dados["status_imagem_profile"];

                $times_encontrados[] = $this->con->dados["id"];
            }
/*
            $query_API = array();

            $parameters['IDTIMES_ARRAY'] = $times_encontrados;
            $query_API = $this->API->CallAPI("POST",   $this->Globais->GetTeamsImages  , json_encode($parameters)); //,'SEMPRE'

            if (is_array($query_API["hits"])){
              foreach ($query_API["hits"] as $imagem){
                $data["TIMES"][  $imagem["IDTIME"] ]["logo"] = $imagem["imagem"];

              }

            }
*/
            return $response->withJson($data, 200)->withHeader('Content-Type', 'application/json');
        }
        else {
            // nao encontrado
            $data =    array(	"resultado" =>  "ERRO",
                "erro" => "Nao foi possivel encontrar nenhum time deste jogador ");
            return $response->withStatus(200)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
    }
    function Adicionar_time(  $request, $response, $args,   $jsonRAW){
        if (!$this->con->conectado){
            $data =   array(	"resultado" =>  "ERRO",
                "erro" => "nao conectado - ".$this->con->erro );
            return $response->withStatus(203)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
        IF (!is_array ($jsonRAW)  ) {
            $data =  array(	"resultado" =>  "ERRO",
                "erro" => "JSON zuado - ".var_export($jsonRAW, true) );
            return $response->withStatus(203)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
        //todo: checar se o campo inicio e fim eh date
        if ( strlen(trim($jsonRAW["time"])) < 1 ){
            $data =  array(	"resultado" =>  "ERRO",
                "erro" => "Time Invalido - ". ($jsonRAW["time"] ) );
            return $response->withStatus(203)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }

        $sql = "INSERT INTO times (time , idowner, localtreino,
                                    nivelcompeticao, treino_segunda, treino_terca,
                                    treino_quarta, treino_quinta, treino_sexta,
                                    treino_sabado, treino_domingo, procurando_snake,
                                    procurando_snakecorner, procurando_backcenter, procurando_doritoscorner,
                                    procurando_doritos , procurando_coach, status_imagem_profile
                                    )
                VALUES(
                                '".$jsonRAW["time"]."', ".(($args["idusuario"])?$args["idusuario"]:"null").",'".$jsonRAW["localtreino"]."',
                                '".$jsonRAW["nivelcompeticao"]."',".(($jsonRAW["treino"]["Segunda"])? "'".$jsonRAW["treino"]["Segunda"]."'" :"null").",".(($jsonRAW["treino"]["Terca"])? "'".$jsonRAW["treino"]["Terca"] ."'":"null").",
                                ".(($jsonRAW["treino"]["Quarta"])? "'".$jsonRAW["treino"]["Quarta"]."'" :"null").",".(($jsonRAW["treino"]["Quinta"])? "'".$jsonRAW["treino"]["Quinta"]."'" :"null").",".(($jsonRAW["treino"]["Sexta"])? "'".$jsonRAW["treino"]["Sexta"]."'" :"null").",
                                ".(($jsonRAW["treino"]["Sabado"])? "'".$jsonRAW["treino"]["Sabado"]."'" :"null").",".(($jsonRAW["treino"]["Domingo"])? "'".$jsonRAW["treino"]["Domingo"]."'" :"null").",".(($jsonRAW["procurando"]["Snake"])? "'".$jsonRAW["procurando"]["Snake"]."'" :"null").",
                                ".(($jsonRAW["procurando"]["SnakeCorner"])? "'".$jsonRAW["procurando"]["SnakeCorner"]."'" :"null").",".(($jsonRAW["procurando"]["BackCenter"])? "'".$jsonRAW["procurando"]["BackCenter"]."'" :"null").",".(($jsonRAW["procurando"]["DoritosCorner"])? "'".$jsonRAW["procurando"]["DoritosCorner"]."'" :"null").",
                                ".(($jsonRAW["procurando"]["Doritos"])? "'".$jsonRAW["procurando"]["Doritos"]."'" :"null").",".(($jsonRAW["procurando"]["Coach"])? "'".$jsonRAW["procurando"]["Coach"]."'" :"null").", '".(($jsonRAW["fotoSalvar"])?"processing":"")."'
                 )
                RETURNING id";
        //  echo "<PRE>$sql</PRE>";
        $this->con->executa($sql, 1);
        if ( $this->con->res == 1 ){
            $data =   array(	"resultado" =>  "SUCESSO" );
            $data["idtime"] = $this->con->dados["id"];


            if ($jsonRAW["fotoSalvar"]){
                $trans=null;$trans = array(":idtime" => $data["idtime"]  );
                $salvar_imagem_payload["imagem"] = "data:".$jsonRAW["foto"]["type"].";base64,".$jsonRAW["fotoSalvar"];//"binario da foto";
                $salvar_imagem_payload["TipoImagem"] = "Profile";
                $query_API = $this->API->CallAPI("POST", strtr( $this->Globais->SaveTeamImage, $trans), json_encode($salvar_imagem_payload,1),'ERRO');
            }

            return $response->withJson($data, 200)->withHeader('Content-Type', 'application/json');
        }
        else {
            // nao encontrado
            $data =    array(	"resultado" =>  "ERRO",
                "erro" => "Nao foi possivel alterar os dados");
            return $response->withStatus(200)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
    }



    function Alterar_Time(  $request, $response, $args,   $jsonRAW){
        if (!$this->con->conectado){
            $data =   array(	"resultado" =>  "ERRO",
                "erro" => "nao conectado - ".$this->con->erro );
            return $response->withStatus(500)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
        IF (!is_array ($jsonRAW)  ) {
            $data =  array(	"resultado" =>  "ERRO",
                "erro" => "JSON zuado - ".var_export($jsonRAW, true) );
            return $response->withStatus(500)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
        /*
        if ( strlen(trim($jsonRAW["time"])) < 1 ){
            $data =  array(	"resultado" =>  "ERRO",
                "erro" => "Time Invalido - ".var_export($jsonRAW, true) );
            return $response->withStatus(500)
                ->withHeader('Content-type', 'application/json;charset=utf-8')
                ->withJson($data);
        }
        */

        //TODO: checar se o campo inicio e fim eh date
        if ($jsonRAW["fotoSalvar"]){
            $trans=null;$trans = array(":idtime" => $jsonRAW["idtime"]  );
            $salvar_imagem_payload["imagem"] = "data:".$jsonRAW["foto"]["type"].";base64,".$jsonRAW["fotoSalvar"];//"binario da foto";
            $salvar_imagem_payload["TipoImagem"] = "Profile";
            $query_API = $this->API->CallAPI("POST", strtr( $this->Globais->SaveTeamImage, $trans), json_encode($salvar_imagem_payload,1) );

            $update_foto = "processing";
        }
        else {
          $update_foto = null;
        }

        if ($jsonRAW["time"])
          $alterar_campos[] = "time = '".$jsonRAW["time"]."'";
        if ($jsonRAW["localtreino"])
          $alterar_campos[] = "localtreino = '".$jsonRAW["localtreino"]."'";
        if ($jsonRAW["nivelcompeticao"])
          $alterar_campos[] = "nivelcompeticao = '".$jsonRAW["nivelcompeticao"]."'";

        if ($jsonRAW["treino"]["Segunda"])
          $alterar_campos[] = "treino_segunda = '".$jsonRAW["treino"]["Segunda"]."'";
        if ($jsonRAW["treino"]["Terca"])
          $alterar_campos[] = "treino_terca = '".$jsonRAW["treino"]["Terca"]."'";
        if ($jsonRAW["treino"]["Quarta"])
          $alterar_campos[] = "treino_quarta = '".$jsonRAW["treino"]["Quarta"]."'";
        if ($jsonRAW["treino"]["Quinta"])
          $alterar_campos[] = "treino_quinta = '".$jsonRAW["treino"]["Quinta"]."'";
        if ($jsonRAW["treino"]["Sexta"])
          $alterar_campos[] = "treino_sexta = '".$jsonRAW["treino"]["Sexta"]."'";
        if ($jsonRAW["treino"]["Sabado"])
          $alterar_campos[] = "treino_sabado = '".$jsonRAW["treino"]["Sabado"]."'";
        if ($jsonRAW["treino"]["Domingo"])
          $alterar_campos[] = "treino_domingo = '".$jsonRAW["treino"]["Domingo"]."'";
        if ($jsonRAW["procurando"]["Snake"])
          $alterar_campos[] = "procurando_snake = '".$jsonRAW["procurando"]["Snake"]."'";
        if ($jsonRAW["procurando"]["SnakeCorner"])
          $alterar_campos[] = "procurando_snakecorner = '".$jsonRAW["procurando"]["SnakeCorner"]."'";
        if ($jsonRAW["procurando"]["BackCenter"])
          $alterar_campos[] = "procurando_backcenter = '".$jsonRAW["procurando"]["BackCenter"]."'";
        if ($jsonRAW["procurando"]["Doritos"])
          $alterar_campos[] = "procurando_doritos = '".$jsonRAW["procurando"]["Doritos"]."'";
        if ($jsonRAW["procurando"]["DoritosCorner"])
          $alterar_campos[] = "procurando_doritoscorner = '".$jsonRAW["procurando"]["DoritosCorner"]."'";
        if ($jsonRAW["procurando"]["Coach"])
          $alterar_campos[] = "procurando_coach = '".$jsonRAW["procurando"]["Coach"]."'";
        if ($jsonRAW["statusProfileImage"] )
          $alterar_campos[] = "status_imagem_profile = '".$jsonRAW["statusProfileImage"] ."'";
        if ( $update_foto )
          $alterar_campos[] = "status_imagem_profile = '".$update_foto ."'";

          if (is_array($alterar_campos)){
            $sql = "UPDATE times SET ".implode(",",$alterar_campos)." WHERE id = ".$jsonRAW["idtime"];
            //echo $sql;exit;
            $this->con->executa($sql, 1);

            if ( $this->con->res == 1 ){
                $data =   array(	"resultado" =>  "SUCESSO" );
                return $response->withJson($data, 200)->withHeader('Content-Type', 'application/json');
            }
            else {
                // nao encontrado
                $data =    array(	"resultado" =>  "ERRO",
                    "erro" => "Nao foi possivel alterar os dados");
                return $response->withStatus(200)
                    ->withHeader('Content-type', 'application/json;charset=utf-8')
                    ->withJson($data);
            }
          }
          else {
              // nao encontrado
              $data =    array(	"resultado" =>  "ERRO",
                  "erro" => "Nothing to update");
              return $response->withStatus(200)
                  ->withHeader('Content-type', 'application/json;charset=utf-8')
                  ->withJson($data);
          }


    }
}
