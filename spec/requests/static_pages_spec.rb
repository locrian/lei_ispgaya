require 'spec_helper'

describe "Static Pages" do
  #let(:base_title) {"Ruby on Rails Tutorial Sample App"} <- no longer needed


  # Permits substitution of "page.should" and " do " in every statement
  # Before: it "should have the base title" do  
  #           page.should have_selector('title',  :text => "#{base_title}")
  #         end
  # After:  it {should have_selector('title',  :text => "#{base_title}")}  
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }     #Variable full_title needs to be defined in /spec/support/utilities.rb
  end

  # Substitutes the statement " visit root_path " after each "it .. do"
  describe "Home page" do
    before { visit root_path }
    let(:heading) {'Welcome to LEI @ ISPGaya'}
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it {should_not have_selector('title',  :text => '| Home') }
  end
 
  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    let(:page_title) {'Help'}

    it_should_behave_like "all static pages"
  
  end

  describe "About page" do
    before { visit about_path }
    let(:heading) {'About'}
    let(:page_title) {'About'}

    it_should_behave_like "all static pages"

  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading) {'Contact'}
    let(:page_title) {'Contact'}

    it_should_behave_like "all static pages"

  end

end
