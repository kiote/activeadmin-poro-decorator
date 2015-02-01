require 'spec_helper'

describe 'ArticlePresenter' do
  it 'delegates :all to Article' do
    expect(ArticlePresenter.all.class).to eq(Article::ActiveRecord_Relation)
  end

  it 'builds default scope' do
    expect(ArticlePresenter.build_default_scope).to eq nil
  end
end