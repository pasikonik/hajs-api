class AuthenticateUser
  prepend SimpleCommand

  def initialize(identificator, password)
    @identificator = identificator
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :identificator, :password

  def user
    user = User.find_by_email(identificator)
    return user if user&.authenticate(password)

    errors.add :auth, 'wrong indenticator or password'
    nil
  end
end
