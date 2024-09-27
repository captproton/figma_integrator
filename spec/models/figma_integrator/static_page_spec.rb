require 'rails_helper'

RSpec.describe FigmaIntegrator::StaticPage, type: :model do
  let(:account) { create(:account) }

  describe 'associations' do
    it { should belong_to(:account) }
    it { should belong_to(:design_template).optional }
  end

  describe 'validations' do
    subject { build(:static_page, account: account) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'friendly_id' do
    it 'generates a slug from the title' do
      page = create(:static_page, account: account, title: 'My New Page')
      expect(page.slug).to eq('my-new-page')
    end

    it 'ensures slug uniqueness within the same account' do
      create(:static_page, account: account, title: 'My Page')
      page2 = create(:static_page, account: account, title: 'My Page')
      expect(page2.slug).to match(/\Amy-page-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/)
    end

    it 'allows the same slug in different accounts' do
      account2 = create(:account)
      page1 = create(:static_page, account: account, title: 'My Page')
      page2 = create(:static_page, account: account2, title: 'My Page')
      expect(page1.slug).to eq('my-page')
      expect(page2.slug).to eq('my-page')
    end

    it 'updates the slug when the title changes' do
      page = create(:static_page, account: account, title: 'My Old Title')
      page.update(title: 'My New Title')
      expect(page.slug).to eq('my-new-title')
    end
  end

  describe 'scopes' do
    before do
      create(:static_page, :published, account: account)
      create(:static_page, account: account)
    end

    it 'returns published pages' do
      expect(FigmaIntegrator::StaticPage.published.count).to eq(1)
    end

    it 'returns draft pages' do
      expect(FigmaIntegrator::StaticPage.draft.count).to eq(1)
    end
  end

  describe '#publish' do
    let(:page) { create(:static_page, account: account) }

    it 'publishes the page' do
      expect { page.publish }.to change { page.published? }.from(false).to(true)
    end

    it 'sets the published_at timestamp' do
      expect { page.publish }.to change { page.published_at }.from(nil)
    end
  end

  describe '#unpublish' do
    let(:page) { create(:static_page, :published, account: account) }

    it 'unpublishes the page' do
      expect { page.unpublish }.to change { page.published? }.from(true).to(false)
    end

    it 'clears the published_at timestamp' do
      expect { page.unpublish }.to change { page.published_at }.to(nil)
    end
  end

  describe '#published?' do
    it 'returns true for published pages' do
      page = create(:static_page, :published, account: account)
      expect(page).to be_published
    end

    it 'returns false for draft pages' do
      page = create(:static_page, account: account)
      expect(page).not_to be_published
    end
  end
end
