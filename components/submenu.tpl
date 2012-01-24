{% if editmode %}
  {% for item in site.menuitems %}
    {% if item.selected? %}
      <ul id="submenu">
        {% for level2 in item.visible_children %}
          <li{% if level2.selected? %} class="active"{% endif %}{% unless level2.translated? %} class="untranslated"{% endunless %}>
            <a href="{{ level2.url }}"{% if level2.selected? %} class="active"{%else%}{% unless level2.translated? %} class="fci-editor-menuadd"{% endunless %}{% endif %}>{{ level2.title }}</a>
            {% if level2.selected? %}
              <ul>
                {% for level3 in level2.all_children %}
                  <li{% unless level3.translated? %} class="untranslated"{% endunless %}><a href="{{ level3.url }}"{% if level3.selected? %} class="active"{%else%}{% unless level3.translated? %} class="fci-editor-menuadd"{% endunless %}{% endif %}>{{ level3.title }}</a></li>
                {% endfor %}
                <li>{% menubtn level2.hidden_children %}</li>                      
                <li>{% menuadd parent="level2" %}</li>  
              </ul>
            {% endif %}
          </li>
        {% endfor %}
        <li>{% menubtn item.hidden_children %}</li>                    
        <li>{% menuadd parent="item" %}</li>
      </ul>
    {% endif %}
  {% endfor %}
{% else %}
  {% for item in site.menuitems %}
    {% if item.selected? and item.children? %}
      <ul id="submenu">
        {% for level2 in item.children %}
          <li{% if level2.selected? %} class="active"{% endif %}>
            <a href="{{ level2.url }}"{% if level2.selected? %} class="active"{% endif %}>{{ level2.title }}</a>
            {% if level2.children? and level2.selected? %}
              <ul>
                {% for level3 in level2.children %}
                  <li><a href="{{ level3.url }}"{% if level3.selected? %} class="active"{% endif%}>{{ level3.title }}</a></li>
                {% endfor %}
              </ul>
            {% endif %}
          </li>
        {% endfor %}
      </ul>
    {% endif %}
  {% endfor %}
{% endif %}
