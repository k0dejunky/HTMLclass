This is a PHP class that creates HTML strings depending on the input. The usage syntax is as follows:

$tmpl = new template();
$tmpl->element(elementName, AttributesArray);

ex:
$tmpl = new template();
echo $tmpl->element("div", ["id"=>"login", "name"=>"myLogin", "class"=>"center"]);
echo $tmpl->endElement("div");

The element function is capable of building any HTML element with the supplied options. 
