# frozen_string_literal: true

describe Subject, type: :model do
  subject { subject }
  let(:subject) { build(:subject) }

  it { is_expected.to be_valid }
  it { is_expected.to have_attribute(:name) }

  context 'assosiation' do
    it 'has many to many relationship with permision model' do
      expect(subject.permissions).to eq []
    end
    it 'has many to many relationship with group model' do
      expect(subject.users).to eq []
    end

  end
end
