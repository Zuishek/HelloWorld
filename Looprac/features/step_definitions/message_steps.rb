

Given /^I am logged in as a user$/ do
	@current_user = User.create!(:username => 'user', :password => 'password', :email => 'email@student.guc.edu.eg')
	login_as(@current_user, :scope => :user)
end
When(/^I logout$/) do
  logout
end

When(/^I am logged in as a second user$/) do
  @current_user = User.create!(:username => 'user2', :password => 'password', :email => 'email2@student.guc.edu.eg')
	login_as(@current_user, :scope => :user)
end

Then(/^Number of unread message should be (\d+)$/) do |arg1|
  User.where(:username => 'user2').mailbox.inbox({:read => false}).count.should == arg1.to_i
end