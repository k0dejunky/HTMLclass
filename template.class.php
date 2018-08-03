<?php
require_once 'classes/db.class.php';
require_once 'classes/profile.class.php';

//$DB = new db;
class template {
    protected $data = "", $heldVALUE = "", $gotValueParm = 0;
    public function element($element, $options){
        //if(isset($options)){
            if($options === NULL){
                if($element == "br"){return "</".$element.">";}
                elseif($element === "center" ){return $this->data = "<".$element ." >";}
            }else{
                if($element === "form" || $element === "div" || $element === "link" || $element === "head" || $element === "meta" || $element === "img"){return $this->data = "<".$element ." ".$this->loop($options).">";}
                elseif($element === "input"){$this->data = "<".$element." ".$this->loop($options);$this->data .= $this->endElement($element);return $this->data;}
                else{$this->data = "<".$element." ".$this->loop($options);}
                if($this->gotValueParm === 1){return $this->data .= ">".$this->heldVALUE.$this->endElement($element);}
                else{return $this->data .=$this->endElement($element);}
            }
        //}
    }
    public function endElement($element){
        if($element == "input"){return "/>";}
        else{return "</".$element.">";}
    }
    private function loop($options){
        $info = "";
        foreach ($options as $key => $value){
            if($key === "value"){
                $this->heldVALUE = $value;
                $this->gotValueParm = 1;}
            else{$info .= $key."='".$value."' ";}
        }
        return $info;
    }
    public function processRegistration($firstName, $lastName, $email, $password, $username){
        $DB->createProfile($profile);
        $profile = new profile($firstName, $lastName, $email, $password, $screenName);
        return $profile;
    }
    public function processLogin($username, $password){
        //echo "<h1>LOGIN YO</h1>";
        $DB = new db();
        $login = $DB->processLogin($username, $password);
        if ($login != 0){
            $_SESSION['loggedin'] = 1;
            header("location: index.php?page=home");
        }else{
            echo "<p>$login</p>";
            echo "<p>NO OUTPUT IF LINE ABOVE IS BLANK</p>";
            header("location: index.php?page=login&error=Log In Failed");
        }
    }
    public function drawLogin(){ 
        echo '<!DOCTYPE html>';
        echo $this->element("html", ["lang"=>"en"]);
        echo $this->element("head", NULL);
        echo $this->element("meta", ["charset"=>"utf-8"]);
        echo $this->element("meta", ["http-equiv"=>"X-UA-Compatible", "content"=>"IE=edge"]);
        echo $this->element("meta", ["name"=>"viewport", "content"=>"width=device-width, initial-scale=1"]);
        echo $this->element("link", ["rel"=>"icon", "href"=>"favicon.ico"]);
        echo $this->element("title",["value"=>"No Name Yet"]);
        //echo $this->endElement("title");
        echo $this->setupBootstrapStart();
        if(isset($_POST['username']) && (isset($_POST['password']))){
            require_once 'profile.class.php';
            $auth = $this->processlogin($_POST["username"], $_POST["password"]);
            $ext = new profile($_POST["firstName"], $_POST["lastName"], $_POST["email"], $_POST["password"], $_POST["username"]);
            $ext->sayCreated();
        }else{
            echo $this->element("div", ["id"=>"jumbo1", "class"=>"center"]);
            echo $this->element("center", NULL);
            echo $this->element("img", ["src"=>"images/communication_banner.jpg", "id"=>"bannerImage"]);
            echo $this->endElement("div");
            echo $this->element("center", NULL);
            echo $this->element("div", ["id"=>"register", "class"=>"jumbotron"]);
		echo $this->element("h1", ["value"=>"Login Below"]);
		echo $this->element("form", ["id"=>"form1","action"=>"index.php?page=processlogin", "method"=>"POST"]);
                if(isset($_GET['error'])){
                    $value = $_GET['error'];
                    echo $this->element("p", ["value"=>"$value"]);
                }
		echo $this->element("input", ["id"=>"username", "name"=>"username", "type"=>"text", "placeholder"=>"Username"]);
		echo $this->element("input", ["id"=>"password", "name"=>"password", "type"=>"password", "placeholder"=>"Password"]);
                //echo $this->element("input", ["id"=>"extensionNumber", "name"=>"extensionNumber", "type"=>"text", "placeholder"=>"Extension Number"]);
		echo $this->element("br", NULL);
                echo $this->element("br", NULL);
		echo $this->element("button", ["name"=>"submit","class"=>"btn btn-primary", "type"=>"submit", "value"=>"Log In"]);
		echo $this->endElement("form");
                echo $this->element("a", ["href"=>"index.php?page=register", "value"=>"register"]);
		echo $this->endElement("center");
            echo $this->endElement("div");
            echo $this->setupBootstrapEndDoc();
            echo $this->endElement("html");
        }        
    }
    private function setupBootstrapEndDoc(){
        echo '
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>window.jQuery || document.write(\'<script src="bs/js/vendor/jquery.min.js"><\/script>\')</script>
        <script src="bs/js/bootstrap.min.js"></script>
        <script src="js/feUtil.js"></script>';
        echo "</body>";
    }
    private function setupBootstrapStart(){
        echo '<!-- Bootstrap core CSS -->
            <link href="bs/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        </head>
        <body style="background-color: #d7dbdd;">';        
    }
    public function drawRegistration(){
        echo '<!DOCTYPE html>';
        echo $this->element("html", ["lang"=>"en"]);
        echo $this->element("head", NULL);
        echo $this->element("meta", ["charset"=>"utf-8"]);
        echo $this->element("meta", ["http-equiv"=>"X-UA-Compatible", "content"=>"IE=edge"]);
        echo $this->element("meta", ["name"=>"viewport", "content"=>"width=device-width, initial-scale=1"]);
        echo $this->element("link", ["rel"=>"icon", "href"=>"favicon.ico"]);
        echo $this->element("title",["value"=>"No Name Yet"]);
        //echo $this->endElement("title");
        echo $this->setupBootstrapStart();
        if(isset($_POST['firstName']) && (isset($_POST['lastName'])) && (isset($_POST['email'])) && (isset($_POST['password'])) && (isset($_POST['username']))){
            require_once 'profile.class.php';
            $auth = $this->processlogin($_POST["username"], $_POST["password"]);
            $ext = new profile($_POST["firstName"], $_POST["lastName"], $_POST["email"], $_POST["password"], $_POST["username"]);
            $ext->sayCreated();
        }else{
            echo $this->element("div", ["id"=>"jumbo1", "class"=>"center"]);
            echo $this->element("center", NULL);
            echo $this->element("img", ["src"=>"images/communication_banner.jpg", "id"=>"bannerImage"]);
            echo $this->endElement("div");
            echo $this->element("center", NULL);
            echo $this->element("div", ["id"=>"register", "class"=>"jumbotron"]);
		echo $this->element("h1", ["value"=>"Register Below"]);
		echo $this->element("form", ["id"=>"form1","action"=>"index.php?page=processRegistration", "method"=>"POST"]);
                echo $this->element("input", ["id"=>"firstName", "name"=>"firstName", "type"=>"text", "placeholder"=>"First Name"]);
                echo $this->element("input", ["id"=>"lastName", "name"=>"lastName", "type"=>"text", "placeholder"=>"Last Name"]);
		echo $this->element("input", ["id"=>"username", "name"=>"username", "type"=>"text", "placeholder"=>"username"]);
		echo $this->element("br", NULL);
                echo $this->element("input", ["id"=>"email", "name"=>"email", "type"=>"text", "placeholder"=>"email"]);
		echo $this->element("input", ["id"=>"password", "name"=>"password", "type"=>"password", "placeholder"=>"password"]);
                //echo $this->element("input", ["id"=>"extensionNumber", "name"=>"extensionNumber", "type"=>"text", "placeholder"=>"Extension Number"]);
		echo $this->element("br", NULL);
                echo $this->element("br", NULL);
		echo $this->element("button", ["name"=>"submit","class"=>"btn btn-primary", "type"=>"submit", "value"=>"submit"]);
		echo $this->endElement("form");
                echo $this->element("a", ["href"=>"index.php?page=login", "value"=>"Log In"]);
		echo $this->endElement("center");
            echo $this->endElement("div");
            echo $this->setupBootstrapEndDoc();
            echo $this->endElement("html");
        }
    }
    public function drawHomePage(){
        echo $this->element("h1", ["value"=>"TEST"]);
        echo $this->element("a", ["href"=>"index.php?page=logout","value"=>"log out"]);

    }
}
