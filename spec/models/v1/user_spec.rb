describe V1::User do
  describe 'when email is not present' do
    subject { build :user, email: '' }
    it { is_expected.to_not be_valid }
  end

  describe 'when email format is invalid' do
    subject { build :user, email: 'foo@barcom' }
    it { is_expected.to_not be_valid }
  end

  describe 'when email adresss is taken' do
    let(:user){ create :user }
    subject { build :user, email: user.email }

    it 'should not be valid' do
      expect{ subject.save }.to raise_error
    end
  end

  describe 'when password is not present' do
    subject { build :user, password: '' }
    it { is_expected.to_not be_valid }
  end

  describe 'with a password that is too short' do
    subject { build :user, password: 'a' * 5 }
    it { is_expected.to_not be_valid }
  end
end
