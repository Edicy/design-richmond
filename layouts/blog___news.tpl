<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="{{ page.language_code }}">

<head>
  {% include "SiteHeader" %}
  {{ blog.rss_link }}
</head>

<body>
   <div id="wrap" class="content-hyphenate">
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
        <div class="quotebox">
          <div class="quotebox-inner clearfix">
            {% include "MobileMenus" %}
            <div id="sidebar">
              {% include "Submenu" %}
            </div> <!-- //sidebar -->
        
            <div id="content">
                {% if tags %}
                    <div class="tagged-list-header">
                        <div class="header-tag-icon"></div>
                        {% if tags == empty %}
                            {{ "no_posts_tagged" | lc }}
                        {% else %}
                            {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                        {% endif %}
                    </div>
                {% endif %}
            
              {% addbutton class="add-article" %}
              
              {% for article in blog.articles %}
              <div class="newsbox{% if forloop.first%} newsbox-first{% endif %}">
                <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>
                <div class="news-info">{{ article.created_at | format_date: "short" }}  &#8226;  {{ article.author.name }} &#8226; <a href="{{ article.url }}#comments">{{ "comments_for_count"|lc }}: {{ article.comments_count }}</a></div>
                  {{ article.excerpt }} <a href="{{ article.url }}" class="read-more">{{ "read_more"|lc}} &raquo;</a>
              </div> <!-- //news-block -->
              {% endfor %}
              
            </div> <!-- //content -->
          </div> <!-- //quotebox-inner -->
        </div> <!-- //quotebox -->
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
