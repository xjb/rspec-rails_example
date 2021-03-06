require '<%= File.exists?('spec/rails_helper.rb') ? 'rails_helper' : 'spec_helper' %>'

RSpec.describe <%= class_name %>Decorator, type: :decorator do
  let(:<%= singular_name %>) { <%= class_name %>.new.extend <%= class_name %>Decorator }
  subject { <%= singular_name %> }
  it { should be_a <%= class_name %> }
end
