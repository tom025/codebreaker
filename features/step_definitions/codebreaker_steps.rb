def messenger
  @messenger ||= StringIO.new
end

def game
  @game ||= Codebreaker::Game.new(messenger)
end

def messages_should_include(message)
  messenger.string.split("\n").should include(message)
end


def fixnum_from(string)
  string.scan(/\d/).join.to_i
end


Given /^I am not yet playing$/ do
end


Given /^the secret code is (. . . .)$/ do |code|
  game.start(stub('generator', :code => code.split))
end


When /^I guess (. . . .)$/ do |code|
  game.guess(code.split)
end


When /^I start a new game$/ do
  game.start(stub('generator', :code => %[r g y c]))
end


Then /^I should see "([^\"]*)"$/ do |message|
  messages_should_include(message)
end

Then /^the mark should be (.*)$/ do |mark|
  messages_should_include(mark)
end

Given /^6 colors$/ do
end

Given /^4 positions$/ do
end



When /^I play (.*) games$/ do |number|
  generator = Codebreaker::Generator.new
  fixnum_from(number).times do
    game.start(generator)
  end
end

Then /^each color should appear between 1500 and 1800 times in each position$/ do
  pending
end

Then /^each color should appear no more than once in each secret code$/ do
  pending
end
