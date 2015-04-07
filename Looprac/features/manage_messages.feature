Feature: Manage messages

Scenario: User can view his messages
Given I am logged in as a user
And I am on the welcome page
When I follow "Inbox"
Then I should be on the messages page

Scenario: User can go to send a new message
Given I am logged in as a user
And I am on the messages page
When I follow "New Message"
Then I should be on the new message page

Scenario: User can send a message to another user
Given I am logged in as a user
And I am on the new message page
When I fill in "recipients" with "user2"
And I fill in "message[subject]" with "Test"
And I fill in "message[body]" with "Hello"
And I press "Send"
And I logout
And I am logged in as a second user
Then Number of unread message should be 1