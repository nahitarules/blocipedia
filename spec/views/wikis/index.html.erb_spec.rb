<h1>All Wikis</h1>
<% @wikis.each do |wiki| %>
  <div class="media">
    <div class="media-body">
      <h4 class="media-heading">
        <%= link_to wiki.title, wiki %>
      </h4>
    </div>
  </div>
<% end %>
