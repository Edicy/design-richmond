{% if site.search.enabled %}
<div id="search">
  <form action="" class="edys-search">
    <div>
      <input type="text" class="textbox edys-search-input" id="onpage_search" placeholder="{{ "search"|lc }}" />
      <input type="submit" class="submit" value="{{'search'|lc}}" />
    </div>
  </form>
</div>
{% endif %}
