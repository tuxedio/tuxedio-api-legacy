describe V1::User do
  describe 'attributes' do
    it { is_expected.to respond_to :email }
    it { is_expected.to respond_to :password }
    it { is_expected.to respond_to :password_confirmation }
  end

  describe 'when email is not present' do
    subject { build :person_user, email: '' }
    it { is_expected.to_not be_valid }
  end

  describe 'when email format is invalid' do
    subject { build :person_user, email: 'foo@barcom' }
    it { is_expected.to_not be_valid }
  end

  describe 'when email adresss is taken' do
    let(:user){ create :person_user }
    subject { build :person_user, email: user.email }

    it 'should not be valid' do
      expect{ subject.save }.to raise_error
    end
  end

  describe 'when password is not present' do
    subject { build :person_user, password: '' }
    it { is_expected.to_not be_valid }
  end

  describe 'with a password that is too short' do
    subject { build :person_user, password: 'a' * 5 }
    it { is_expected.to_not be_valid }
  end
end
