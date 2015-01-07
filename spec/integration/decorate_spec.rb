require 'spec_helper'

describe 'Decorate' do
  let(:article) { double('article') }
  it 'decorates properly' do
    allow(article).to receive(:title).and_return('Aslak')
    expect(ArticlePresenter.new(article).hello).to eq 'Hello, Aslak'
  end
end