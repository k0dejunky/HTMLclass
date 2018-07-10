<?php
class template {
	protected $data = "";
	public function HTML($element, $options){
		if($element == "br"){
			return "</".$element.">";
		}elseif($element == "form"){
			$this->data = "<".$element ." ";
			foreach ($options as $key => $value){
				$this->data .= $key."='".$value." '";
			}
			$this->data .= ">";
			return $this->data;
		}elseif($element == "input"){
			$this->data = "<".$element;
			foreach($options as $key => $value){
				$this->data .= $key."='".$value."' ";
			}
			$this->data .= "/>";
			return $this->data;
		}
		$this->data = "<".$element." ";
		foreach ($options as $key => $value){
			if($key == "value"){
					$this->data .= ">".$value."</".$element.">";
					return $this->data;
			}else{
				$this->data .= $key."='".$value."' ";
			}
		}
		$this->data .="></".$element.">";
		return $this->data;
	}
	public function endHTML($element){
		return "</".$element.">";
	}
}
?>
