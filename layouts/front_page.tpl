<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="page.language_code">

<head>
  {% include "SiteHeader" %}
</head>

<body>
  <div id="wrap">
    <div id="header">
      <div class="wrap clearfix">
        <div id="logo" class="clearfix">
          {% editable site.header %}
        </div>
        {% include "Mainmenu" %}
      </div> <!-- //wrap -->
    </div> <!-- //header -->

    <div id="container">
      <div class="wrap clearfix">
        <div id="container-left">
          <img src="{{ images_path }}/image.jpg?1" alt="" />
        </div> <!-- //container-left -->
        <div id="container-right">
          <div class="container-right-inner" data-search-indexing-allowed="true">
            {% content %}
          </div> <!-- //container-right-inner -->
          <div class="colored-box" data-search-indexing-allowed="true">
            {% content name="a" %}
          </div> <!-- //colored-box -->
        </div> <!-- //container-right -->
      </div> <!-- //wrap -->
    </div> <!-- //container -->
    <div id="bottom">
      <div class="bottom-top"><div></div></div>
      <div class="bottom-middle">
        <div class="wrap clearfix">
          {% include "Langmenu" %}
          {% include "Search" %}
        </div> <!-- //wrap -->
      </div> <!-- //bottom-middle -->
      <div class="bottom-btm"><div></div></div>
    </div> <!-- //bottom -->
    <div id="footer">
      <div class="wrap">
        {% xcontent name="footer" %}
      </div> <!-- //footer -->
    </div> <!-- //footer -->
    <div id="edicy">
      {% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}
    </div> <!-- //edicy -->
  </div> <!-- //wrap -->
  {% include "JS" %}
</body>
</html>
