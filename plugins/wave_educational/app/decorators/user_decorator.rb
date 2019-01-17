User.class_eval do
  # # Decorators WaveEducational
  has_one :teacher, class_name: 'WaveEducational::Teacher'
end
