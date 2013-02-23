require "spec_helper"

describe "an ActiveRecord model which includes ArValidations" do

  with_model :ModelWithArValidations do
    table do |t|
      t.string 'title', null: false
      t.text 'content'
      t.integer 'importance'
    end

    model do
      include ArValidations
    end
  end
  subject { ModelWithArValidations.new }

  describe "validates presence" do
    it "set true if null->false" do
      should have_valid(:title).when 'something'
      should_not have_valid(:title).when('', nil)
    end

    it "not set if null->true" do
      should have_valid(:content).when('', nil)
    end
  end
end
