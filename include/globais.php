<?php
namespace raiz;

error_reporting(E_ALL ^ E_DEPRECATED ^E_NOTICE);
class Globais{

    public $env;
    public $banco;

    function __construct( ){
        $this->env = "local";

        $servidor["UI"] = $servidor["frontend"] = "http://192.168.0.150:81";
        $servidor["autenticacao"] = "http://192.168.0.150:82";
        $servidor["players"] = "http://192.168.0.150:83";
        $servidor["campeonato"] = "http://192.168.0.150:81";
        $servidor["times"] = "http://192.168.0.150:86";

        $servidor["bancodados_campeonato"] = "192.168.0.150";
        $servidor["bancodados_players"] = "192.168.0.150";
        $servidor["bancodados_times"] = "192.168.0.150";
        $servidor["rabbitmq"] = "192.168.0.150";
        $servidor["images"] = "http://192.168.0.150:85";

        $this->verbose=1;

        switch($this->env){

            case("local");
                $this->banco = "Postgres";
                $this->localhost = $servidor["bancodados_times"];
                $this->username = "postgres";
                $this->password = "postgres";
                $this->db ="times";
            break;

        }

        // extraindo configuracoes adicionais do arquivo config.json
       	$configuracoes_externas = file_get_contents('include/config.json');
       	$config_parsed = json_decode($configuracoes_externas,true);
       	$this->config = $config_parsed;

        $this->ProcurarJogadores = $servidor["players"]."/PaintballSocialNetwork-Players/SearchPlayers/"; //UNIT TEST

        $this->healthcheck = $servidor["times"]."/PaintballSocialNetwork-Teams/healthcheck/"; //UNIT TEST
        $this->ProcurarTimes = $servidor["times"]."/PaintballSocialNetwork-Teams/SearchTeams/"; // UNIT TEST
        $this->CriarMeuTimeSalvar = $servidor["times"]."/PaintballSocialNetwork-Teams/:idjogadorlogado/Teams/";// UNIT TEST
        $this->MeusTimesRemoto = $servidor["times"]."/PaintballSocialNetwork-Teams/:idjogadorlogado/MySquads/"; //UNIT TEST
        $this->jogadores_por_times = $servidor["players"]."/PaintballSocialNetwork-Players/Teams/Players/";  // UNIT TEST

        $this->SaveTeamImage = $servidor["images"]."/PaintballSocialNetwork-Images/Teams/Analyze/Image/:idtime";
        $this->GetTeamsImages = $servidor["images"]."/PaintballSocialNetwork-Images/Teams/";


    }

}
