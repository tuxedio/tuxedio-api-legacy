Before('@explore') do
  load File.join(Rails.root,'db', 'explore_test_seeds.rb')
end

After('@paperclip') do
  FileUtils.rm_rf(Dir["#{Rails.root}/features/test_files/"])
end
