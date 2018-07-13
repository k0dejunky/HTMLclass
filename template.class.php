<?php
class template {
        protected $data = "";
        protected $heldVALUE = "";
        protected $gotValueParm = 0;
        public function element($element, $options){
                if($options == NULL){
                        if($element == "br"){
                                return "</".$element.">";
                        }elseif($element == "center"){
                                return $this->data = "<".$element ." >";
                        }
                }else{
                        if($element == "form" || $element == "div"){
                                return $this->data = "<".$element ." ".$this->loop($options).">";
                        }elseif($element == "input"){
                                $this->data = "<".$element." ".$this->loop($options);
                                $this->data .= $this->endElement($element);
                                return $this->data;
                        }else{
                                $this->data = "<".$element." ".$this->loop($options);
                                if($this->gotValueParm == 1){
                                        return $this->data .= ">".$this->heldVALUE.$this->endElement($element);
                                }else{
                                        return $this->data .=">".$this->endElement($element);
                                }
                        }
                }
        }
        public function endElement($element){
                if($element == "input"){
                        return "/>";
                }else{
                        return "</".$element.">";
                }
        }
        private function loop($options){
                $info = "";
                foreach ($options as $key => $value){
                        if($key == "value"){
                                 $this->heldVALUE = $value;
                                 $this->gotValueParm = 1;
                         }else{
                                 $info .= $key."='".$value."' ";
                         }
                }
                return $info;
        }
}
?>
