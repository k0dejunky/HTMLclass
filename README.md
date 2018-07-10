This is a PHP class that creates HTML strings depending on the input. The usage syntax is as follows:

$tmpl = new template();
$tmpl->element(elementName, AttributesArray);

ex:
$tmpl = new template();
$options = array("id"=>"login", "name"=>"myLogin", "class"=>"center");
echo $tmpl->element("div", $options);
echo $tmpl->endElement("div");

The above code returns the following string:
  <div id='login' name='myLogin' class='center'></div>;

The element function is capable of building any HTML element with the supplied options. 
