require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # Initial test to ensure that when all fields are present, user is created
    it 'should create a new user when all fields are added' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'test@email.com',
        password: 'supercoolpassword',
        password_confirmation: 'supercoolpassword'
      )
      expect(@user).to be_valid
    end

    #1. Validates that user has a first name
    it 'should not be valid without a first name' do
      @user = User.new(
        first_name: nil,
        last_name: 'Last',
        email: 'test@email.com',
        password: 'supercoolpassword',
        password_confirmation: 'supercoolpassword'
      )
      expect(@user).to_not be_valid
    end

    #2. Validates that user has a last name
    it 'should not be valid without a last name' do
      @user = User.new(
        first_name: 'First',
        last_name: nil,
        email: 'test@email.com',
        password: 'supercoolpassword',
        password_confirmation: 'supercoolpassword'
      )
      expect(@user).to_not be_valid
    end

    #3. Validates that user has an email
    it 'should not be valid without an email' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: nil,
        password: 'supercoolpassword',
        password_confirmation: 'supercoolpassword'
      )
      expect(@user).to_not be_valid
    end

    #4. Validates that user has a password
    it 'should not be valid without a password' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'test@email.com',
        password: nil,
        password_confirmation: 'supercoolpassword'
      )
      expect(@user).to_not be_valid
    end

    #5. Validates that user has a password confirmation
    it 'should not be valid without a password confirmation' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'test@email.com',
        password: 'supercoolpassword',
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
    end

    #6. It should throw an error when password and password confirmation do not match
    it 'should not be valid if password is different' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'test@email.com',
        password: 'supercoolpassword',
        password_confirmation: 'badpassword'
      )
      expect(@user).to_not be_valid
    end

    #7. Validates that the email should be unique (but not case-sensitive)
    it 'should not be valid if new user with same email is created' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'test@email.com',
        password: 'supercoolpassword',
        password_confirmation: 'supercoolpassword'
      )

      @user.save

      @userTwo = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'TEST@email.com',
        password: 'supercoolpassword',
        password_confirmation: 'supercoolpassword'
      )
      expect(@user).to be_valid
      expect(@userTwo).to_not be_valid
      expect(@userTwo.errors.full_messages).to eq ["Email has already been taken"]
    end

    #8. Validates that the password meet the minimum length of 10 characters 
    it 'should not be valid if password is less than 10 characters' do
      @user = User.new(
        first_name: 'First',
        last_name: 'Last',
        email: 'test@email.com',
        password: 'pwd',
        password_confirmation: 'pwd'
      )
      expect(@user).to_not be_valid
    end
  end
end
