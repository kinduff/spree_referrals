Deface::Override.new(
  :virtual_path => "spree/admin/users/edit",
  :name => "referral_fieldset",
  :insert_after => "[data-hook='admin_user_api_key']"
) do
<<-CODE.chomp
<fieldset>
  <legend>Referral Information</legend>
  <table>
    <tr>
      <th>Referred by</th>
      <td>
        <% if @user.referred? %>
          <%= link_to(@user.referred_user.email, edit_admin_user_url(@user.referred_user)) %>
        <% elsif @user.affiliate? %>
          <%= link_to(@user.affiliate.name, edit_admin_affiliate_url(@user.affiliate)) %>
        <% else %>
          Organic
        <% end %>
      </td>
    </tr>
      <th>Referral code</th>
      <td><%= @user.referral.code %></td>
    <tr>
    </tr>
      <th>Referred orders</th>
      <td>
        <%= "No referred orders" if @user.referral.referred_orders.count == 0 %>
        <ol style="margin-left: 20px;">
          <% @user.referral.referred_orders.each do |order| %>
            <li><%= link_to order.number, edit_admin_order_path(order) %></li>
          <% end %>
        <ol>
      </td>
    <tr>
    <tr>
      <th>Users referred</th>
      <td>
        <%= "No referred users" if @user.referral_count == 0 %>
        <ol style="margin-left: 20px;">
          <% @user.referral.referred_users.each do |user| %>
            <li><%= link_to user.email, edit_admin_user_url(user) %></li>
          <% end %>
        </ol>
      </td>
    <tr>
  </tr>
</fieldset>
CODE
end
