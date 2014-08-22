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
      <td><%= @user.referred_record.nil? ? 'Organic' : link_to(@user.referred_user.email, edit_admin_user_url(@user.referred_user)) %></td>
    </tr>
      <th>Referral code</th>
      <td><%= @user.referral.code %></td>
    <tr>
    <tr>
      <th>Users referred</th>
      <td>
        <%= "No referred users" if @user.referral_count == 0 %>
        <% @user.referral.referred_users.each do |user| %>
          <p><%= link_to user.email, edit_admin_user_url(user) %></p>
        <% end %>
      </td>
    <tr>
  </tr>
</fieldset>
CODE
end
