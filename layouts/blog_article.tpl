<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  {% include "SiteHeader" %}
  {{ blog.rss_link }}
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
        <div class="quotebox">
          <div class="quotebox-inner clearfix">
            {% include "MobileMenus" %}
            <div id="sidebar">
              {% include "Submenu" %}
            </div> <!-- //sidebar -->
        
            <div id="content">
              <div class="newsbox newsbox-first">
                <h1>{% editable article.title %}</h1>
                <div class="news-info">{{ article.created_at | format_date : "short" }}  &#8226;  {{ article.author.name }} &#8226; <a href="{{ article.url }}#comments">{{ "comments_for_count"|lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a></div>
                <div class="excerpt">
                  {% editable article.excerpt %}
                </div>
                {% editable article.body %}
              </div> <!-- //news-block -->
             
              {% if article.comments_count > 0 %}
              <div id="comments">
                
                <h2>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>
                <a name="comments"></a>
                {% for comment in article.comments %}
                <div class="comment{% if forloop.first %} comment-first{% endif %} clearfix edy-site-blog-comment">
                  <div class="comment-nr">{{ forloop.index }}</div>
                  <div class="comment-content">
                    {{ comment.body }}
                    <div class="comment-info">
                     {% removebutton %} {{ comment.created_at | format_date : "short" }} &nbsp;&#8226;&nbsp; {{ comment.author }}
                    </div> <!-- //comment-info -->
                  </div> <!-- //comment-content -->
                </div> <!-- //comment -->
                {% endfor %}

                
              </div> <!-- //comments -->
              {% endif %}
              
              <div id="add-comment">
                <h3>{{"add_a_comment"|lc}}</h3>
                {% commentform %}
                {% unless comment.valid? %}
                  <ul>
                  {% for error in comment.errors %}
                    <li>{{ error | lc }}</li>
                  {% endfor %}
                  </ul>
            
                {% endunless %}
                <div class="add-comment-inner">
                  {{"name"|lc}}<br />
                  <input type="text" class="textbox" name="comment[author]" value="{{comment.author}}" />
                </div> <!-- //add-comment-inner -->
                <div class="add-comment-inner">
                  {{"email"|lc}} <br />
                  <input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" />
                </div> <!-- //add-comment-inner -->
                <div class="add-comment-inner">
                  {{"comment"|lc}}<br />
                  <textarea name="comment[body]" cols="58" rows="6" class="textarea">{{comment.body }}</textarea>
                </div> <!-- //add-comment-inner -->
                <div class="add-comment-inner" style="text-align: center">
                  <input type="submit" value="{{"add_a_comment"|lc}}" class="submit" />
                </div> <!-- //add-comment-inner -->
                {% endcommentform %}
              </div> <!-- //add-comment -->
              
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
  {% unless editmode %}{{ site.analytics }}{% endunless %}
  {% include "JS" %}
</body>
</html>
