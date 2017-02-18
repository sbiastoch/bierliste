class User < ActiveRecord::Base
  has_many :entries

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name,
            presence: true,
            length: {minimum: 2, maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]*[a-z\d\-]\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: {minimum: 2, maximum: 50},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }, :allow_nil => true

  has_secure_password


  scope :all_for_lists, -> { where(here:true).sort_by { |u| %w{CB F iaCB Gast EM AH}.index(u.status) } }
  scope :cb, -> { where(status:'CB') }
  scope :adh, -> { where(adh:true) }
  scope :ao, -> { where(here:true) }

  def balance
    amounts = Entry.where(user: self).all.map(&:amount)
    sum = amounts.inject(:+) unless amounts.nil?
    balance = self.startsaldo + (sum||0)
    balance = 0 if balance.nil?
    balance
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def gast?
    self.status.eql? 'Gast' or
    self.status.eql? 'VG' or
    self.status.eql? 'SpeF'
  end

  def cb?
    self.status.eql? 'F' or
    self.status.eql? 'CK' or
    self.status.eql? 'idC' or
    self.status.eql? 'iaIdC' or
    self.status.eql? 'iaCB' or
    self.status.eql? 'CB'
  end

  def ah?
    self.status.eql? 'AH' or
    self.status.eql? 'EM' or
    self.status.eql? 'Kassenwart'
  end

  def haushealter?
    self.status.eql? 'Haushälter'
  end



  def fullname
    if self.gast?
      self.name
    elsif self.cb? or self.ah?
      self.status+' '+self.name
    else
      self.name
    end

  end


  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end