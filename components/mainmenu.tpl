<div id="mainmenu">
<ul>
  {% unless site.root_item.hidden? %}<li{% if site.root_item.current? %} class="active active-last"{% endif %}><div><a href="{{ site.root_item.url }}">{{site.root_item.title}}</a></div></li>{% endunless %}
  
  {% if editmode %}
    {% for item in site.visible_menuitems %}
      <li{% if item.translated? %}{% if item.selected? %} class="active"{% endif %}{% else %} class="untranslated"{% endif %}><div><a href="{{ item.url }}"{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{ item.title }}</a></div></li>
    {% endfor %}

  {% else %}
    {% for item in site.visible_menuitems %}
      <li{% if item.selected? %} class="active{% if forloop.last %} active-first{% endif%}"{% endif %}><div><a href="{{ item.url }}">{{ item.title }}</a></div></li>
    {% endfor %}
  {% endif %}
  {% if editmode %}<li><div>{% menubtn site.hidden_menuitems %}</div></li>{% endif %}        
  {% if editmode %}<li><div>{% menuadd %}</div></li>{% endif %}
  
  
</ul> <!-- //mainmenu -->
</div>
