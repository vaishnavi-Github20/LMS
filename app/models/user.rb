class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :role, presence: true, inclusion: { in: %w(admin librarian student) }
  # validates :role, presence: true, inclusion: { in: ['admin', 'librarian', 'student'] }
  validates :role, inclusion: { in: %w(admin librarian student), message: "must be either 'admin', 'librarian', or 'student'" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == 'admin'
  end

  def librarian?
    role == 'librarian'
  end

  def student?
    role == 'student'
  end

end
