require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
sam = nil
begin
  sam = BestFriend.new('', 1, '')
rescue RuntimeError => e
  p e.message
end

# sam.talk_about_friendship
# sam.do_friendstuff
# sam.give_friendship_bracelet

begin
  brad = BestFriend.new('brad', 1, '')
rescue RuntimeError => e
  p e.message
end

begin
  david = BestFriend.new('david', 6, '')
rescue RuntimeError => e
  p e.message
end
