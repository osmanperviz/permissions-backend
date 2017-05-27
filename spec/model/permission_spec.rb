# frozen_string_literal: true

describe Permission, type: :model do
  subject { permission }
  let(:permission) { build(:permission) }

  it { is_expected.to be_valid }
  it { is_expected.to have_attribute(:name) }

  context 'assosiation' do
    it 'has many to many relationship with user model' do
      expect(subject.users).to eq []
    end
    it 'has many to many relationship with group model' do
      expect(subject.groups).to eq []
    end
    it 'has many to many relationship with subject model' do
      expect(subject.subjects).to eq []
    end
  end
end
