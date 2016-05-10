require 'test_helper'

 class BarTest < ActiveSupport::TestCase
   def setup
     @bar = Bar.new(barname: "Prateek", email: 'pat@gmail.com')
   end

   test 'barname should be valid' do
     assert @bar.valid?
   end

   test 'barname should be present' do
     @bar.barname = " "
     assert_not @bar.valid?
   end

   test 'barname should not be too long' do
     @bar.barname = "a" * 41
     assert_not @bar.valid?
   end

   test 'barname should not be too short' do
     @bar.barname = "aa"
     assert_not @bar.valid?
   end

   test 'email should be present' do
     @bar.email = " "
     assert_not @bar.valid?
   end

   test 'email length should not be too long' do
     @bar.email = "a" * 101 + "@example.com"
     assert_not @bar.valid?
   end

   test 'email address should be unique' do
     dup_bar = @bar.dup
     dup_bar.email = @bar.email.upcase
     @bar.save
     assert_not dup_bar.valid?
   end

   test 'email validation should accept valid addresses' do
     valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.com.au laura+jones@monk.cm]
     valid_addresses.each do |va|
       @bar.email = va
       assert @bar.valid?, "#{va.inspect} should be valid"
     end
   end

   test 'email validation should reject invalid addresses' do
     invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_av_.com ]
     invalid_addresses.each do |ia|
       @bar.email = ia
       assert_not @bar.valid?, "#{ia.inspect}should be invalid"
     end
   end
 end
