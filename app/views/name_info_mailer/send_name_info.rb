Hello <%= @first_name %>,
Here's the info from Name Trivia!

Gender: <%= @gender_info[:gender] %>
Accuracy: <%= @gender_info[:probability] %>

List of famous people with the same name:
<% @famous_people.each do |person| %>
- <%= person[:name] %>: <%= person[:bio_url] %>
<% end %>

Best regards,
Your Application
