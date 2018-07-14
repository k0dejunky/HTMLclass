This is a PHP class that creates HTML strings depending on the input. The usage syntax is as follows:

$tmpl = new template();
$tmpl->element(elementName, AttributesArray);

ex:
$tmpl = new template();
echo $tmpl->element("div", ["id"=>"login", "name"=>"myLogin", "class"=>"center"]);
echo $tmpl->endElement("div");

if you are using an element that doesn't have any attributes use the following syntax:

ex:
echo $tmpl->("br", NULL);

The element function is capable of building any HTML element with the supplied options or NULL. 
