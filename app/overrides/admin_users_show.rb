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
      <td><%= @user.referred.nil? ? 'Organic' : link_to(@user.referred.user.email, edit_admin_user_url(@user.referred.user)) %></td>
    </tr>
      <th>Referral code</th>
      <td><%= @user.referral.code %></td>
    <tr>
    <tr>
      <th>Users referred</th>
      <td>
        <%= "No referred users" if @user.referral.users.count == 0 %>
        <% @user.referral.users.each do |record| %>
          <p><%= link_to record.user.email, edit_admin_user_url(record.user) %></p>
        <% end %>
      </td>
    <tr>
  </tr>
</fieldset>
CODE
end
