require "spec_helper"

class Comment < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  include ActsAsRandomId::ModelAdditions

  acts_as_random_id
end

class Payment < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  include ActsAsRandomId::ModelAdditions

  acts_as_random_id :field => :secure_identifier do
    Time.now.to_i
  end
end

class Group < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  include ActsAsRandomId::ModelAdditions

  acts_as_random_id do
    rand(9) + 1
  end
end

class Article < SuperModel::Base
  include ActiveModel::Validations::Callbacks
  include ActsAsRandomId::ModelAdditions

  acts_as_random_id do
    Time.now.to_i
  end
end

describe ActsAsRandomId::ModelAdditions do

  it "adds id upon saving" do
    Comment.create!.id.should_not be_nil
    Group.create!.id.should_not be_nil
    Article.create!.id.should_not be_nil
    Payment.create!.secure_identifier.should_not be_nil
  end

  it "in rage 1..9" do
    9.times do
      (1..9).should include(Group.create.id)
    end
  end

  it "Time.now generator" do
    Article.create.id.should eql(Time.now.to_i)
  end

  it "assign custom field" do
    Payment.create.secure_identifier.should eql(Time.now.to_i)
  end

end
